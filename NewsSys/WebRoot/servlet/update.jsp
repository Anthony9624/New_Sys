<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
NewsDao nd = new NewsDao();
int id=Integer.parseInt(request.getParameter("id"));
News news = nd.getNewsById(id);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
 	 <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  </head>
  	<style>
		
		#div1{
			width: 480px;
			height: 320px;
			margin: 0px auto;
			
		}
		#div2{
			margin-top: 10px;
			text-align:center;
		}
		#div2 p{
		font-size: 24px;
		height:60px;
		line-height:60px;
		}
		#inp{
			margin-top: 10px;
			width: 200px;
			height: 24px;
		}
		#btn{
			display:block;
			margin: 20px auto;
			width: 60px;
			height: 24px;
		}
		#div3{
			font-size: 18px;
		}
		#tex{
			margin-top: 10px;
			width: 300px;
			height: 80px;
		}
	</style>
<body background="bg.jpg">


	<div id="wrap">
	<div id="header">
    <div class="logo fleft"></div>
    <div class="nav fleft">
    	
    </div>
    <a class="logout fright" href="login.jsp"> </a>
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

<div id="div1">
				<div id="div3">
					<form action="/mail/UpdateServlet"  method="post">     
					标题:<input id="inp" type="text" name="title" value="<%=news.getTitle() %> " readonly="readonly"><br>
					内容:<textarea id="tex" name="content"><%=news.getContent() %></textarea><br>
					发布时间：<input type="text" name="now" value="<%=news.getTime() %>" readonly="readonly" /> <br>
					<input id="btn" type="submit" value="修改">					
					</form>
				</div>
		</div>


    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer"></div><!--#footer -->
</div><!--#wrap -->
<div style="text-align:center;">

</div>


		


  </body>
</html>
