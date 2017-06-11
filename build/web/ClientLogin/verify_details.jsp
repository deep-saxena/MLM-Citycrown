<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
   String id,pass;
   id=request.getParameter("id");
   pass=request.getParameter("pass");
   Connection cn=null;
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
       PreparedStatement ps=cn.prepareStatement("select * from regtable where id=? and password=?");
       ps.setString(1,id);
       ps.setString(2,pass);
       ResultSet rs=ps.executeQuery();
       if(rs.next())
       {
           session.setAttribute("id", id);
                session.setAttribute("name", rs.getString(6));
                session.setAttribute("pass", pass);
                
            out.println("Done");
       }
       else
       {
           out.println("Not Done");
       }
   }
   catch(Exception e)
   {
      out.println(e.getMessage());
   }
   finally
   {
       cn.close();
   }
  
%>
