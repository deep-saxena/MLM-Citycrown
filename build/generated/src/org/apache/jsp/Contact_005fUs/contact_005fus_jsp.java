package org.apache.jsp.Contact_005fUs;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class contact_005fus_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>CityCrown | Contacts</title>\n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/layout.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\">\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-1.4.2.js\" ></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-yui.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-replace.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/Myriad_Pro_300.font.js\"></script>\n");
      out.write("<!--[if lt IE 9]>\n");
      out.write("<script type=\"text/javascript\" src=\"js/ie6_script_other.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"js/html5.js\"></script>\n");
      out.write("<![endif]-->\n");
      out.write("</head>\n");
      out.write("<body id=\"page5\">\n");
      out.write("<!-- START PAGE SOURCE -->\n");
      out.write("<div class=\"body3\"></div>\n");
      out.write("<div class=\"body1\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("    <header>\n");
      out.write("      <div id=\"logo_box\">\n");
      out.write("        <h1><a href=\"../index.jsp\" id=\"logo\">CityCrown <span>Contact Us!</span></a></h1>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"wrapper\">\n");
      out.write("        <div class=\"text1\">We work for your Profit</div>\n");
      out.write("        <div class=\"text2\">Get in Link</div>\n");
      out.write("       </div>\n");
      out.write("    </header>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"body2\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("    <section id=\"content\">\n");
      out.write("      <div class=\"marg_top wrapper\">\n");
      out.write("        <article class=\"col1\">\n");
      out.write("          <div class=\"box1_out\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("              <h2>Our Contacts</h2>\n");
      out.write("              <div class=\"wrapper\">\n");
      out.write("                <article class=\"col2\">\n");
      out.write("                  <p> <strong> Country:<br>\n");
      out.write("                    City:<br>\n");
      out.write("                    Telephone:<br>\n");
      out.write("                    Email: </strong> </p>\n");
      out.write("                </article>\n");
      out.write("                <article class=\"col3\">\n");
      out.write("                  <p> India<br>\n");
      out.write("                    Bareilly<br>\n");
      out.write("                    0581-2000000<br>\n");
      out.write("                    <a href=\"#\">city_crown@gmail.com</a> </p>\n");
      out.write("                </article>\n");
      out.write("              </div>\n");
      out.write("           </div>\n");
      out.write("          <div class=\"box1_bot\">\n");
      out.write("            <div class=\"box1_bot_left\">\n");
      out.write("              <div class=\"box1_bot_right\"></div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </article>\n");
      out.write("        <article class=\"col2 pad_left1\">\n");
      out.write("          <div class=\"box1_out\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("              <h2>Miscellaneous Info</h2>\n");
      out.write("              <p>Get assistance regarding any query, issue or ideas related to this website whether you've been a former user, current one or even if you are wanting to join us! So, get in touch with us, post your reviews and queries and get in through your contact details. We will reach you shortly!</p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"box1_bot\">\n");
      out.write("            <div class=\"box1_bot_left\">\n");
      out.write("              <div class=\"box1_bot_right\"></div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </article>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"wrapper marg_top2\">\n");
      out.write("        <div class=\"pad\">\n");
      out.write("                 <h2>Contact Form</h2>\n");
      out.write("          <form id=\"ContactForm\" action=\"../MyMail\">\n");
      out.write("            <div class=\"wrapper pad_bot1\">\n");
      out.write("              <div class=\"wrapper\">\n");
      out.write("                <div class=\"bg\">\n");
      out.write("                  <input type=\"text\" class=\"input\" name=\"name\" />\n");
      out.write("                </div>\n");
      out.write("                Your Name:<br />\n");
      out.write("              </div>\n");
      out.write("              <div class=\"wrapper\">\n");
      out.write("                <div class=\"bg\">\n");
      out.write("                  <input type=\"text\" class=\"input\" name=\"email\" />\n");
      out.write("                </div>\n");
      out.write("                Your E-mail:<br />\n");
      out.write("              </div>\n");
      out.write("              <div class=\"wrapper\">\n");
      out.write("                <div class=\"bg\">\n");
      out.write("                  <div class=\"textarea\">\n");
      out.write("                    <textarea  name=\"message\" cols=\"1\" rows=\"1\"></textarea>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                Your Message:<br />\n");
      out.write("              </div>\n");
      out.write("              <div class=\"wrapper\"> <a onclick=\"document.getElementById('ContactForm').submit();\" class=\"button\"><span><span>send</span></span></a> <a href=\"contacts.html\" class=\"button marg_right1\"><span><span>clear</span></span></a> </div>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"main\">\n");
      out.write("  <footer>\n");
      out.write("    <div class=\"wrapper\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"under2\"></div>\n");
      out.write("    <div class=\"footerlink\">\n");
      out.write("      <p class=\"lf\">Copyright &copy; 2014 <a href=\"../index.jsp\">CityCrown</a> - All Rights Reserved</p>\n");
      out.write("      <div style=\"clear:both;\"></div>\n");
      out.write("    </div>\n");
      out.write("  </footer>\n");
      out.write("</div>\n");
      out.write("<script type=\"text/javascript\"> Cufon.now(); </script>\n");
      out.write("<!-- END PAGE SOURCE -->\n");
      out.write("</body>\n");
      out.write("</html>");
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
