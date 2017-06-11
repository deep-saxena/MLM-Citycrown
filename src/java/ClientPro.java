import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class ClientPro extends HttpServlet 
{
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       // response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       Collection<Part> parts = request.getParts();
       //---------------
        try 
        {
            HttpSession hs=request.getSession();
            String id=hs.getAttribute("id").toString();
            //String name=request.getParameter("name");
            String address=request.getParameter("address").trim();
            String phone=request.getParameter("pno");
            String nom=request.getParameter("nom");
            //String email=request.getParameter("mail");
            
            
            Part filePart = request.getPart("sel");
            InputStream imageInputStream = filePart.getInputStream();
            if(imageInputStream.toString().contains("java.io.FileInputStream"))
            {
             ServletContext sc=getServletContext();
             String path=sc.getRealPath("user_images");
             filePart.write(path+"\\"+id+"\\profilepic\\user.jpg");
            }
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            PreparedStatement p=c.prepareStatement("update regtable set nominee=?,phone=?,address=? where id=?");
            
           // p.setString(1,name);
            p.setString(1,nom);
            //p.setString(3,email);
            p.setString(2,phone);
            p.setString(3,address);
            p.setString(4,id);
            p.executeUpdate();
            //hs.setAttribute("name",name);
            c.close();
            response.sendRedirect("ClientLogin/Attributes/edit_profile.jsp");
       
        } 
        catch(Exception e)
        {
            out.println(e.getMessage());
        }                
        finally 
        {
            out.close();
        }
    }

    
  

   
}