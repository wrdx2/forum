<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    <title>后台管理登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Page-Enter" content="revealTrans(duration=3,transtion=11)" />
	<meta http-equiv="Page-Exit" content="revealTrans(duration=3，transtion=23)" />
	<meta name="keywords" content="论坛,信息系统，王荣道" />
	<meta name="description" content="游戏论坛  我们交流的平台" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	<style type="text/css">
	body{text-align:center; background-color:#9CDCF9;font-size:12px;font-family:"Helvetica,微软雅黑,宋体";}
		#login_main{width:680px; margin:170px auto 0 auto; text-align:left;}
		#login_left{width:350px; height:260px; float:left; clear:left; background:url(images/login/login_1.gif) no-repeat left top;}
		#login_center{width:195px; height:260px; float:left; background:url(images/login/login_2.gif) no-repeat left top;}
		#login_right{width:135px; height:260px; float:left; clear:right; background:url(images/login/login_3.gif) no-repeat left top;}
		#login_bottom{width:680px; height:160px; float:none; clear:both; background:url(images/login/login_4.gif) no-repeat left top;}
		#login{margin-top:85px;color:#007AB5; }
		#login td{padding-bottom:8px;}
		#login input{color:#007AB5;}
		.login_text{width:105px; height:18px; line-height:18px; padding:0; margin-left:4px; font-family:Tahoma,sans-serif; border:solid 1px #27B3FE; background:url(images/login/login_6.gif) repeat-x #FFFFFF;}
		.login_button{width:70px; height:24px;border:none; cursor:pointer; background:url(images/login/login_5.gif) no-repeat center center;}
		#login_tips{background:url(images/login/tip.gif) no-repeat 20px -1px;}
	</style>
</head>

<body>
<div id="login_main">
	<div id="login_left"></div>
    <div id="login_center">
    <form action="userlogin" method="post" id="login">
    	<table>
        	<tr>
            	<td><label for="username">登录名称</label></td>
                <td><input name="username" type="text" id="username" class="login_text" /></td>
            </tr>
            <tr>
            	<td><label for="password">登录密码</label></td>
                <td><input name="password" type="password" id="password" class="login_text" /></td>
            </tr>
            <tr>
            	<td align="center" colspan="2" id="login_tips">
            	请勿非法登录！
            	</td>
            </tr>
            <tr>
            	<td align="right" colspan="2">
                <input type="submit" value=" 登  录 " class="login_button" name="submit" />
                <input type="reset" value=" 取  消 " class="login_button" name="submit" onclick="javascript:window.history.go(-1);" />
                </td>
            </tr>
        </table>
     </form>
    </div>
    <div id="login_right"></div>
    <div id="login_bottom"></div>
</div>
<script type="text/javascript">
var username = document.getElementById("username");
window.onload = function(){
	username.focus();
	};
</script>
</body>
</html>

