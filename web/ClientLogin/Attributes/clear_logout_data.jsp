<%
session.removeValue("id");
session.removeValue("name");
session.removeValue("pass");

session.setAttribute("id",null);
session.setAttribute("name",null);
session.setAttribute("pass",null);
Thread.sleep(2000);
out.println("Thank u");
%>