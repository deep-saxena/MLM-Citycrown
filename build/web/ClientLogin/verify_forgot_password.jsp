<%@page import="java.sql.*"%>
<%@page import="MyPack.*"%>

<%
    String cid,email,pno;
    cid=request.getParameter("cid");
    email=request.getParameter("eid");
    pno=request.getParameter("pno");
     Class.forName("com.mysql.jdbc.Driver");
     Connection c=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
     if(cid.length()!=10||email.length()==0||pno.length()!=4)
     {   c.close(); 
         out.println("false");
     
     }
     else
     {
     PreparedStatement p=c.prepareStatement("select * from regtable where id=?");
     p.setString(1,cid);
     ResultSet rs=p.executeQuery();
       if(rs.next())
       {  String pass=rs.getString("password");
           String pno1=rs.getString("phone");
         String eid=rs.getString("email");
         String pno2=pno1.substring(6, pno1.length());
          if(pno2.equalsIgnoreCase(pno)&&eid.equalsIgnoreCase(email))
          {   String message="Your Password for your account id-"+cid+" is : "+pass+"\n";
              new email_service().send_email(eid,message,"Password Details");
              out.println("true");
          
          }
          else
           out.println("false");
       }
       else{out.println("false");}
     c.close();
     }
     




%>