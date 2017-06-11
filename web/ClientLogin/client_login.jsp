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
<script>
   
    var xreq=new XMLHttpRequest();
    function verify()
    {   
        var cid,pass;
        cid=document.getElementById("cid").value;
        pass=document.getElementById("pass").value;
        var url="verify_details.jsp?id="+cid+"&pass="+pass;
        xreq.open("GET",url,true);
        xreq.onreadystatechange=v_results;
        xreq.send(null);
     
    }
    
    function v_results()
    { var resp;
        if(xreq.readyState==4)
            { resp=xreq.responseText.trim();
                
                if(resp=="Done")
                    {   resp="";
                        location="Attributes/index.jsp";
                        
                    }
                  else
                  { document.getElementById("flddiv").innerHTML="<font color=red>Invalid Username Or Password</font>"
                      
                  }   
            }   
    }   
             var cid_flag=false,pass_flag=false;
            function enable()
            {
               if( document.getElementById("submit").disabled == true)
              {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
              }  
            }
            function chkfield(str)
            {
               
               if( document.getElementById("submit").disabled == true)
               {
                document.getElementById("submit").disabled = false;
                document.getElementById("flddiv").innerHTML="";
               }  
              if(str=="cid")
              {  var a;
                  a=document.getElementById("cid").value;
                  if((a.length!=10) || (isNaN(a)))
                  {
                    document.getElementById("ciderr").innerHTML="<font color=red>Client ID is incorrect</font>";  
                    cid_flag=false;
                  }
                  else
                  {
                    document.getElementById("ciderr").innerHTML="";      
                    cid_flag=true;
                  }    
              }
              if(str=="pass")
              { var a;
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
              if(str=="submit")
              {
                  document.getElementById(str).focus();
                  if(cid_flag==false || pass_flag==false)
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
            
        </script>
</head>
<body id="page1" class="body1">
<!-- START PAGE SOURCE -->
<div class="body3"></div>
<div class="body1">
  <div class="main">
    <header>
      <div id="logo_box">
          <h1><a href="../index.jsp" id="logo">CityCrown - Client<span></span></a></h1>
        
      </div>
    </header>
      
  </div>
    <h1 style="margin-left:300px">Login</h1><br>
  <div id="login" style="margin-left:350px">
  <p>Enter ID</p>
  <input type="text" style="background-color:#FF6" name="cid" id="cid" onblur="chkfield(this.id)" onclick="enable()"/><div id="ciderr"></div><br><br>
  <p>Enter Your Password</p>
  <input type="password" name="pass" id="pass" value="" onblur="chkfield(this.id)" onclick="enable()" style="background-color:#FF6"/><div id="passerr"></div><br><br>
  <input type="submit" style="background-color:#3CF" value="Login" onclick="verify();" id="submit" onmouseover="chkfield(this.id)" onfocus="chkfield(this.id)"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgot_pass.jsp">Forgot password?</a>
  <div id="flddiv">
  <br><br><br><br>
   </div>
</div>
</div>
</body>
</html>