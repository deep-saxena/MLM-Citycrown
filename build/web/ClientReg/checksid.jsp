<%-- 
    Document   : checksid
    Created on : 11-Jun-2014, 07:57:02
    Author     : win 8
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%  String sid=request.getParameter("sid");
  Class.forName("com.mysql.jdbc.Driver");
  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");

  
   try
   {
        Statement st=cn.createStatement();
        ResultSet rs;
       rs=st.executeQuery("select id from admintable where id="+sid+" and isused='YES'");
       
       if(rs.next())
       { 
           
           out.println("true");
         //  session.setAttribute("ses1",sid);
        }
       else
       {
          out.println("false");
       }
       
   } //end of try
   catch(Exception e)
   {
       out.println(e.getMessage());
   }
    finally
   {
   
    cn.close();
   }
   %>
    