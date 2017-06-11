<%@page import="java.sql.*"%>
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
    var x=new XMLHttpRequest();
    function search()
     {
         var id=document.getElementById("srchid").value;
         var url="msgid.jsp?id="+id;
         x.open("GET",url,true);
         x.onreadystatechange=supdates;
         x.send(null);
         
         
     }
     
      function supdates()
      {
          var res;
          if(x.readyState==4)
              { res=x.responseText.trim();
                  document.getElementById("ulid").innerHTML=res;
                  
                  
              }
          
      }
     
    
</script>
<style>
    nav ul{height:200px; width:18%;}
nav ul{overflow:hidden; overflow-y:scroll;}
</style>
</head>

<body id="page1">
<!-- START PAGE SOURCE -->
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
          <li><a href="viewallcheques.jsp">View All Cheques</a></li>
          <li><a href="../gen">Generate Cheques</a></li>
          <li id="menu_active"><a href="company_messages.jsp">Company Messages</a></li>
          <li class="bg_none"><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
      
    </header>
      
  </div>
    <h1>Type Your Message and Send to Your Clients!!</h1>
<br>
  <div id="login" style="margin-left:350px">
      <form action="../send_message">
          <h3>Select Your Clients</h3><br>
          <h3>Search for an Id&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="srchid" style="background-color: #99ffff" id="srchid" onkeyup="search()" /></h3><br>
      
      <nav>
          <ul id="ulid" style="width: 280px;height: 180px;">
              <% 
                  if(session.getAttribute("admin")==null)
   { response.sendRedirect("../index.jsp"); } 
                  
                  
                   Class.forName("com.mysql.jdbc.Driver");
                 String qry="select * from regtable";
                 Connection cn=null;
                 String id="",name="";
                 try{
                  cn= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
                  Statement st=cn.createStatement();
                  ResultSet rs=st.executeQuery(qry);
                  while(rs.next())
                  { id=rs.getString(1);
                    name=rs.getString("name")+"("+id+")";
                    
                  %>
                  <li> <input type="checkbox" name="<%=id%>" value="<%=id%>"/>&nbsp;&nbsp;<%=name%></li>
                  <%
                  
                  
                  }
                     
                 }
                 catch(Exception ex)
                 {}
                 finally
                 {cn.close();}
          
          
          %>
      </ul></nav>
      <br>
      <h3>Your Message Here :</h3>
      
      <textarea name="msg" style="background-color: #ffff99" rows="8" cols="80">
      </textarea>
   &nbsp;&nbsp;&nbsp;&nbsp;       <input type="submit" style="background-color: #3CF; height: 22px; font-size: 18px" value="Send" /> 
      
      </form>
   </div>
 
</div>
</body>
</html>