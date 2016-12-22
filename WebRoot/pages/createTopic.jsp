<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    <title>游戏论坛--创建新帖</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="论坛,信息系统，王荣道" />
	<meta name="description" content="游戏论坛  我们交流的平台" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="css/common.css" />
  </head>

	<body>
		<div id="main">
			<%@include file="head.jsp"%>
			<%
				if (username != null && password != null) {
			%>
			<p>
				创建新帖：标题和内容均不能小于5个字符
			</p>
			<form action="createTopic" method="post" name="creatTopic"	onsubmit="return topicCheck();">
				主题：
				<input type="text" name="topicTitle" id="topicTitle" maxlength="40" size="60" />
				<p></p>
				<font style="vertical-align: top">内容：</font>
				<textarea name="topicContent" id="topicContent" rows="10" cols="50"></textarea>
				<br />				
				<input type="submit" name="submit" value="提交" class="sub" />
				<input type="reset" value="重填" class="sub" />
			</form>

			<%
				} else {
					out.print("你尚未登陆，请登陆");
				}
			%>

			<jsp:include page="foot.jsp" />
		</div>
	<script type="text/javascript">
		function topicCheck() {
			var topicTitle = document.getElementById("topicTitle");
			var topicContent = document.getElementById("topicContent");
			if (topicTitle.value.length > 4 && topicContent.value.length > 4) {
				return true;
			} else {
				alert("请按要求输入");
				return false;
			}
		}
	</script>
	</body>
</html>
