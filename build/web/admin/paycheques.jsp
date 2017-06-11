<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String[] chq; 
    Class.forName("com.mysql.jdbc.Driver");
    Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
    String query;
    PreparedStatement ps;
    chq= request.getParameter("str").split(" ");
   if (chq != null) 
   {
      for (int i = 0; i < chq.length; i++) 
      {
          query="update cheques set pending='NO' where sno="+Integer.parseInt(chq[i]);
           ps=c.prepareStatement(query);
            ps.executeUpdate();
      }
   }
   out.println("Done");
%>
