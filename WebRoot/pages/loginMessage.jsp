<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    <title>游戏论坛  -- 登录失败</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="论坛,信息系统，王荣道" />
	<meta name="description" content="游戏论坛  我们交流的平台" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<style type="text/css">
	#errorLogin{margin-top:20px;width:950px;text-align:center;background-color:#F8F8F8;border:1px solid #DEDEDE;}
	#errorContent{width:520px;height:70px;padding:30px 100px 50px 100px;margin:70px auto;text-align:left;border:1px solid #EEEEEE;background:url(images/login/icon_warning.gif) no-repeat scroll 30px 32px #FFFFFF;}
	</style>
	<script type="text/javascript">
		var count = 5;
		function countdown() 
		{ 	
			var timeCount = document.getElementById("timeCount");
			timeCount.innerHTML = count;	 
			if(count == 0) 
			{ 
				window.history.go(-1);
			} 
			count = count - 1;
			setTimeout("countdown()",1000);   
		}
		window.onload = countdown;  
	</script>
  </head>
  
  <body>
  <div id="main">
  <jsp:include page="head.jsp" />
  <div id="errorLogin">
  	<div id="errorContent">
  		<p style="color:#E46A01; font-weight:bold; font-size:14px;">对不起，您的账号或密码错误</p>
  		<p>系统将在<span id="timeCount">5</span>秒钟之后自动跳转到默认页面</p>
	 </div>
   </div> 
  <jsp:include page="foot.jsp" />
  </div>
  </body>
</html>