<%
session.removeValue("admin");

session.setAttribute("admin",null);
Thread.sleep(2000);
out.println("Thank u");
%>