<%@page import="java.util.ArrayList"%>
<%@page import="MyPack.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CityCrown | Geology</title>
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
<script src="js/script.js"></script>
<script src="js/hoverIntent.js"></script>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<![endif]-->
<script>
     var y,res;
    $(function() {
       var moveLeft = 20;
        var moveDown = 10;
        
   $('#node1').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY + moveDown).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node2').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - moveDown).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node3').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - moveDown).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node4').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - 210).css('left', event.pageX - 160);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node5').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - 210).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node6').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - 210).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
    $('#node7').hoverIntent(function(event) {
             var str = $(this).attr('alt');
             $.ajax({url:"getdetail.jsp?id="+str,success:function(result){
                  
                    $('#detail').html(result).fadeIn().show().css('top',event.pageY - 210).css('left', event.pageX + moveLeft);
                    }});},function() {
             $('#detail').html("");
             $('#detail').hide(); }
            );
});    
            
</script>
<style>
    p#detail
    {
        background: #ccffff;
        color: #000000;
        border: 5px solid #31b0d5;
        font-size: 100%;
        position: absolute;
        
        // width: 280px;
        // padding: 10px;
    }
    
</style>
</head>
<body id="page2">
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
          <li><a href="edit_profile.jsp">Edit Profile</a></li>
          <li><a class="active" href="show_tree.jsp?id=<%=session.getAttribute("id").toString()%>">Show Tree</a></li>
          <li><a href="my_cheques.jsp">My Cheques</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </nav>
      <div class="clear"></div>
    </div>
  </div>
</header>

<!--<h3>Geology</h3>-->
<p id="detail"></p>
      <div style="margin-left: 250px">  
      <table width="700" border="0" align="center">
           <% String x=request.getParameter("id");
            if(x.length()==10)
            {    
            %>
            <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
            <td><img src="..\..\user_images\<%=x%>\profilepic\user.jpg" alt="<%=x%>" width="100" height="100" id="node1"  onError="this.onerror=null;this.src='images/user.jpg';"><b><%=request.getParameter("id")%></b></td>
            <% getRecord r=new getRecord();
               ArrayList a=r.getrecord(request.getParameter("id"));
               String str[]=new String[9];
               int i=0;
               for(Object o:a)
               {
                   str[i++]=o.toString();
               }
               String lchild= str[2];
               String rchild= str[3];
               String lchild11="",rchild12="",lchild21="",rchild22="";
 
               if(lchild.compareTo("OPEN")!=0)
               {
                   ArrayList a1=r.getrecord(lchild);
                   String str1[]=new String[10];
                int i1=0;
                for(Object o:a1)
                {
                  str1[i1++]=o.toString();
                }
                lchild11= str1[2];
                rchild12= str1[3];
               }
               else{}
               
               if(rchild.compareTo("OPEN")!=0)
               {
                  ArrayList a2=r.getrecord(rchild);
                  String str2[]=new String[10];
               int i2=0;
               for(Object o:a2)
               {
                   str2[i2++]=o.toString();
               }
               lchild21= str2[2];
               rchild22= str2[3];
               }
               else{}
               
            %>
            <td></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="51">&nbsp;</td>
            <td colspan="5">&nbsp;&nbsp;<img src="images\arrow.jpg" width="500" height="50" alt="arrow1"></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
              <td></td>
              <td><a href="show_tree.jsp?id=<%=lchild%>"><img src="..\..\user_images\<%=lchild%>\profilepic\user.jpg" alt="<%=lchild%>"  width="100" height="100" id="node2"  onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(lchild);%></b></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><a href="show_tree.jsp?id=<%=rchild%>"><img src="..\..\user_images\<%=rchild%>\profilepic\user.jpg" alt="<%=rchild%>" width="100" height="100" id="node3"   onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(rchild);%></b></td>
            <td></td>
          </tr>
          <tr>
           <td colspan="3">&nbsp;&nbsp;<img src="images\arrow.jpg" width="300" height="50" alt="arrow1"></td>
            <td>&nbsp;</td>
            <td colspan="3">&nbsp;&nbsp;<img src="images\arrow.jpg" width="300" height="50" alt="arrow1"></td>
          </tr>
          <tr>
              <td><a href="show_tree.jsp?id=<%=lchild11%>"><img src="..\..\user_images\<%=lchild11%>\profilepic\user.jpg" alt="<%=lchild11%>" width="100" height="100" id="node4"  onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(lchild11);%></b></td>
            <td></td>
            <td><a href="show_tree.jsp?id=<%=rchild12%>"><img src="..\..\user_images\<%=rchild12%>\profilepic\user.jpg" alt="<%=rchild12%>" width="100" height="100" id="node5"   onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(rchild12);%></b></td>
            <td>&nbsp;</td>
            <td><a href="show_tree.jsp?id=<%=lchild21%>"><img src="..\..\user_images\<%=lchild21%>\profilepic\user.jpg" alt="<%=lchild21%>" width="100" height="100" id="node6" onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(lchild21);%></b></td>
            <td></td>
            <td><a href="show_tree.jsp?id=<%=rchild22%>"><img src="..\..\user_images\<%=rchild22%>\profilepic\user.jpg" alt="<%=rchild22%>" width="100" height="100" id="node7" onError="this.onerror=null;this.src='images/user.jpg';"></a><b><% out.println(rchild22);%></b></td>
          </tr>
          <%
            }
          else
            {
             out.println("<H3>Nothing to display</H3>");   
            }
   }%>
        </table>
      </div>
</body>
</html>
