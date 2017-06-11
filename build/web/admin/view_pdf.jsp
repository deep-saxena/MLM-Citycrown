<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View PDF</title>
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
    <script>
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
</head>
<body id="page1">
<!-- START PAGE SOURCE -->
<div class="body3"></div>
<div class="body1">
  <div class="main">
    <header>
      <div id="logo_box">
        <h1><a href="viewallcheques.jsp" id="logo">CityCrown-Administrator <span>We Manage Clients!!!</span></a></h1>
      </div>
      
      <div class="wrapper">
        <div class="text1">To View Following pdfs your password would be your login-name+login-password</div>
        <div class="text2"></div>
        
      </div>
        <br><br><br><br><br>
        <div id="tabdata"  style="margin-left: 50px;">
            <table width="100%" border="0" id="tab">
  <tr style="background-color: moccasin;line-height: 25px">
      <td><b>File Name</b></td>
    <td></td>
    <td></td>
  </tr>
  <%
           ServletContext cn =getServletContext();
            String p=cn.getRealPath("pdf-output");
          
            String full_file_path=p+"/";
            String fname="";
            File f=new File(p);
             File f1[]=f.listFiles();
             for(int i=0;i<f1.length;i++)
             { full_file_path=full_file_path+f1[i].getName().trim();
               fname=f1[i].getName().trim();
             
  
  %>
  
  <tr style="color:#000; line-height: 25px">
          <td><%=fname%></td>
    <td><a href="../pdf-output/<%=fname%>" target="_blank">View PDF</a></td>
    <td></td>
  </tr>
  
  <% }
             
  %>
</table>
            
        </div>
    </header>
  </div>
</div>
</body>
</html>