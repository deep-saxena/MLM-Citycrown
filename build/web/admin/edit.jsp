<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    var pno_flag=true,mail_flag=true,name_flag=true,address_flag=true,nom_flag=true,central_flag=false;
          function changeflag(id)
          {
            central_flag=true;
            if( document.getElementById("submit").disabled == true)
              {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }
              
             if(id=="name")
                 name_flag=false;
             if(id=="address")
                 address_flag=false;
             if(id=="pno")
                 pno_flag=false;
             if(id=="mail")
                 mail_flag=false;
             if(id=="nom")
                 nom_flag=false;
          }
           function chkpno()
            {
              var pno=document.getElementById("pno").value;
              if((pno.length!=10)||(isNaN(pno)))
              {
                  document.getElementById("pnoerr").innerHTML="<font color=red>Phone no. is invalid</font>";
                  return false;
              }
              else
              {
                  document.getElementById("pnoerr").innerHTML="";
                  return true;
              }
          } 
           function chkfield(id)
            {
              if( document.getElementById("submit").disabled == true)
              {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }
              if(id=="name")
              {
                  var a;
                  a=document.getElementById("name").value;
                  if(a.length==0)
                    { 
                        document.getElementById("nameerr").innerHTML="<font color=red>Blank field</font>";
                        
                        name_flag=false;
                    }
                   else
                   {
                       document.getElementById("nameerr").innerHTML="";
                       name_flag=true;
                   }      
              }
              if(id=="address")
              {
                  var a;
                  a=document.getElementById("address").value;
                  if(a.length==0)
                    { 
                        document.getElementById("addresserr").innerHTML="<font color=red>Blank field</font>";
                        address_flag=false;
                    }
                   else
                   {
                       document.getElementById("addresserr").innerHTML="";
                       address_flag=true;
                   }    
              }
              if(id=="mail")
              {
                   var a;
                  a=document.getElementById("mail").value;
                  if(a.length==0 )
                    { 
                        document.getElementById("mailerr").innerHTML="<font color=red>Blank field</font>";
                        mail_flag=false;
                    }
                   else
                   {
                       document.getElementById("mailerr").innerHTML="";
                       mail_flag=true;
                   }   
              }
              
              
              if(id=="nom")
              {
                 var a;
                  a=document.getElementById("nom").value;
                  if(a.length==0)
                    { 
                        document.getElementById("nomerr").innerHTML="<font color=red>Blank field</font>";
                        nom_flag=false;
                    }
                   else
                   {
                       document.getElementById("nomerr").innerHTML="";
                       nom_flag=true;
                   }     
              }
               if(id=="pno")
              {
                  pno_flag=chkpno();
              }
               if(id=="submit")
              {   
                  document.getElementById(id).focus();
                  if(central_flag==false)
                  {
                      document.getElementById("submit").disabled = true;
                      document.getElementById("flddiv").innerHTML="<font color=red>You haven't updated anything</font>";
                  }
                  else if(name_flag==false||address_flag==false||nom_flag==false||pno_flag==false||mail_flag==false) 
                  {
                      document.getElementById("submit").disabled = true;
                      document.getElementById("flddiv").innerHTML="<font color=red>Please complete all fields!!</font>";
                  }
                  else
                  {
                      document.getElementById("submit").disabled = false;
                       document.getElementById("flddiv").innerHTML="";
                  }
                   
              }
            }
    
    
     window.history.forward();
    function noBack() { window.history.forward(); }
</script>
  </head>
    <body id="page1" onload="noBack()" class="body1">
<%
   if(session.getAttribute("admin")==null)
   { response.sendRedirect("../index.jsp"); } 
%>
<div class="body3">
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
   <%
            String query;
            int i=0;
            String id=request.getParameter("mname");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            query="select * from regtable where id=?";
            PreparedStatement ps=c.prepareStatement(query);
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            rs.next();
         %>
         <form action="..\AdminClientUpdate" method="post" enctype="multipart/form-data">
     <div style="margin-left: 150px;">
             <table width="100%" border="0">
        
   <tr>
    <td width="29%">Sponsor ID</td>
    <td width="25%"><B><%=rs.getString(2)%></B></td>
    <td width="46%" rowspan="4"><img src="..\user_images\<%=id%>\profilepic\user.jpg" height="150" width="150" onError="this.onerror=null;this.src='../user.jpg';"/></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Client ID</td>
    <td><B><%=rs.getString(1)%></B></td>
    <td><input type="hidden" value="<%=rs.getString(1)%>" name="id" id="id"></td>
  </tr> 
 <tr>
      <td>&nbsp;</td>
  </tr>
                   
  <tr>
    <td>Name</td>
    <td><input type="text" name="name" value="<%=rs.getString(6)%>" id="name" onblur="chkfield(this.id)" onclick="changeflag(this.id)" style="background-color:#FF6"/><div id="nameerr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Address</td>
    <td><textarea name="address" rows="4" cols="20" id="address"  onblur="chkfield(this.id)" onclick="changeflag(this.id)" style="background-color:#FF6"/><%=rs.getString(7).trim()%></textarea><div id="addresserr"></div></td>
    <td></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Phone Number</td>
    <td><input type="text" name="pno" value="<%=rs.getString(8)%>" id="pno" onblur="chkfield(this.id)" onclick="changeflag(this.id)" style="background-color: #FF6" /><div id="pnoerr"></div></td>
    <td><input type="file" name="sel" id="sel" onchange="changeflag()" style="background-color: #FF6"/></td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Email id</td>
    <td><input type="email" name="mail" value="<%=rs.getString(12)%>" id="mail" onblur="chkfield(this.id)"  onclick="changeflag(this.id)" style="background-color:#FF6"/><div id="mailerr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Nominee</td>
    <td><input type="text" name="nom" value="<%=rs.getString(10)%>" id="nom" onblur="chkfield(this.id)"   onclick="changeflag(this.id)" style="background-color:#FF6"/><div id="nomerr"></div></td>

    <td><div id="flddiv"></div><input type="submit" value="Update" id="submit" onmouseover="chkfield(this.id)" onfocus="chkfield(this.id)" style="background-color: #3CF"/></td>
  </tr>  
                     
                     
   </table>
     </div>
   </form>
     </div>
    </div>
    </body>
</html>  