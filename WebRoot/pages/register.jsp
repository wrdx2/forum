<%@ page language="java" import="java.util.*,dxk.bean.UserInfo"
	pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="dxk.bean.UserInfo" scope="request" />
<%
	String backNews = user.getBackNews();
%>
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
    <title>会员注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="论坛,信息系统，王荣道" />
	<meta name="description" content="游戏论坛  我们交流的平台" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link type="text/css" rel="stylesheet" href="css/register.css" />
	<link type="text/css" rel="stylesheet" href="css/validator.css" />
	<link type="text/css" rel="stylesheet" href="css/basic.css" />
	<style type="text/css">
	.formItems{ margin:0px 0 0 50px!important; margin-left:25px; text-align:left;}
	.formItems tr td{ line-height:40px; vertical-align:middle;}
	.formItems tr td div{float:left; width:150px;}
	.formItems .submitBtn{ text-align:center;}
	.input{ width:185px;}	
	</style>
  
  </head>
  
  <body>
  <div id="main">
  <jsp:include page="head.jsp" />
  	<%
		if (backNews.trim() != "") {
	%>
	<div id="backNews">
	<%= backNews %>
	</div>
	<%
		}
	%>
  <div id="register_content">
	<div id="left">
		<div id="login_img">
            <img src="images/register/login_title_register.gif" alt="注册新会员" />
		</div>
		<div id="register_form_div">
			<form method="post" action="register" name="register" id="login_form"  onsubmit="return register_submit();">
				<table width="512" class="formItems">  
					<tr>
			          <td height="45"><label for="userName">用户名</label></td>
			          <td  colspan="2"><input class="input" tabindex="1" type="text" maxlength="20" name="username" id="userName" /></td>
			          <td><div id="userNameTip"></div></td>
	                </tr>
	                <tr>
			          <td height="45"><label for="email">邮&nbsp;&nbsp;&nbsp;箱</label></td>
			          <td colspan="2"><input class="input" tabindex="2" type="text" maxlength="60" name="email" id="email" /></td>
			          <td><div id="emailTip"></div></td>
	                </tr>
	                <tr>
	                	<td><label for="pswd">密&nbsp;&nbsp;&nbsp;码&nbsp;</label></td>
	                    <td colspan="2"><input class="input" tabindex="3" type="password" maxlength="45" name="password" id="pswd" /></td>
	                    <td><div id="pswdTip"></div></td>
	                </tr>  
	                <tr>
	                	<td><label for="re_pswd">重复密码</label></td>
	                    <td  colspan="2"><input class="input" tabindex="4" type="password" maxlength="45" name="re_pswd" id="re_pswd" /></td>
	                    <td><div id="re_pswdTip"></div></td>
	                </tr>	                
	                <tr>
	                	<td><label for="picture">上传头像</label></td>
	                    <td  colspan="2"><input type="file"  class="input" tabindex="5" name="picture" id="picture" /></td>
	                    <td><div id="pictureTip"></div></td>
	                </tr>  
	                <tr>
	                    <td colspan="4">
	                    	<input type="checkbox" name="eula" onclick="if(this.checked){$('#submit')[0].disabled=false; }else $('#submit')[0].disabled=true;" />
							我已认真阅读并且完全同意<a href="rigister.html" target="_blank">《用户服务协议》</a>中的所有条款。
						</td>
	                </tr>        
                </table>
				<div id="register_submit_div"><input id="submit" type="submit" value="同意以上协议并注册" disabled="disabled" /></div>
			</form>
		</div>
	</div>
	<div id="register_right">
		<h4>已有账号</h4>
		<span class="register_col_light">如果您已经有登录账号，<br />请点击下面按钮直接登录</span><br />
		<div class="register_right_img"><a href="pages/login.jsp"><img src="images/register/btn_to_signin.gif" alt="立即登录" /></a></div>
		<span class="register_col_light">忘记密码，请点击下面链接取回密码。</span>
		<div class="register_right_img"><a href="#"><img src="images/register/btn_getpwd.gif" alt="找回密码" /></a></div>
	</div>
</div>
	<jsp:include page="foot.jsp" />
</div>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/function.js" type="text/javascript"></script>
<script src="js/formValidator.js" type="text/javascript"></script>
<script src="js/formValidatorRegex.js" type="text/javascript"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	$("#email").blur(function(){
		email = $("#email").val();
		$("#email").val(trim(email));
	});
	$("#userName").blur(function(){
		name = $("#userName").val();
		$("#userName").val(trim(name));
	});
	$.formValidator.initConfig({formid:"login_form"});
	$("#pswd").formValidator({onshow:"请输入密码",onfocus:"只能是字母数字下划线",oncorrect:"密码格式正确"}).inputValidator({min:6,max:45,onerrormin:"密码不能少于六位",onerrormax:"密码长度过长"}).regexValidator({regexp:"username",datatype:"enum",onerror:"只能是字母数字下划线"});
	$("#re_pswd").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致",oncorrect:"密码一致"}).inputValidator({min:1,max:45,onerror:"此项为必填项"}).compareValidator({desid:"pswd",operateor:"=",onerror:"两次输入密码不一致"});
	$("#userName").formValidator({onshow:"请输入用户名",onfocus:"用户名注册成功后不能修改",oncorrect:"用户名格式正确"}).inputValidator({min:1,onerror:"此项为必填项"}).regexValidator({regexp:"^[a-zA-Z0-9_\u4E00-\u9FA5]{1,}$",datatype:"string",onerror:"只能是字母数字下划线汉字"});
	$("#email").formValidator({onshow:"请输入你的邮箱",onfocus:"此邮箱将用来接收验证邮件",oncorrect:"邮箱格式正确"}).inputValidator({min:1,max:60,onerrormin:"此项为必填项",onerrormax:"您输入的邮箱过长"}).regexValidator({regexp:"email",datatype:"enum",onerror:"邮箱格式不正确"});
	$("#picture").formValidator({onshow:"可选项",onfocus:"可选项",oncorrect:"正确"});
});
  </script>
  </body>
</html>
