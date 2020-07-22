<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<style>
	#tab td{
	font-size: 16px;
		border:solid;
		border-color: #000000;
	}
</style>
<body background="bg.jpg">
<%
NewsDao nd = new NewsDao();

List<News> list=nd.getAll();


 %>

<table id="tab" width="800" border="2">
  <tr>   
    <td width="200">标题</td>
    <td width="150">发布时间</td>
    <td width="150" colspan="2">操作</td>
  </tr>
  <%for(int i=0;i<list.size();i++){ %>
  <tr>
    <td><%=list.get(i).getTitle() %></td>
    <td><%=list.get(i).getTime() %></td>
    <td><a href="dodel.jsp?id=<%=list.get(i).getId() %>">删除</a></td>
    <td><a href="update.jsp?id=<%=list.get(i).getId() %>">修改</a></td>
  </tr>
  <%} %>
 
</table>



</body>
</html>