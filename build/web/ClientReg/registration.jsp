<%-- 
    Document   : registration
    Created on : 12 Jun, 2014, 10:03:14 AM
    Author     : win 8
--%>
<%@page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<%@page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@page import="MyPack.*"%>

<%@page import="java.util.Random"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>

<script src='https://www.google.com/recaptcha/api.js'></script>
<%
  //  int tmp=(int)(Math.random()*10000);
    String new_otp=Generate_OTP.get_OTP();
%> 

        <script>
          var res1; 
          var sid_flag=false; 
          var cid_flag=false;
          var pass_flag=false,otp_flag=false; 
          var cpass_flag=false,pno_flag=false,mail_flag=false,radio_flag=false,name_flag=false,address_flag=false,dob_flag=false,nom_flag=false;
         function enable()
         {
              if( document.getElementById("submit").disabled == true)
              {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }  
         }   
            function chkpass()
            {
              var a,b;
              a=document.getElementById("pass").value;
              b=document.getElementById("cpass").value;
              if(a.localeCompare(b)!=0 || a.length==0 || b.length==0)
              {
                document.getElementById("cpasserr").innerHTML="<font color=red>Password did not match</font>";
                return false;
              }
              else
              {
                document.getElementById("cpasserr").innerHTML="<font color=green>Passwords match</font>";
                return true;
              }
                  
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
        function chksid()
            {
                sid=document.getElementById("sid").value;
                if(sid.length!=10)
                {
                   document.getElementById("siderr").innerHTML="<font color=red>Sponsor ID must be 10 digits</font>";
                   return false;
                 }
                 else
                 {
                    document.getElementById("siderr").innerHTML="";
                     x=new XMLHttpRequest();
                     var url="checksid.jsp?sid="+sid;
                     x.open("GET",url,true);
                     x.onreadystatechange=sidupdates;
                     x.send(null);
                 }
            }
        function sidupdates()
            {
                if(x.readyState==4)
                {   
                    res=x.responseText.trim();
                    if(res=="true")
                     { 
                         document.getElementById("siderr").innerHTML="<font color=green>Sponsor Id Valid</font>";
                         sid_flag=true;
                     }
                     else
                     {
                         document.getElementById("siderr").innerHTML="<font color=red>Sponsor Id Invalid</font>";
                         sid_flag=false;
                     }
                 }
            }
        function chkcid()
            {
              var cid=document.getElementById("cid").value;
              if(cid.length!=10)
                {
                   document.getElementById("ciderr").innerHTML="<font color=red>Client ID must be of 10 digits</font>";
                   return false;
                 }
                 else
                 {
                    document.getElementById("ciderr").innerHTML="";
                      x=new XMLHttpRequest(); 
                      var url="checkcid.jsp?cid="+cid+"&sid="+sid;
                      x.open("GET",url,true);
                      x.onreadystatechange=cidupdates;
                      x.send(null);
                 }
            }
        function cidupdates()
            {
                
        if(x.readyState==4)
                { 
                    res=x.responseText.trim();
                   
                    if(res=="true")
                     { 
                         document.getElementById("ciderr").innerHTML="<font color=green>Client Id Valid</font>";
                         cid_flag=true;
                        
                      }
                     else
                     {
                         document.getElementById("ciderr").innerHTML="<font color=red>Client Id Invalid</font>";
                         cid_flag=false;
                     }

           
                }
            }
        function chkradio()
            { 
                 if(document.getElementById("left").checked==false && document.getElementById("right").checked==false)
                     {
                         document.getElementById("lrerr").innerHTML="<font color=red>Please Select a child type</font>";
                         return false;                      
                      }
                      
                     else
                     {
                         document.getElementById("lrerr").innerHTML="";
                         return true; 
                    } 
            }
            function verify_otp()
            {
                 var a=document.getElementById("otp").value;
                 var b="<%=new_otp%>";
            if(a==b)
                {
            document.getElementById("otperr").innerHTML="<font color=green>E-Mail Id Verified!!</font>";
            otp_flag=true;
            document.getElementById("mail").disabled=true; //change
                }
                else
                {
                document.getElementById("otperr").innerHTML="<font color=red>Please Enter Correct OTP</font>";
                      otp_flag=false;
                 }
    
            }

        function chkfield(id)
            {
              if( document.getElementById("submit").disabled == true)
              {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }  
              if(id=="sid")
              {
                
               sid_flag=chksid();
             
              }
              if(id=="cid")
              {
                  cid_flag=chkcid();
              }
              if(id=="pass")
              {
                  var a;
                  a=document.getElementById("pass").value;
                  if(a.length==0)
                    { 
                        document.getElementById("passerr").innerHTML="<font color=red>Blank field</font>";
                        pass_flag=false;
                    }
                         
                   else
                   {
                       document.getElementById("passerr").innerHTML="";
                       pass_flag=true;
                   }      
                  
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
              /*if(id=="captext")
              {
                   var a,b;
                  a=document.getElementById("captext").value;
                  if(a.length==0 )
                    { 
                        document.getElementById("captexterr").innerHTML="<font color=red>Blank field</font>";
                        cap_flag=false;
                    }
                    else if(a.length!=0)
                    {
                        b=document.getElementById("capimg").alt;
                        
                        if(a.localeCompare(b.substring(3,b.length-4))==0)
                        {
                          document.getElementById("captexterr").innerHTML="<font color=green>Verified</font>";
                          cap_flag=true;
  
                        }
                        else
                        {
                            document.getElementById("captexterr").innerHTML="<font color=red>Doesnot match with the image text</font>";
                       cap_flag=false;
                        }
                    }
                }*/
              if(id=="dob")
              {
                   var a;
                  a=document.getElementById("dob").value;
                  if(a.length==0 )
                    { 
                        document.getElementById("doberr").innerHTML="<font color=red>Blank field</font>";
                        dob_flag=false;
                    }
                   else
                   {
                       document.getElementById("doberr").innerHTML="";
                       dob_flag=true;
                   }   
              }
              if(id=="mail")
              {
                   var a;
                   var req=new XMLHttpRequest();
                  a=document.getElementById("mail").value;
                  var value="<%=new_otp%>";
  
                  if(a.length==0)
                    { 
                        document.getElementById("mailerr").innerHTML="<font color=red>Blank field</font>";
                        mail_flag=false;
                    }
                   else
                   {
            
        document.getElementById("mailerr").innerHTML="";
                       var url="verify_otp.jsp?otp="+value+"&eid="+a;
                        req.open("GET",url,true);
                       
        req.send(null);
  
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
              if(id=="cpass")
              {
                  cpass_flag=chkpass();
              }
              if(id=="pno")
              {
                  pno_flag=chkpno();
              }
              if(id=="left" || id=="right")
              {
                 radio_flag=chkradio();   
              }
              if(id=="otp")
              {
                  otp_flag=verify_otp();
              }
              
              if(id=="submit")
              {
                   document.getElementById(id).focus();
                    if( sid_flag==false || cid_flag==false||pass_flag==false||name_flag==false||address_flag==false||dob_flag==false||nom_flag==false||cpass_flag==false||pno_flag==false||radio_flag==false||mail_flag==false||otp_flag==false)
                  {
                      document.getElementById("submit").disabled = true;
                      document.getElementById("flddiv").innerHTML="<font color=red>Please complete all fields!!</font>";
                  }
                  else
                  {
                      document.getElementById("submit").disabled = false;
                       document.getElementById("flddiv").innerHTML="";
                       document.getElementById("mail").disabled=false; //change
                  }
                   
              }
       }
     
    function noBack() 
    { window.history.forward(); }
    
  /*  function capReload()
    {
        x=new XMLHttpRequest();
                     var url="changecap.jsp";
                     x.open("GET",url,true);
                     x.onreadystatechange=capupdates;
                     x.send(null);
    }
    function capupdates()
            {
                if(x.readyState==4)
                {   
                    res=x.responseText.trim();
                    document.getElementById("capimg").src=res;
                    document.getElementById("capimg").alt=res.substring(8,res.length);
                    cap_flag=false;
                    document.getElementById("captext").value="";
                    document.getElementById("captexterr").innerHTML="";
                }
            }*/
          
         </script>
         <style>
             
             
         </style>
    </head>
    <body id="page1" onLoad="noBack()" class="body1" onkeydown = "return (event.keyCode!=13)">
       <div class="body3"></div>
        <div class="body1">
      <div class="main">
        <header style="width:100%;overflow:hidden;position:relative;padding-bottom: 130px;">
      <div id="logo_box">
          <h1><a href="../index.jsp" id="logo">CityCrown-Client</a><a href="registration.jsp" id="logo"> <span>Registration</span></a></h1>
      </div>
          
        </header>
      </div>
  
    
         <form action="../ClientReg" method="post" enctype="multipart/form-data" >
          <div style="margin-left: 200px; margin-right: 200px;">    
        <table width="100%" border="0">
  <tr>
    <td width="29%">Sponsor ID</td>
    <td width="25%"><input type="text" name="sid" value="" id="sid" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="siderr"></div></td>
    <td width="46%" rowspan="4"><img src="../user.jpg" height="130" width="130" /></td>
  </tr>
  <tr>
    <td>Client ID</td>
    <td><input type="text" name="cid" value="" id="cid" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="ciderr"></div></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><input type="password" name="pass" value="" id="pass" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="passerr"></div></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Confirm Password</td>
    <td><input type="password" name="cpass" value="" id="cpass" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="cpasserr"></div></td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Select Child Type</td>
    <td><input type="radio" name="ctype" value="lchild" id="left" onMouseOut="chkfield(this.id)" /> Left  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="ctype" value="rchild" id="right" onMouseOut="chkfield(this.id)"/> Right <div id="lrerr"></div></td>
    <td><input type="file" name="sel" id="sel" style="background-color:#ffccff"/></td>
 </tr>
 <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Name</td>
    <td><input type="text" name="name" value="" id="name" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="nameerr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Address</td>
    <td><textarea name="address" rows="4" cols="20" id="address"  onblur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/>
        </textarea><div id="addresserr"></div></td>
   
    <td>Prove you're not a robot <br>
        <div class="g-recaptcha" data-sitekey="6LcD3wQTAAAAADKYZF8-umXGoFL7zQESmWtaXB2V"></div>
        <%//ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LdlHOsSAAAAAM8ypy8W2KXvgMtY2dFsiQT3HVq-", "6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY", false);
          //out.print(c.createRecaptchaHtml(null, null));%>
    </td>
  </tr>
  <tr>
    <td><br>Phone Number</td>
    <td><br><input type="text" name="pno" value="" id="pno" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="pnoerr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Email id</td>
    <td><input type="email" name="mail" value="" id="mail" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="mailerr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>  
  <tr>
    <td>Enter OTP sent to your E-mail Id</td>
    <td><input type="text" style="background-color:#ffccff" name="otp" value="" id="otp" onblur="chkfield(this.id)" onClick="enable()"/><div id="otperr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>  
  <tr>
    <td>Date Of Birth</td>
    <td><input type="date" name="dob" value="" id="dob" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/>
        <div id="doberr"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>Nominee</td>
    <td><input type="text" name="nom" value="" id="nom" onBlur="chkfield(this.id)" onClick="enable()" style="background-color:#ffccff"/><div id="nomerr"></div></td>
    <td><div id="flddiv"></div><input type="submit" value="Register" id="submit" onMouseOver="chkfield(this.id)" onfocus="chkfield(this.id)" style="background-color: #3CF; height: 25px; font-size: 20px"/></td>
  </tr>
        </table>
          </div>
      </form>
       

    </div>
    <footer>
        <br>
        <br>
    </footer>    
    </body>
    
</html>
