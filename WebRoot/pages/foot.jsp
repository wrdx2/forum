<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/viewContent.js"></script>
<div class="clear"></div>
<div id="foot">
	<p>
		网站制作：王荣道<span>&nbsp;</span><a href="mailto:1102712970@qq.com">联系我们</a><span>|</span><a href="http://www.baidu.com">广告服务</a><span>|</span><a href="pages/register.jsp">会员注册</a><span>|</span><a href="http://www.baidu.com">网站维护</a><span>|</span><a href="http://www.baidu.com">招聘信息</a><span>|</span><a href="http://www.baidu.com" style="cursor:help">问题反馈</a>
	</p>
	<p>
		 信1305_20132997_王荣道<a href="javascript:;" onclick="showlogin()">快捷登陆</a>
	</p>
	
</div>
<div id="login">
	<div id="closeLogin"><a href="javascript:;" onclick="closelogin()">×</a></div>
	<div id="loginTitle">用户登录</div>
	<form action="userlogin" method="post">
		<table>
			<tr>
				<th><label for="Tusername">用户名</label></th>
				<td><input type="text" name="username" id="Tusername" class="text" /></td>
			</tr>
			<tr>
				<th><label for="password">密 &nbsp;码</label></th>
				<td><input type="password" name="password" id="password" class="text" /></td>
			</tr>
			<tr><td colspan="2"><input type="image" src="images/common/login_02.gif" name="sumbit" id="loginButton" /></td></tr>
		</table>
	</form>
</div>