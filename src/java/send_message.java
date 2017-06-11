/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.net.URLConnection;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.net.URL;

/**
 *
 * @author Ayush Upadhyaya
 */
public class send_message extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection cn=null;
        String id="",mob="",message="";
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            cn= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from regtable");
            while(rs.next())
            { id=rs.getString(1).trim();
               mob=rs.getString("phone").trim();
              if(request.getParameterValues(id)!=null)
              {
                
                //Your authentication key
                String authkey = "1886AF7ObhHigzT5353941f";
                //Multiple mobiles numbers seperated by comma
                String mobiles = "9458703266";
                //Sender ID,While using route4 sender id should be 6 characters long.
               String senderId = "ASMANT";
                 //Your message to send, Add URL endcoding here.
                 message = request.getParameter("msg").trim();
                  //define route
                String route="promo";
                  //Prepare Url
                URLConnection myURLConnection=null;
                URL myURL=null;
                 BufferedReader reader=null;
                   //encoding message 
                 String encoded_message=URLEncoder.encode(message);
                  //Send SMS API
             String mainUrl="http://www3.almsms.com/sendhttp.php?authkey=9034Ab1J9wXsK153528556&mobiles="+mob+"&message="+encoded_message+"&route=NONDND&sender=ALMSMS";
             try
           {
    //prepare connection
    myURL = new URL(mainUrl);
    myURLConnection = myURL.openConnection();
    myURLConnection.connect();
    reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
    //reading response 
    String respon;
    while ((respon = reader.readLine()) != null) 
    //print response 
    response.sendRedirect("admin/message_confirmation.jsp");
    
    //finally close connection
    reader.close();
} 
catch (Exception e) 
{ 
	e.printStackTrace();
} 
           
                
                
                
                
                
              
              }
            
            
            }
          
            
            
        }
        
        catch(Exception ex)
        {
           out.println(ex.getMessage());        
        }
        
        finally {            
            out.close();
        }
    }
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
