<%@page import="MyPack.*"%>
<%
    
    
    String otp=request.getParameter("otp");
    String eid=request.getParameter("eid");
    String msg="Your OTP is : "+otp;
    new email_service().send_email(eid,msg,"OTP Details for New Client Registration!!");
%>