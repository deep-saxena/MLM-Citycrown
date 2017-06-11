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
 var a,a1;
             var x=new XMLHttpRequest();
             
            function gen()
            {
              var a=document.getElementById("nid").value;
              
              if(a>0)
              {
               if(document.getElementById("50").checked==false && document.getElementById("100").checked==false)
               {
                 document.getElementById("rdiv").innerHTML="<font color=red>Please select a plan type</font>";  
               }
               else
               {
                  document.getElementById("rdiv").innerHTML="";
                  var n;
                  if(document.getElementById("50").checked==true)
                  {
                      n=document.getElementById("50").value;
                  }
                  else
                  {
                    n=document.getElementById("100").value;  
                  }
              document.getElementById("rlist1").innerHTML="";
                var url="genid.jsp?id="+a+"&plan="+n;
                    x.open("GET",url,true);
                x.onreadystatechange=updates;
                x.send(null);
               }
              }
              else
              {
                 alert("Number of IDs must be greater than 0");
              }
            }//end of func gen
            
            function updates()
            {
               
                if(x.readyState==4)
                {
                    a=x.responseText.trim();
                    document.getElementById("rlist").innerHTML=document.getElementById("rlist").innerHTML+a;
                }
            }
            
             window.history.forward();
    function noBack() { window.history.forward(); }
    
    function show_unused()
    {
        if(document.getElementById("50").checked==false && document.getElementById("100").checked==false)
               {
                 document.getElementById("rdiv").innerHTML="<font color=red>Please select a plan type</font>";  
               }
               else
               {
                  document.getElementById("rdiv").innerHTML="";
                  var n;
                  if(document.getElementById("50").checked==true)
                  {
                      n=document.getElementById("50").value;
                  }
                  else
                  {
                    n=document.getElementById("100").value;  
                  }
              document.getElementById("rlist").innerHTML="";
                    var url="show_unused.jsp?plan="+n;
                    x.open("GET",url,true);
                x.onreadystatechange=updates1;
                x.send(null);
                }
              }
               function updates1()
               {
               
                if(x.readyState==4)
                {
                    a=x.responseText.trim();
                    document.getElementById("rlist1").innerHTML=a;
                }
              }
           
            
    
        </script>
 </head>
 <body id="page1" onload="noBack()" class="body1">
<!-- START PAGE SOURCE -->
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
          <li id="menu_active"><a href="index.jsp">Generate IDs</a></li>
          <li><a href="edit_record.jsp">Edit A Record</a></li>
          <li><a href="viewpendingcheques.jsp">View Pending Cheques</a></li>
          <li><a href="viewallcheques.jsp">View All Cheques</a></li>
          <li><a href="..\gen">Generate Cheques</a></li>
          <li><a href="company_messages.jsp">Company Messages</a></li>
          <li class="bg_none"><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
        <div class="text1">Your Business Needs Fresh Ideas?</div>
        <div class="text2">Hire New Clients</div>
       
         <div id="idtab" style="margin-left: 350px;">
         <table width="100%" border="0">
          <tr>
              <td width="28%"><h3>Choose Plan</h3></td>
            <td><input type="radio" name="plan" value="05" id="50" />Gold 
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="plan" value="10" id="100"/>
              Platinum <div id="rdiv"></div></td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
              <td><h3>Number of IDs</h3></td>
            <td><input type="text" name="nid" value="" id="nid" style="background-color:#FF6"/></td><br>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
              <td><input type="button" value="Generate" name="generate" onclick="gen();" style="background-color:#3CF;" /></td><br>
          <td><input type="button" value="Show unused IDs" name="unused" onclick="show_unused();" style="background-color: #3CF;"</td>
          </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
              <td height="137" colspan="2"><ul id="rlist" style="padding-left: 130px;"></ul>
                  <ul id="rlist1" style="padding-left: 130px; width: 230px;height: 150px;overflow:auto;"></ul>
              </td>
          </tr>
         </table>
         </div>
         </header>
    </div>  
</div>
</body>
</html>