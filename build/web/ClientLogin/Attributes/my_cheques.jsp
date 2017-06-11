<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown | View Cheques</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/cufon-yui.js"></script>
<script src="js/cufon-replace.js"></script>
<script src="js/Vegur_500.font.js"></script>
<script src="js/Ropa_Sans_400.font.js"></script>
<script src="js/FF-cash.js"></script>
<script src="js/script.js"></script>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<![endif]-->
</head>
<body id="page2" onload="noBack()">
    <%
   if(session.getAttribute("id")==null)
   { 
       response.sendRedirect("../../index.jsp");
   } 
   else {
%>
<header>
  <div class="border-bot">
    <div class="main">
      <h1><a href="index.jsp"><img src="images/logo.png" alt=""></a></h1>
      <nav>
        <ul class="menu">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="edit_profile.jsp">Edit Profile</a></li>
          <li><a href="show_tree.jsp?id=<%=session.getAttribute("id").toString()%>">Show Tree</a></li>
          <li><a class="active" href="my_cheques.jsp">My Cheques</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
      <div class="clear"></div>
    </div>
  </div>
</header>
          <%
            String query;
            int i=0;
            String id=session.getAttribute("id").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            query="select * from cheques where id=?";
            PreparedStatement ps=c.prepareStatement(query);
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery(); %>
            <h3>Generated Cheques</h3>
            <div style="margin-left: 150px; margin-right: 200px;">
            <table width="100%" border="2">
                <tr style="background-color: moccasin;">
                    <th>S. No</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Paid</th>
                </tr>
            <% 
            while(rs.next())
            {
     %>    <%    if(rs.getString(4).equals("NO"))
               { %>
                <tr style="background-color: #ccffff">
               <% }
               else
               {  %> 
                <tr style="background-color: #ffccff;">
               <% }%>
                    <td><%=++i%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
               <%    if(rs.getString(4).equals("NO"))
               { %>
                      <td>YES</td>
               <% }
               else
               {  %> 
                        <td>NO</td>
                <% }%>        
                </tr>
                <%
            }
   }
  %>   
            </table> 
            </div>
    </body>
</html>

