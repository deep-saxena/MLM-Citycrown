<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown-Client</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_300.font.js"></script>
<script>
    var x=new XMLHttpRequest();
     var res=false;
    function verify()
    {
       
        var url="verify_forgot_password.jsp?cid="+document.getElementById("cid").value+"&eid="+document.getElementById("eid").value+"&pno="+document.getElementById("pno").value;
        
        x.open("GET",url,true);
                     x.onreadystatechange=fpupdates;
                     x.send(null); 
    }
    
    function fpupdates()
    {
       if(x.readyState==4)
                {   
                    res=x.responseText.trim();
                    if(res=="true")
                    { alert("Your Password has been sent to your registered email id!!");
                        location="../index.jsp;"
                      
                        
                    }
                    else
                    {
                      document.getElementById("fperr").innerHTML="<font color=red>Incorrect Credentials</font>";

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
          <h1><a href="../index.jsp" id="logo">CityCrown - Client<span>Forgot Password</span></a></h1>
        
      </div>
    </header>
      
  </div>
    <h1 style="margin-left:300px">Password Requisition Form</h1><br>
    <div id="login" style="margin-left:350px">
        <p>Enter Your ID</p>
  <input type="text" style="background-color:#FF6" name="cid" id="cid" /><br><br>
  <p>Enter Your Registered Email ID</p>
  <input type="email" name="sid" id="eid" value="" style="background-color:#FF6"/><br><br>
  <p>Enter last four digits of your Phone Number</p>
  <input type="text" name="pno" id="pno" value="" style="background-color:#FF6" maxlength="4"/><br><br>
  <input type="submit" style="background-color:#3CF" value="Request for Password" onclick="verify()" id="submit"  />
  
  <div id="fperr">
  <br><br><br><br>
   </div>
</div>
</div>
</body>
</html>