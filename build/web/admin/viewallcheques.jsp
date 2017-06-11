<%-- 
    Document   : viewallcheques
    Created on : 28-Jun-2014, 23:12:39
    Author     : win 8
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
             function selall()
           { 
            var i=document.getElementsByName("check");
            if(document.getElementById("selal").checked==true)
            {    
             for(var j=0;j<i.length;j++)
             {   
              document.getElementsByName("check")[j].checked=true;
             }
            }   
            else
            {
             for(var j=0;j<i.length;j++)
             {   
              if(document.getElementsByName("check")[j].disabled==false)   
                    document.getElementsByName("check")[j].checked=false;
             }   
            }
           }
           function deselall(str)
           {
            var flag=0;
            if(document.getElementById(str).checked==false && document.getElementById("selal").checked==true)
            {
              document.getElementById("selal").checked=false;   
            }
            if(document.getElementById(str).checked==true)
            {   
             var i=document.getElementsByName("check");
             for(var j=0;j<i.length;j++)
             {   
               if(document.getElementsByName("check")[j].checked==false)
               {
                   flag=1;
                   break;
               }
             }
             if(flag==0)
             {
                 document.getElementById("selal").checked=true;
             }
           }
       }
        function payment()
       {
         var str="";
         var i=document.getElementsByName("check");
         for(var j=0;j<i.length;j++)
          {   
            if(document.getElementsByName("check")[j].checked==true && document.getElementsByName("check")[j].disabled==false)
            {
                str=str+document.getElementsByName("check")[j].value+" ";
            }
          }
          str=str.trim();
          x=new XMLHttpRequest();
          var url="paycheques.jsp?str="+str;
          x.open("GET",url,true);
          x.onreadystatechange=payment1;
          x.send(null);
       }
       function payment1()
       {
           if(x.readyState==4)
           {
             alert("Payment Successfully Done");
              location="viewallcheques.jsp";
           }
       }
       
    function noBack() { window.history.forward(); }

     $(function() {
           $("#tab2 tr").addClass("stripe1");
           $("#tab2 tr").hover(
                   function() {
                       $(this).toggleClass("highlight");
                   },
                   function(){
                       $(this).toggleClass("highlight");
                   }
                 );});
     
     
      var y=new XMLHttpRequest();
      function gen_pdf()
      {   document.getElementById("expdf").disabled=true;
          var url="generate_pdf.jsp";
          y.open("GET",url,true);
          y.onreadystatechange=pdfupdates;
       y.send(null);}
      function pdfupdates()
      {if(y.readyState==4)
              {  document.getElementById("expdf").disabled=false;
                  var res=y.responseText.trim();
                  alert("File Saved as"+res);
                  
                  
              }
                 
      }
      
    
        </script>
     <style>
            .stripe1
        {
            background-color: #ffccff;  
        }  
        .stripe2
        {
            background-color: #ccffcc;
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
          <li><a href="edit_record.jsp">Edit A Record</a></li>
          <li><a href="viewpendingcheques.jsp">View Pending Cheques</a></li>
          <li id="menu_active"><a href="viewallcheques.jsp">View All Cheques</a></li>
          <li><a href="../gen">Generate Cheques</a></li>
          <li><a href="company_messages.jsp">Company Messages</a></li>
          <li class="bg_none"><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
         </header>
  </div>
    <div style="margin-left: 70px; margin-right: 70px;">
        <%
            String query;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            query="select * from cheques";
           
            PreparedStatement ps=c.prepareStatement(query);
            ResultSet rs=ps.executeQuery(); %>
             <div id="genpdf" style="margin-left:1100px">
            <button id="expdf" class="button" onclick="gen_pdf()">Export to PDF</button>
           
            <br><br><br>
            <a href="view_pdf.jsp" target="_blank" class="button">View All Pdf</a>
            <br>
            
        </div>
        <br><br>
       
           <table id="tab2" width="100%">
        
            <tr style="background-color: moccasin;line-height: 25px" >
                <th>Client Id</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Pending</th>
                <th>Select Clients</th>
            </tr>  
            <% while(rs.next())
            {
                %>
                 <% if(rs.getString(4).equals("NO")) { %>
                 <tr class="stripe2" style="color: #000; line-height: 25px">
                  
                 <% }
                 else { %>
                 <tr style="color: #000; line-height: 25px">  
               <% } %>
                  <td><%=rs.getString(1)%></td>
                  <td><%=rs.getString(2)%></td>
                  <td><%=rs.getString(3)%></td>
                  <td><%=rs.getString(4)%></td>
               <% if(rs.getString(4).equals("NO")) { %>
                  <td><input type="checkbox" id="check<%=rs.getString(5)%>" name='check' disabled checked value="<%=rs.getString(5)%>"></td></tr>
                <% }
               else {
                    %>
              <td><input type="checkbox" id="check<%=rs.getString(5)%>" name='check' value="<%=rs.getString(5)%>" onclick="deselall(this.id)"></td></tr>
          <%        }     
            } %>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type='checkbox' onclick='selall()' id='selal'>Select all</td>
            </tr>
         
            
            <tr style="background-color: transparent;">
                <td><input type='button' onclick="payment()" value="Pay" style="background-color: #3CF;"></td>
            </tr>

            
            
          <%  c.close();
            %>  
            </table>   
    </div>
   
</div>
            
       </body>
</html>
