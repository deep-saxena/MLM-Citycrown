package org.apache.jsp.About;

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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<title>CityCrown | About</title>\n");
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
      out.write("<body id=\"page2\">\n");
      out.write("<!-- START PAGE SOURCE -->\n");
      out.write("<div class=\"body3\"></div>\n");
      out.write("<div class=\"body1\">\n");
      out.write("  <div class=\"main\">\n");
      out.write("    <header>\n");
      out.write("      <div id=\"logo_box\">\n");
      out.write("        <h1><a href=\"../index.jsp\" id=\"logo\">CityCrown <span>About</span></a></h1>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"wrapper\">\n");
      out.write("        <div class=\"text1\">We work for your Profit</div>\n");
      out.write("        <div class=\"text2\">Learn About Our Company</div>\n");
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
      out.write("              <h2>Team Member One</h2>\n");
      out.write("              <div class=\"wrapper pad_bot1\">\n");
      out.write("                <figure><img src=\"images/deepanshu.JPG\" alt=\"\" class=\"left marg_right1\"></figure>\n");
      out.write("                Name: Deepanshu Saxena<br>\n");
      out.write("                College: SRMSCET</div>\n");
      out.write("              <a target=\"_blank\" href=\"http://www.google.com/+DeepanshuSaxena301193\" class=\"button\"><span><span>know More</span></span></a> </div>\n");
      out.write("          </div><br>\n");
      out.write("             <div class=\"box1_out\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("              <h2>Team Member Four</h2>\n");
      out.write("              <div class=\"wrapper pad_bot1\">\n");
      out.write("                <figure><img src=\"images/page2_img1.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\n");
      out.write("                Name: Aayush Upadhyaya <br>\n");
      out.write("                College: SRMSCET</div>\n");
      out.write("              <a href=\"#\" class=\"button\"><span><span>know More</span></span></a> </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"box1_bot\">\n");
      out.write("            <div class=\"box1_bot_left\">\n");
      out.write("              <div class=\"box1_bot_right\"></div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </article>\n");
      out.write("        <article class=\"col1 pad_left1\">\n");
      out.write("          <div class=\"box1_out\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("              <h2>Team Member Two</h2>\n");
      out.write("              <div class=\"wrapper pad_bot1\">\n");
      out.write("                <figure><img src=\"images/page2_img2.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\n");
      out.write("                Name: Ankita Agarwal<br>\n");
      out.write("               College: SRMSCET</div>\n");
      out.write("              <a href=\"#\" class=\"button\"><span><span>know More</span></span></a></div>\n");
      out.write("          </div><br>\n");
      out.write("            <div class=\"box1_out\">\n");
      out.write("            <div class=\"box1\">\n");
      out.write("              <h2>Team Member Four</h2>\n");
      out.write("              <div class=\"wrapper pad_bot1\">\n");
      out.write("                <figure><img src=\"images/page2_img2.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\n");
      out.write("                Name: Dharmendra Bahadur Singh<br>\n");
      out.write("               College: SRMSCET</div>\n");
      out.write("              <a href=\"#\" class=\"button\"><span><span>know More</span></span></a></div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"box1_bot\">\n");
      out.write("            <div class=\"box1_bot_left\">\n");
      out.write("              <div class=\"box1_bot_right\"></div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </article>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("      <div class=\"wrapper marg_top2\">\n");
      out.write("        \n");
      out.write("        <article class=\"col2 pad_left1\">\n");
      out.write("         <!-- <div class=\"pad\">-->\n");
      out.write("            <h2>About Website</h2>\n");
      out.write("            <div class=\"wrapper under\">\n");
      out.write("              <figure><img src=\"images/page2_img4.jpg\" alt=\"\" class=\"left marg_right1\"></figure>\n");
      out.write("            Are you working towards a better life for you and your family? Are you in control of your future? Are you getting the rewards your hard work deserves?\n");
      out.write("\n");
      out.write("Your life doesn't have to be a trade-off between making the money you need and having the flexibility and time to live your life to the fullest.<br> \n");
      out.write("<br><p>The CityCrown Sales and Marketing Plan puts you in control, allowing you the flexibility to work where and when you want, giving you time for family and friends as well as the opportunity to earn a good income. It adapts easily to your needs and ambitions, and grows with them, offering you all the personal support and assistance you require to become the Business Owner you want to be</p>\n");
      out.write("\n");
      out.write("<p>With CityCrown you are Connected to the global leader in multilevel marketing, with over 40 years of experience, Supported by great products and people who will help you succeed, and finally In Control of your life. </p>\n");
      out.write("\n");
      out.write("<p>To Start your own business you need to be sponsored in the business by an already existing CityCrown Business Owner(CBO). </p>\n");
      out.write("<p>The CityCrown Business Opportunity works in two-fold. Giving you a chance to build your own business at your pace and achieve the rewards and recognition linked to the plan and at the same time, helping other people do the same. </p>\n");
      out.write("<p>If you are not an CityCrown Business Owner but interested in the CityCrown Business Opportunity then <a href=\"../Contact_Us/contact_us.jsp\">Contact Us Now</a></p>\n");
      out.write("          </div>\n");
      out.write("        </article>\n");
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
      out.write("      <p class=\"lf\">Copyright &copy; 2015 <a href=\"../index.jsp\">CityCrown</a> - All Rights Reserved</p>\n");
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
