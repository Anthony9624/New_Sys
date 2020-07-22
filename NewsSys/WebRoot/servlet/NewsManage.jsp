<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="javascript/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//setMenuHeight
	$('.menu').height($(window).height()-51-27-26);
	$('.sidebar').height($(window).height()-51-27-26);
	$('.page').height($(window).height()-51-27-26);
	$('.page iframe').width($(window).width()-15-168);
	
	//menu on and off
	$('.btn').click(function(){
		$('.menu').toggle();
		
		if($(".menu").is(":hidden")){
			$('.page iframe').width($(window).width()-15+5);
			}else{
			$('.page iframe').width($(window).width()-15-168);
				}
		});
		
	//
	$('.subMenu a[href="#"]').click(function(){
		$(this).next('ul').toggle();
		return false;
		});
})
</script>
<style>
	#tab td{
		font-size: 13px;
		border:solid #add9c0; 
		border-width:0px 1px 1px 0px; 
		padding:10px 0px;
	}
	#tab th{
		font-size: 16px;
		border:solid #add9c0; 
		border-width:0px 1px 1px 0px; 
		padding:10px 0px;
	}
	#tab{
		border:solid #add9c0;
		border-width:1px 1px 0px 1px;
	}
</style>
<body background="bg.jpg">



	<div id="wrap">
	<div id="header">
    <div class="logo fleft"></div>
    <div class="nav fleft">
    	
    </div>
    <a class="logout fright" href="login.html"> </a>
    <div class="clear"></div>
    <div class="subnav">
    	<div class="subnavLeft fleft"></div>
        <div class="fleft"></div>
        <div class="subnavRight fright"></div>
    </div>
    </div><!--#header -->
    <div id="content">
    <div class="space"></div>
    <div class="menu fleft">
    	<ul>
        	<li class="subMenuTitle">新闻中心</li>
            <li class="subMenu"><a href="#">国内</a></li>
            <li class="subMenu"><a href="#" target="right">国际</a></li>
            <li class="subMenu"><a href="#" target="right">军事</a></li>
            <li class="subMenu"><a href="#" target="right">财经</a></li>
            <li class="subMenu"><a href="#" target="right">娱乐</a></li>
            <li class="subMenu"><a href="#" target="right">体育</a></li>
            <li class="subMenu"><a href="#" target="right">游戏</a></li>
        </ul>
    </div>
    <div class="sidebar fleft"><div class="btn"></div></div>
    <div class="page">

 <%
NewsDao nd = new NewsDao();

List<News> list=nd.getAll();


 %>

<table id="tab" width="800" border="2">
  <tr>
    <th width="200">新闻标题</td>
    <th width="150">发布时间</td>
    <th width="150" colspan="2">操作</td>
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


    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer"></div><!--#footer -->
</div><!--#wrap -->
<div style="text-align:center;">
</div>








</body>
</html>