<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown-Administrator</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/ie6_script_other.js"></script>
<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
<script>
    
    var x;        
    var y;
    //client_id
            function f1(str1)
            {
               var cname=document.getElementById("cname").value;
               y= new XMLHttpRequest();
               var url1="check1.jsp?cc1="+str1+"&cname="+cname;
               y.open("GET",url1,true);
               y.onreadystatechange=fun1;
               y.send(null);
             }
             function fun1()
            {
                if(y.readyState===4)
                {
            document.getElementById("tab").innerHTML=y.responseText;
                $(function() {
           $("#tab tr:even").addClass("stripe1");
           $("#tab tr:odd").addClass("stripe2");
           $("#tab tr").hover(
                   function() {
                       $(this).toggleClass("highlight");
                   },
                   function(){
                       $(this).toggleClass("highlight");
                   }
                 );
              });
                document.getElementById("b").innerHTML="";    
                }
                else
                {
                    
                    document.getElementById("b").innerHTML="waiting.....";
                }
                
            }
   //name 
            function f2(str)
            {
              var cid=document.getElementById("cid").value;
               x= new XMLHttpRequest();
               var url="check.jsp?cc="+str+"&cid="+cid;
               x.open("GET",url,true);
               x.onreadystatechange=fun2;
               x.send(null);
             }
             function fun2()
            {
                if(x.readyState===4)
                {
            
                    document.getElementById("tab").innerHTML=x.responseText;
                     $(function() {
           $("#tab tr:even").addClass("stripe1");
           $("#tab tr:odd").addClass("stripe2");
           $("#tab tr").hover(
                   function() {
                       $(this).toggleClass("highlight");
                   },
                   function(){
                       $(this).toggleClass("highlight");
                   }
                 );
              });
                    document.getElementById("b").innerHTML="";
                }
                else
                {
                    
                    document.getElementById("b").innerHTML="waiting.....";
                }
                
            }
             window.history.forward();
    function noBack() { window.history.forward(); }

       $(function() {
           $("#tab tr:even").addClass("stripe1");
           $("#tab tr:odd").addClass("stripe2");
           $("#tab tr").hover(
                   function() {
                       $(this).toggleClass("highlight");
                   },
                   function(){
                       $(this).toggleClass("highlight");
                   }
                 );
              });
    </script>
    <style>
        .stripe1
        {
            background-color: #ffccff;  
        }
        .stripe2
        {
           background-color: paleturquoise;  
        }
        .highlight
        {
            background-color: #FF6;
            
                
        }
    </style>
    </head>
    <body id="page1" onload="noBack()" class="body1">
<%
   if(session.getAttribute("admin")==null)
   { response.sendRedirect("../index.jsp"); } 
%>
<div class="body3"></div>
<div class="body1">
  <div class="main">
    <header>
      <div id="logo_box">
        <h1><a href="#" id="logo">CityCrown-Administrator <span>We Manage Clients!!!</span></a></h1>
      </div>
      <nav>
        <ul id="menu">
          <li><a href="index.jsp">Generate IDs</a></li>
          <li id="menu_active"><a href="edit_record.jsp">Edit A Record</a></li>
          <li><a href="viewpendingcheques.jsp">View Pending Cheques</a></li>
          <li><a href="viewallcheques.jsp">View All Cheques</a></li>
          <li><a href="../gen">Generate Cheques</a></li>
          <li><a href="company_messages.jsp">Company Messages</a></li>
          <li class="bg_none"><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
         </header>
  </div>
    <div style="margin-left: 150px;">    
        <b>FILTER BY CLIENT ID -</b>
        <input type="text" name="cid" id="cid" onkeyup="f1(this.value)" onblur="f1(this.value)" style="background-color: #FF6"/>
        <br>
        <br>
        <br>
        <b>FILTER BY NAME -</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="cname" id="cname" onkeyup="f2(this.value)" onblur="f2(this.value)" style="background-color: #FF6"/>
        <br>
        <br>
        </div>   
        <div id="b">
            
        </div>
        <%
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            String query="select * from regtable";
            PreparedStatement ps=c.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            %>
            <div style="margin-left: 70px; margin-right: 70px;">
            <table width="100%" border="1" id="tab" >
        
                <tr style="background-color: moccasin;line-height: 25px"><th>Client Id</th><th>Sponsor Id</th><th>Parent Id</th><th>Left Child</th><th>Right Child</th><th>Name</th><th>Address</th><th>Phone No</th><th>Date of Birth</th><th>Nominee</th><th>E-mail id</th><th></th></tr>  
            <%
            while(rs.next())
            {
                %>
                <tr style="color:#000; line-height: 25px"><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td><td><%=rs.getString(12)%></td><td><a href="edit.jsp?mname=<%=rs.getString(1)%>">EDIT</a></td></tr>  
                <%
            }
            c.close();
            %>
            
        </table> 
    </div>
        
</div>
     
            <footer>
               
                <br>
                <br>
            </footer>
    </body>
</html>  