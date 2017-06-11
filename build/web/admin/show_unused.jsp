<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
            String ptype=request.getParameter("plan");
            int i;
            String guid="",qry,result="";
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            PreparedStatement ps=cn.prepareStatement("select id from admintable where isused='NO' and id like '"+ptype+"%'");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
              result=result+"<li class='text3' type='square'>"+rs.getString(1)+"</li>";  
            }
            out.println(result);

%>