<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.Users"%>
<%@page import="com.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	NewsDao nd = new NewsDao();
	int id=Integer.parseInt(request.getParameter("id"));
	nd.delNews(id);
	request.getRequestDispatcher("NewsManage.jsp").forward(request, response);
%>