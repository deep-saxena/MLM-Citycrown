<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown | Edit Profile</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">
<script src="js/jquery-1.7.1.min.js"></script>
  <script src="js/jquery-migrate-1.1.1.js"></script>
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
<script>
           var pno_flag=true,mail_flag=true,name_flag=true,address_flag=true,nom_flag=true,central_flag=false;
           var curp_flag=false,newp_flag=false,conp_flag=false;
           x=new XMLHttpRequest();
        function enable()
            {
               if( document.getElementById("upass").disabled == true)
              {
                document.getElementById("upass").disabled = false;
                document.getElementById("flddiv1").innerHTML="";
              }  
            }
            function enable1()
            {
               if( document.getElementById("upro").disabled == true)
              {
                document.getElementById("upro").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }  
            }   
        
          function chkpass(str,str1)
            {
                if(str!=str1)
                {   
                    document.getElementById("curperr").innerHTML="<font color='Red'>Incorrect Current password</font>";
                  curp_flag=false; 
               }
                
                else
                {   
                    document.getElementById("curperr").innerHTML="";
                    curp_flag=true;
                }
            }
           function chkpass1()
            {
              var a,b;
              a=document.getElementById("newp").value;
              b=document.getElementById("conp").value;
              if(a.localeCompare(b)!=0 || a.length==0 || b.length==0)
              {
                document.getElementById("conperr").innerHTML="<font color=red>Password did not match</font>";
                return false;
              }
              else
              {
                document.getElementById("conperr").innerHTML="<font color=green>Passwords match</font>";
                return true;
              }
          }  
    
        function changeflag(id)
          {  
              central_flag=true;
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
              if( document.getElementById("upro").disabled == true)
              {
                document.getElementById("upro").disabled = false;
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
                  if(a.length==0)
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
              
              if(id=="upro")
              {
                   document.getElementById(id).focus();
                   if(central_flag==false)
                  {
                      document.getElementById("upro").disabled = true;
                      document.getElementById("flddiv").innerHTML="<font color=red>You haven't updated anything</font>";
                  }     
                 else if( name_flag==false||address_flag==false||nom_flag==false||pno_flag==false||mail_flag==false)
                  {
                      document.getElementById("upro").disabled = true;
                      document.getElementById("flddiv").innerHTML="<font color=red>Please complete all fields!!</font>";
                  }
                  else
                  {
                      document.getElementById("upro").disabled = false;
                       document.getElementById("flddiv").innerHTML="";
                  }
                   
              }
       }
       function chkfield1(id)
          {
              if( document.getElementById("upass").disabled == true)
              {
                document.getElementById("upass").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }
              if(id=="newp")
              {
                  var a;
                  a=document.getElementById("newp").value;
                  if(a.length==0)
                    { 
                        document.getElementById("newperr").innerHTML="<font color=red>Blank field</font>";
                        newp_flag=false;
                    }
                         
                   else
                   {
                       document.getElementById("newperr").innerHTML="";
                       newp_flag=true;
                   }      
              }
              if(id=="conp")
              {
                  
                  conp_flag=chkpass1();
              }
              if(id=="upass")
              {
                 document.getElementById(id).focus();  
                if( conp_flag==false || newp_flag==false||curp_flag==false)
                  {
                      document.getElementById("upass").disabled = true;
                      document.getElementById("flddiv1").innerHTML="<font color=red>Please complete all fields!!</font>";
                  }
                  else
                  {
                      document.getElementById("upass").disabled = false;
                       document.getElementById("flddiv1").innerHTML="";
                  }
 
              }
          }
          function updatepass()
          {
              var pass=document.getElementById("conp").value;
              var url="updatepassword.jsp?pass="+pass;
                x.open("GET",url,true);
                x.onreadystatechange=updates;
                x.send(null);
          }
          function updates()
          {
            if(x.readyState==4)
            {
              alert("Password Successfully updated");
              location="edit_profile.jsp";
            }           
          }
       
 
     $(document).ready(function() {
         $("#divpass").hide();
         $("#passbutton").click(function() {
             if ($(this).val() == "Edit Password") {
                  $(this).val("Update Profile");
             }
             else 
             {
                $(this).val("Edit Password");
             }
                $("#divpass").slideToggle();
                $("#divother").slideToggle();
              
                   });
              });
             
               function noBack() { window.history.forward(); }
          
         </script>
</head>
<body id="page2" onload="noBack()">
<!--==============================header=================================-->
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
          <li><a class="active" href="edit_profile.jsp">Edit Profile</a></li>
          <li><a href="show_tree.jsp?id=<%=session.getAttribute("id").toString()%>">Show Tree</a></li>
          <li><a href="my_cheques.jsp">My Cheques</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
      <div class="clear"></div>
    </div>
  </div>
</header>
<!--==============================content================================-->
   <%  
         String b=session.getAttribute("id").toString();  
        Class.forName("com.mysql.jdbc.Driver");
         Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
         PreparedStatement p=c.prepareStatement("select * from regtable where id=?");
         p.setString(1, b);
         ResultSet rs=p.executeQuery();
         rs.next();
        %>
        <div id="divother" style="margin-left: 150px;margin-right: 150px;">
            <H3>Profile Update</H3><br>
        <form action="../../ClientPro" method="post" enctype="multipart/form-data">
            
        <table width="100%" border="0">
  <tr>
    <td>Name</td>
    <td><input type="text" name="name" value="<%=rs.getString(6)%>" id="name" onblur="chkfield(this.id)" onclick="changeflag(this.id);enable1();" style="background-color: #FF6" disabled/><div id="nameerr"></div></td>
    <td width="46%" rowspan="4"><img src="..\..\user_images\<%=b%>\profilepic\user.jpg" alt="user" height="150" width="150" onError="this.onerror=null;this.src='images/user.jpg';"/></td>
    
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Address</td>
    <td><textarea name="address" rows="4" cols="20" id="address"  onblur="chkfield(this.id)" onclick="changeflag(this.id);enable1();" style="background-color: #FF6" />
        <%=rs.getString(7).trim()%></textarea><div id="addresserr"></div></td>
       
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Phone Number</td>
    <td><input type="text" name="pno" value="<%=rs.getString(8)%>" id="pno" onblur="chkfield(this.id)" onclick="changeflag(this.id);enable1();" style="background-color: #FF6"/><div id="pnoerr"></div></td>
    <td></td>
    
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Email id</td>
    <td><input type="email" name="mail" value="<%=rs.getString(12)%>" id="mail" onblur="chkfield(this.id)" onclick="changeflag(this.id);enable1();" style="background-color: #FF6" disabled/><div id="mailerr"></div></td>
    <td><input type="file" name="sel" id="sel" style="background-color: #FF6" onclick="changeflag(this.id);enable1();"/></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Nominee</td>
    <td><input type="text" name="nom" value="<%=rs.getString(10)%>" id="nom" onblur="chkfield(this.id)" onclick="changeflag(this.id);enable1();" style="background-color: #FF6" /><div id="nomerr"></div></td>

    <td><div id="flddiv"></div><input type="submit" value="Update" id="upro" onmouseover="chkfield(this.id)" onfocus="chkfield(this.id)" style="background-color: #3CF" /></td>
  </tr>
  
        </table>
      </form>
        </div>  
    <br>
  <input type="button" id="passbutton" value="Edit Password" style="background-color: #3CF;margin-left: 150px">
        <div id="divpass" style="margin-left: 150px;margin-right: 150px;">
              <% String a=session.getAttribute("pass").toString();  %>
              <h3>Change Password</h3><br>
        <table width="100%" border="0">
            <tr>
                <td>Current Password</td> 
                <td><input type="password" id="curp" value="" onblur="chkpass('<%=a%>',this.value)" onclick="enable()" style="background-color: #FF6"><div id="curperr"></div></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr> 
                <td>New Password</td> 
                <td><input type="password" id="newp" value="" onblur="chkfield1(this.id)" onclick="enable()" style="background-color: #FF6"><div id="newperr"></div></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td>Confirm Password</td> 
                <td><input type="password" id="conp" value="" onblur="chkfield1(this.id)" onclick="enable()" style="background-color: #FF6"><div id="conperr"></div></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td></td>
                <td><input type="button" value="Update" id="upass" onmouseover="chkfield1(this.id)" onclick="updatepass()" onfocus="chkfield1(this.id)" style="background-color: #3CF"><div id="flddiv1"></div></td>
            </tr>    
        </table>
        </div> 
            <% }
            %>
    </body>
</html>