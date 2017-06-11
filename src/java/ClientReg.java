import MyPack.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;


@MultipartConfig
public class ClientReg extends HttpServlet 
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
            String id=request.getParameter("cid");
            String sponserid=request.getParameter("sid");
            String password=request.getParameter("pass"); 
            String ctype=request.getParameter("ctype");
            String name=request.getParameter("name");
            String address=request.getParameter("address").trim();
            String phone=request.getParameter("pno");
            String dob=request.getParameter("dob");
            String nominee=request.getParameter("nom");
            String email=request.getParameter("mail");
            String find_p=sponserid,find_p1;
            String msg="Thank You "+name+" for registering with CityCrown!! \n You are now a CityCrown Business Owner \n";
            msg=msg+"Your Id : "+id+"\n Your Sponsor Id : "+sponserid;
            msg=msg+"\n Registered Email Address : "+email+"\n Registered Phone Number : "+phone;
            msg=msg+"\n Being a CityCrown Business Owner(CBO) now your are liable for distributorship profit and various other services of our company \n";
            msg=msg+"Your Login Details for Client Portal are as Under \n";
            msg=msg+"Password : "+password;
           // String remoteAddr = request.getRemoteAddr();
		/*ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY");
                String challenge = request
				.getParameter("recaptcha_challenge_field");
		String uresponse = request.getParameter("recaptcha_response_field");
		ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(
				remoteAddr, challenge, uresponse);

		if (!reCaptchaResponse.isValid()) {
			
			//out.println("CAPTCHA Validation Failed!");
                        response.sendRedirect("ClientReg/failure.jsp");
                       
		}
                else{
            */
            URLConnection myURLConnection=null;
                URL myURL=null;
                 BufferedReader reader=null;
                 String gcaptcha=request.getParameter("g-recaptcha-response");
                 String remoteAddr = request.getRemoteAddr();
    String mainUrl=" https://www.google.com/recaptcha/api/siteverify?secret=6LcD3wQTAAAAABLFYL2hB5SSDD3KuNyIfz_pJCkH&response="+gcaptcha+"&remoteip="+remoteAddr;

 myURL = new URL(mainUrl);
    myURLConnection = myURL.openConnection();
    myURLConnection.connect();
    reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
    //reading response 
    String respon,res="";
    while ((respon = reader.readLine()) != null)
        res=res+respon;

		if (res.contains("false")) {
			
			//out.print("CAPTCHA Validation Failed! Try Again.");
                    response.sendRedirect("ClientReg/failure.jsp");
		} 
                else{
            Part filePart = request.getPart("sel");
            InputStream imageInputStream = filePart.getInputStream();
            ServletContext sc=getServletContext();
            String path=sc.getRealPath("user_images");
            filePart.write(path+"\\"+id+"\\profilepic\\user.jpg");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            PreparedStatement p=c.prepareStatement("insert into regtable values(?,?,?,?,?,?,?,?,?,?,?,?)");
            ResultSet rs;
            p.setString(1, id);
            p.setString(2, sponserid);
            p.setString(3, "OPEN");
            p.setString(4, "OPEN");
            p.setString(5, "OPEN");
            p.setString(6, name);
            p.setString(7, address);
            p.setString(8, phone);
            p.setString(9, dob);
            p.setString(10, nominee);
            p.setString(11, password);
            p.setString(12,email);
            p.executeUpdate();
            
            do
            {
             find_p1=find_p;
             p=c.prepareStatement("select "+ctype+" from regtable where id=?");
             p.setString(1, find_p1);
             rs=p.executeQuery();
             if(rs.next())
             {
                find_p=rs.getString(1);
             }
          }while(find_p.equals("OPEN")==false);
            
        
            p=c.prepareStatement("update regtable set parent=? where id=?");
            p.setString(1, find_p1);
            p.setString(2, id);
            p.executeUpdate();
            
            p=c.prepareStatement("update regtable set "+ctype+"=? where id=?");
            p.setString(1, id);
            p.setString(2, find_p1);
            p.executeUpdate();
            c.close();
            
           
             
            Connection c1=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            PreparedStatement p1=c1.prepareStatement("update admintable set isused='YES' where id=?");
            p1.setString(1,id);
            p1.executeUpdate();
            new email_service().send_email(email,msg,"Welcome To CityCrown!!");
            
        //    response.sendRedirect("fileupload.jsp?sel="+sel); 
            response.sendRedirect("ClientLogin/client_login.jsp");
       }//end of else 
        }//end of try
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
