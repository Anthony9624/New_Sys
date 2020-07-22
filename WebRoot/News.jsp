<%@page import="com.dao.NewsDao"%>
<%@page import="com.entity.News"%>
<%@page import="com.entity.PageNews"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>

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
		font-size: 16px;
		border:solid #add9c0; 
		border-width:0px 1px 1px 0px; 
		padding:10px 0px;
	}
	#tab th{
		border:solid #add9c0; 
		border-width:0px 1px 1px 0px; 
		padding:10px 0px;
	}
	#tab{
		border:solid #add9c0;
		border-width:1px 1px 0px 1px;
	}
	body{    
        background-image: url(/NewsSys/WebRoot/images/bg.jpg);    
        background-size:cover;  
     } 
     #p1{
     	font-weight: 100;
     	font-size: 16px;
     } 
     #p2{
     	font-size: 16px;
     }
</style>
</head>

<body background="bg.jpg">	

		<div id="wrap">
	<div id="header">
    <div class="logo fleft"></div>
    <div class="nav fleft">
    	
    </div>
    
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
			<table id="tab" >
			  <tr>
			    <th width="400">新闻标题</th>
			    <th width="350">发布时间</th>			    
			  </tr>
			  <%
			  	PageNews pn = (PageNews)session.getAttribute("pagenews");
			  	for(News n : pn.getList()){
			  	 %>
			  	 <tr>
			  	 <td><a href="Viewnews.jsp?id=<%=n.getId() %>"><%=n.getTitle() %></a></td>
			  	 <td><%=n.getTime()%></td>
			  	 </tr>
				<%}%>
				</table>
			   <p>
			   	<%
			   		for(int i=1; i<=pn.getTotalpages(); i++){
			   		%>
			   		<a id="p1" href="doPage.jsp?no=<%=i%>"><%=i %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   		<%
			   		}
			   		 %>
			   </p>	
			   
			  <p id="p2"> 第<input type="text" id="num" oninput="value=value.replace(/[^\d]/g,'')" />页</p>
				<button onclick="javascript:window.location.href='doPage.jsp?num='+ document.getElementById('num').value" >跳转</button>		  



    </div>
    </div><!--#content -->
    <div class="clear"></div>
    <div id="footer"></div><!--#footer -->
</div><!--#wrap -->
<div style="text-align:center;">
</div>
</body>
</html>