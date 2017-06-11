<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    String pass=request.getParameter("pass");
    String id=(String)session.getAttribute("id");
     Class.forName("com.mysql.jdbc.Driver");
     Connection c=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
     PreparedStatement p=c.prepareStatement("update regtable set password=? where id=?");
     p.setString(1,pass);
     p.setString(2,id);
     p.executeUpdate();
     session.setAttribute("pass",pass);
     out.println("Done"); 
    
%>

