<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.News"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.entity.PageNews"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    		NewsDao nd = new NewsDao();
		int size = 4, no = 1;
		//请求中获取页码和每页个数
		if(request.getParameter("size")!=null){
			size = Integer.parseInt(request.getParameter("size"));
		}
		if(request.getParameter("no")!=null){
			no = Integer.parseInt(request.getParameter("no"));
		}
		String num = request.getParameter("num");
		if(num!=null){
			no=Integer.parseInt(num);
		}
		PageNews pn = nd.getNewsByPage(size, no);
		session.setAttribute("pagenews", pn);
//		String root = this.getServletContext().getContextPath();
//		response.sendRedirect(root+"/pages/show.jsp");
		request.getRequestDispatcher("News.jsp").forward(request, response);
	
     %>
  </body>
</html>
