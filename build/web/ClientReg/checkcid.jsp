<%-- 
    Document   : checkcid
    Created on : 11-Jun-2014, 08:13:30
    Author     : win 8
--%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  String cid=request.getParameter("cid");
  String sid=request.getParameter("sid");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
 
  
   try
   {
        
      Statement st=cn.createStatement();
      ResultSet rs;
      rs=st.executeQuery("select id from admintable where id="+cid+" and isused='NO'");
      if(cid.compareTo(sid)==0)
       {
           out.println("false");
       } 
      

       if(rs.next())
       { 
            
         /*   ServletContext cn1=getServletContext();
            String str=cn1.getRealPath("user_images")+"\\"+cid;
            File f=new File(str);
            f.mkdir();
            File f1=new File(str+"\\"+"profilepic");
            f1.mkdir();
           // String str1=cn1.getRealPath("web")+"\\user.jpg";
            //out.println(str1);
            File inputfile=new File("F:\\Ad Java Apr\\CityCrownGUI1\\web\\user.jpg");
            File outputfile = new File(str+"\\"+"profilepic\\user.jpg");
            BufferedImage image=ImageIO.read(inputfile);
            ImageIO.write(image, "jpg", outputfile); */
            out.println("true");
           
       }
       else
       {
        
          out.println("false");
          
          
       }
      
   } //end of try

    finally
   {
     cn.close();
   }
%>    
    
