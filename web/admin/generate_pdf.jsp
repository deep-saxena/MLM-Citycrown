<%@page import="MyPack.*"%>
<%
  
     ServletContext sc=getServletContext();
    
     String filename=Generate_PDF.gen_pdf(sc.getRealPath("pdf-output"));
     out.println(sc.getRealPath("pdf-output")+"\\"+filename);
%>