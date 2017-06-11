
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var x;
            function log()
            {
                x=new XMLHttpRequest();
                var url="clear_logout_data.jsp";
                x.onreadystatechange=MyFunction;
                x.open("GET", url, true);
                x.send(null);
            }
            function MyFunction()
            {
                if(x.readyState==4||x.readyState=="complete"){
                    location="../../index.jsp";
                }
                
            }
            function noBack()
            {
                window.history.forward();
            }
        </script>
    </head>
    <body onload="log(),noBack()">
        <strong>Redirecting</strong> Please Wait.......
    </body>
</html>
