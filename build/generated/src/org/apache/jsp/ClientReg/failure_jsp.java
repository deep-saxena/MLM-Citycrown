package org.apache.jsp.ClientReg;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class failure_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<title>CityCrown-Client</title>\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("\n");
      out.write("<meta http-equiv=\"Refresh\" content=\"5; url=registration.jsp\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/layout.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-1.4.2.js\" ></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-yui.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-replace.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/Myriad_Pro_300.font.js\"></script>\n");
      out.write("</head>\n");
      out.write("<body id=\"page1\" class=\"body1\">\n");
      out.write("<!-- START PAGE SOURCE -->\n");
      out.write("<div class=\"body3\"></div>\n");
      out.write("<div class=\"body1\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("    <header>\n");
      out.write("      <div id=\"logo_box\">\n");
      out.write("        <h1><a href=\"../index.jsp\" id=\"logo\">CityCrown - Client<span>Registration Failed</span></a></h1>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("    </header>\n");
      out.write("      \n");
      out.write("  </div>\n");
      out.write("    <h1 style=\"margin-left:300px\">CAPTCHA Validation Failed!\n");
      out.write("            You'll be redirected to registration portal in 5 secs!!</h1><br>\n");
      out.write("    <div id=\"login\" style=\"margin-left:350px\">\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
