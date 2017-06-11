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
public class AdminClientUpdate extends HttpServlet 
{
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
     //  response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       Collection<Part> parts = request.getParts();
       //---------------
        try 
        {
            String id=request.getParameter("id");
            String name=request.getParameter("name");
            String address=request.getParameter("address").trim();
            String phone=request.getParameter("pno");
            String nom=request.getParameter("nom");
            String email=request.getParameter("mail");
        
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
            PreparedStatement p=c.prepareStatement("update regtable set name=?,nominee=?,email=?,phone=?,address=? where id=?");
            
            p.setString(1,name);
            p.setString(2,nom);
            p.setString(3,email);
            p.setString(4,phone);
            p.setString(5,address);
            p.setString(6,id);
            p.executeUpdate();
           
            c.close();
            response.sendRedirect("admin/edit_record.jsp");
       
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