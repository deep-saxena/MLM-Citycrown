package org.apache.jsp.about_005fus;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class about_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("<title>CityCrown | About</title>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"all\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/layout.css\" type=\"text/css\" media=\"all\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/jquery-1.4.2.js\" ></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-yui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/cufon-replace.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/Myriad_Pro_300.font.js\"></script>\r\n");
      out.write("<!--[if lt IE 9]>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/ie6_script_other.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/html5.js\"></script>\r\n");
      out.write("<![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("<body id=\"page2\">\r\n");
      out.write("<!-- START PAGE SOURCE -->\r\n");
      out.write("<div class=\"body3\"></div>\r\n");
      out.write("<div class=\"body1\">\r\n");
      out.write("  <div class=\"main\">\r\n");
      out.write("    <header>\r\n");
      out.write("      <div id=\"logo_box\">\r\n");
      out.write("        <h1><a href=\"#\" id=\"logo\">CityCrown <span>About Us!</span></a></h1>\r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"wrapper\">\r\n");
      out.write("        <div class=\"text1\">We Work For Your Benefits!!</div>\r\n");
      out.write("        <div class=\"text2\">Get In Link !!</div>\r\n");
      out.write("       \r\n");
      out.write("      </div>\r\n");
      out.write("    </header>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"body2\">\r\n");
      out.write("  <div class=\"main\">\r\n");
      out.write("    <section id=\"content\">\r\n");
      out.write("      <div class=\"marg_top wrapper\">\r\n");
      out.write("        <article class=\"col1\">\r\n");
      out.write("          <div class=\"box1_out\">\r\n");
      out.write("            <div class=\"box1\">\r\n");
      out.write("              <h2>Team Member One</h2>\r\n");
      out.write("              <div class=\"wrapper pad_bot1\">\r\n");
      out.write("                <figure><img src=\"images/ayush.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\r\n");
      out.write("                Name: Ayush Upadhyaya<br>\r\n");
      out.write("                College: SRMSCET</div>\r\n");
      out.write("              <a href=\"https://www.facebook.com/ayush.upadhyaya.79\" target=\"_blank\" class=\"button\"><span><span>know More</span></span></a> </div>\r\n");
      out.write("          </div>\r\n");
      out.write("          </article>\r\n");
      out.write("        <article class=\"col1\">\r\n");
      out.write("          <div class=\"box1_out\">\r\n");
      out.write("            <div class=\"box1\">\r\n");
      out.write("              <h2>Team Member Two</h2>\r\n");
      out.write("              <div class=\"wrapper pad_bot1\">\r\n");
      out.write("                <figure><img src=\"images/deepanshu.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\r\n");
      out.write("               Name: Ankita Agarwal<br>\r\n");
      out.write("               College: SRMSCET</div>\r\n");
      out.write("              <a href=\"https://www.facebook.com/ankita.agarwal.96199?fref=ts\" target=\"_blank\" class=\"button\"><span><span>know More</span></span></a></div>\r\n");
      out.write("          </div>\r\n");
      out.write("         \r\n");
      out.write("          <div class=\"box1_bot\">\r\n");
      out.write("            <div class=\"box1_bot_left\">\r\n");
      out.write("              <div class=\"box1_bot_right\"></div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </article>\r\n");
      out.write("          <article class=\"col1\">\r\n");
      out.write("          <div class=\"box1_out\">\r\n");
      out.write("            <div class=\"box1\">\r\n");
      out.write("              <h2>Team Member Three</h2>\r\n");
      out.write("              <div class=\"wrapper pad_bot1\">\r\n");
      out.write("                <figure><img src=\"images/dharmendra.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\r\n");
      out.write("               Name: Deepanshu Saxena\r\n");
      out.write("               College: SRMSCET</div>\r\n");
      out.write("              <a href=\"https://www.facebook.com/depanshu.saxena30?fref=ts\" target=\"_blank\" class=\"button\"><span><span>know More</span></span></a> </div>\r\n");
      out.write("          </div>\r\n");
      out.write("      </article>\r\n");
      out.write("        <article class=\"col1\">\r\n");
      out.write("          <div class=\"box1_out\">\r\n");
      out.write("            <div class=\"box1\">\r\n");
      out.write("              <h2>Team Member Four</h2>\r\n");
      out.write("              <div class=\"wrapper pad_bot1\">\r\n");
      out.write("                <figure><img src=\"images/ankita.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\r\n");
      out.write("                Name: Dharmendra Bahadur Singh<br>\r\n");
      out.write("                College: SRMSCET</div>\r\n");
      out.write("              <a href=\"https://www.facebook.com/dharmendratech?fref=ts\" target=\"_blank\" class=\"button\"><span><span>know More</span></span></a> </div>\r\n");
      out.write("          </div>\r\n");
      out.write("         </article>\r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("        <article class=\"col2 pad_left1\">\r\n");
      out.write("          <div class=\"pad\">\r\n");
      out.write("            <h2>About Website</h2>\r\n");
      out.write("            <div class=\"wrapper under\">\r\n");
      out.write("              <figure><img src=\"images/page2_img4.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\r\n");
      out.write("              Are you working towards a better life for you and your family? Are you in control of your future? Are you getting the rewards your hard work deserves?\r\n");
      out.write("\r\n");
      out.write("Your life doesn't have to be a trade-off between making the money you need and having the flexibility and time to live your life to the fullest.<br> \r\n");
      out.write("<br><p>The CityCrown Sales and Marketing Plan puts you in control, allowing you the flexibility to work where and when you want, giving you time for family and friends as well as the opportunity to earn a good income. It adapts easily to your needs and ambitions, and grows with them, offering you all the personal support and assistance you require to become the Business Owner you want to be</p>\r\n");
      out.write("\r\n");
      out.write("<p>With CityCrown you are Connected to the global leader in multilevel marketing, with over 40 years of experience, Supported by great products and people who will help you succeed, and finally In Control of your life. </p>\r\n");
      out.write("\r\n");
      out.write("<p>To Start your own business you need to be sponsored in the business by an already existing CityCrown Business Owner(CBO). </p>\r\n");
      out.write("<p>The CityCrown Business Opportunity works in two-fold. Giving you a chance to build your own business at your pace and achieve the rewards and recognition linked to the plan and at the same time, helping other people do the same. </p>\r\n");
      out.write("<p>If you are not an CityCrown Business Owner but interested in the CityCrown Business Opportunity then <a href=\"../Contact_Us/contact_us.jsp\">Contact Us Now</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </article>\r\n");
      out.write("      </div>\r\n");
      out.write("    </section>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"main\">\r\n");
      out.write("  <footer>\r\n");
      out.write("    <div class=\"wrapper\">\r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </article>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"under2\"></div>\r\n");
      out.write("    <div class=\"footerlink\">\r\n");
      out.write("      <p class=\"lf\">Copyright &copy; 2014 <a href=\"#\">CityCrown</a> - All Rights Reserved</p>\r\n");
      out.write("   \r\n");
      out.write("      <div style=\"clear:both;\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </footer>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\"> Cufon.now(); </script>\r\n");
      out.write("<!-- END PAGE SOURCE -->\r\n");
      out.write("</body>\r\n");
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
