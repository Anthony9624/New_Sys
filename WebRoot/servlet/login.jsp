<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="images/login.css" rel="stylesheet" type="text/css" />
  </head>
<body background="bg.jpg">

<div id="wrap">
	<div id="header"> </div>
    <div id="content-wrap">
    	<div class="space"> </div> 	
   	  <form action="LoginServlet" method="post"><div class="content">
        <div class="field"><label>账　户：</label><input type="text" name="uname" value="tom" /></div>
		<div class="field"><label>密　码：</label><input type="password" name="upwd" value="456"/><br /></div>
        <div class="field"><label>验证码：</label><input class="password" name="" type="password" /><br /></div>
        <div class="btn"><input id="btn" type="submit" value="登录"></div>
      </div></form>
    </div>   
    <div id="footer"> </div>
</div>

  </body>
</html>
