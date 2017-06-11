<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">
<script src="js/jquery-1.7.1.min.js"></script>
<script src="js/cufon-yui.js"></script>
<script src="js/cufon-replace.js"></script>
<script src="js/Vegur_500.font.js"></script>
<script src="js/Ropa_Sans_400.font.js"></script>
<script src="js/FF-cash.js"></script>
<script src="js/tms-0.3.js"></script>
<script src="js/tms_presets.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script>
<script>
    function noBack() { window.history.forward(); }
</script>
    
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<![endif]-->
</head>
<body id="page1" onload="noBack()">
    <%
   if(session.getAttribute("id")==null)
   { response.sendRedirect("../../index.jsp"); } 
%>
<!--==============================header=================================-->
<%
   String query;
   
   String sid="",name="",address="",dob="",nsid="",nominee="",phone="",email="";
   
       
   
            String id=session.getAttribute("id").toString();
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c= DriverManager.getConnection("jdbc:mysql://localhost/citycrowndb?user=root&password=system");
            query="select * from regtable where id=?";
            PreparedStatement ps=c.prepareStatement(query);
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
            sid=rs.getString("sponserid");
            name=rs.getString("name");
            dob=rs.getString("dob");
            address=rs.getString("address");
            nominee=rs.getString("nominee");
            phone=rs.getString("phone");
            email=rs.getString("email");
            }
            
          query="select * from regtable where id="+sid;
          ps=c.prepareStatement(query);
          rs=ps.executeQuery();
          if(rs.next())
          { 
            nsid=rs.getString("name");
          }
}
     catch(Exception ex)
     {
               
      }
     finally
     {}



%>
<header>
  <div class="border-bot">
    <div class="main">
        <H1><a href="index.jsp"><img src="images/logo.png" alt=""></a></h1>  
      <nav>
        <ul class="menu">
          <li><a class="active" href="index.jsp">Home</a></li>
          <li><a href="edit_profile.jsp">Edit Profile</a></li>
          <li><a href="show_tree.jsp?id=<%=session.getAttribute("id").toString()%>">Show Tree</a></li>
          <li><a href="my_cheques.jsp">My Cheques</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
      <div class="clear"></div>
    </div>
  </div>
  <div class="row-bot">
    <div class="slider-wrapper">
      <div class="slider">
        <ul class="items">
          <li> <img src="images/slider-img1.jpg" alt=""> </li>
          <li> <img src="images/slider-img2.jpg" alt=""> </li>
          <li> <img src="images/slider-img3.jpg" alt=""> </li>
        </ul>
      </div>
    </div>
  </div>
</header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="container_12">
      <div class="wrapper">
        <article class="grid_8">
          <h2>Welcome <%=session.getAttribute("name")%></h2>
          <p class="p2">City Crown-A MultiLevel Management Business Application that lets you,
           Create Your profile,View Your Cheques, Manage, Organise and View them. Not only this, you
          can also get access to all your generated cheques, payments made and done, 
          pending requests and all the registered clients under you in form
          of hierarchy at a single place on just a click on a button!!</p>
          <h3 class="p1">My Portfolio</h3>
          <div class="wrapper">
            <div class="grid_4 alpha">
              <ul class="list-1">
                
                  <li>Sponsor ID : <%=sid%></li>
                  <li>Name Of Sponsor : <%=nsid%></li>
                <li>Your Id : <%=id%></li>
                <li>Date Of Birth : <%=dob%></li>
                <li>Nominee : <%=nominee%></li>

              </ul>
            </div>
            <div class="grid_4 omega">
              <ul class="list-1 indent-bot">
                <li>Name : <%=name%></li>
                <li>Address : <%=address%></li>
                <li>E-mail : <%=email%></li>
                <li>Contact Number : <%=phone%></li>
              
              </ul>
             
          
        </article>
        <article class="grid_4">
          <div class="indent-top indent-left">
            <div class="wrapper margin-bot">
              <figure class="img-indent-r"></figure>
              <div class="extra-wrap"> <strong class="title-1">Tell Your<strong>Friends</strong><em>About</em><em>Our Website</em></strong> </div>
            </div>
            
              <image src="../../user_images/<%=id%>/profilepic/user.jpg" style="width:200px; height: 200px" alt="Sorry!" onError="this.onerror=null;this.src='images/user.jpg';" />

          </div>
        </article>
      </div>
    </div>
  </div>
</section>
<!--==============================footer=================================-->
<footer>
  <div class="main">
    <div class="container_12">
      <div class="wrapper">
        <div class="grid_3">
          <div class="spacer-1"> <a href="index.jsp"><img src="images/footer-logo.png" alt=""></a> </div>
        </div>
        <div class="grid_5">
          <div class="indent-top2">
          <!--  <p class="prev-indent-bot">&copy; 2014 CityCrown</p>
            Phone: +1 800 559 6580--> </div>
        </div>
        <div class="grid_4">
          <ul class="list-services">
            
          </ul>
          <span class="footer-text">&copy; 2015 CityCrown</span> </div>
      </div>
    </div>
  </div>
</footer>

<script>Cufon.now();</script>
<script>
$(window).load(function() {
	$('.slider')._TMS({
		duration:1000,
		easing:'easeOutQuint',
		preset:'diagonalFade',
		slideshow:7000,
		banners:false,
		pauseOnHover:true,
		pagination:true,
		pagNums:false
	});
});
</script>
</body>
</html>