/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.109
 * Generated at: 2023-02-10 09:31:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<link href=\"../css/myProject.css\" rel=\"stylesheet\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tvar form, loginform, id, pw, p;\r\n");
      out.write("\t\twindow.onload=function(){\r\n");
      out.write("\t\t\tform = document.querySelector('form');\r\n");
      out.write("\t\t\tid = document.querySelector('#id');\r\n");
      out.write("\t\t\tpw = document.querySelector('#pw');\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tform.onsubmit=function(){\r\n");
      out.write("\t\t\t\tfor(ele of form.querySelectorAll('div')) {\r\n");
      out.write("\t\t\t\t\tp = ele.querySelector('p');\r\n");
      out.write("\t\t\t\t\tif(p) p.parentElement.removeChild(p);\r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t//id값 없을 경우\r\n");
      out.write("\t\t\t\tif(id.value==''){\r\n");
      out.write("\t\t\t\t\tp = document.createElement('p');\r\n");
      out.write("\t\t\t\t\tp.appendChild(document.createTextNode('*회원 아이디를 입력해주세요.'));\r\n");
      out.write("\t\t\t\t\tid.parentElement.appendChild(p);\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t//pw값 없을 경우\r\n");
      out.write("\t\t\t\tif(pw.value==''){\r\n");
      out.write("\t\t\t\t\tp = document.createElement('p');\r\n");
      out.write("\t\t\t\t\tp.appendChild(document.createTextNode('*회원 비밀번호를 입력해주세요.'));\r\n");
      out.write("\t\t\t\t\tpw.parentElement.appendChild(p);\r\n");
      out.write("\t\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\treturn true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t};\r\n");
      out.write("\t</script>\r\n");
      out.write("</head>\r\n");
 
	String result="";
	if(("false").equals(request.getParameter("loginResult"))){
			result="로그인 실패하였습니다.";
	}

      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/header.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("path", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("..", request.getCharacterEncoding()), out, false);
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/menu.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("path", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("..", request.getCharacterEncoding()), out, false);
      out.write("\r\n");
      out.write("\t<form action=\"../user/dao/loginDao.jsp\" method=\"post\">\r\n");
      out.write("\t<div id=\"content\">\r\n");
      out.write("\t\t<div id=\"logintext\">ID 로그인</div>\r\n");
      out.write("\t\t<div id=\"loginform\">\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<input placeholder=\"아이디\" type=\"text\" name=\"id\" id=\"id\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<input placeholder=\"비밀번호\" type=\"password\" name=\"pw\" id=\"pw\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t");
      out.print(result );
      out.write("\r\n");
      out.write("\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t<a href=\"joinForm.jsp\">회원가입</a>\r\n");
      out.write("\t\t\t\t<button type=\"submit\">로그인</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/footer.jsp", out, false);
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
