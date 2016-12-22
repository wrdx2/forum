<%@ page language="java" import="java.util.*,dxk.server.*,java.sql.*" pageEncoding="UTF-8" %>
<%@ page import="dxk.bean.UserInfo"%> 
<jsp:useBean id="userInfo" class="dxk.bean.UserInfo" scope="request"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String username = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password"); 
String backNews = userInfo.getBackNews();
String email = "";
int age = 0 ,sex = 0;

try {
		Connection conn = MysqlDB.getConnection();
		Statement stmt = MysqlDB.createStatement(conn);
		String sql = "select * from [user] where username = '"
				+ username + "' and password = '"+password+"'";
		ResultSet rs = MysqlDB.executeQuery(stmt, sql);
		if (rs.next()) {
			email = rs.getString("email");
			age = rs.getInt("age");
			sex = rs.getInt("sex");
		}
		MysqlDB.close(rs); 
		MysqlDB.close(stmt);
		MysqlDB.close(conn);
	} catch (Exception e) {
	
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    <title>游戏论坛--<%= username %>--修改个人资料</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="论坛,信息系统，王荣道" />
	<meta name="description" content="游戏论坛  我们交流的平台" />	
	<meta name="author" content="王荣道" />
	<meta name="copyright" content="信1305_20132997_王荣道" />
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" /> 
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/userInfoCheck.js"></script>	
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
	<% if(username != null && password != null){	
	%>
	<div id="modifyUserInfoTitle"><%= username %>您好！您现在可以修改您的个人资料</div>
	<form action="modifyUserInfo" name="modifyUserInfo" method="post" onsubmit="return userInfo.checkValidation();">
	<table id="modifyUserInfo">
		<tr>
			<th><label for="email">邮箱</label></th>
			<td>
				<input type="text" id="email" name="email" value="<%= email %>" class="text" />
				<span class="tips" >* 必填</span>
			</td>
		</tr>
		<tr>
			<th><label for="password2">新密码</label></th>
			<td>
				<input type="password" id="password2" name="password2"  class="text" />
				<span class="tips" >* 不少于六位</span>
			</td>
		</tr>
		<tr>
			<th><label for="password1">确认密码</label></th>
			<td>
				<input type="password" id="password1" name="password" class="text" />
				<span class="tips" >* 必填</span>
			</td>
		</tr>
		<tr>
			<th><label for="age">年龄</label></th>
			<td>
			<select name="age" id="age">
			<%
			 for(int i = 0;i<=100;i++){
			 	if(i == age )
			 	 	out.print("<option value='"+i+"' selected='selected'>"+i+"</option>");
			 	 else
			 	 	out.print("<option value='"+i+"'>"+i+"</option>");
			 }
			 %>			
			</select>
			</td>
			
		</tr>
		<tr>
			<th>性别</th>
			<td>
				<input type="radio" name="sex" id="boy" value="1" <% if(sex == 1){out.print("checked='checked'");} %> /><label for="boy">男</label>&nbsp;
				<input type="radio" name="sex" id="girl" value="2" <% if(sex == 2){out.print("checked='checked'");} %> /><label for="girl">女</label>&nbsp;
				<input type="radio" name="sex" id="secret" value="0" <% if(sex == 0){out.print("checked='checked'");} %> /><label for="secret">保密</label>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" name="submit" value="保存设置" /></td>
		</tr>		 
	</table>
	</form>
	<% }else{ %>
	您尚未登陆，请先登陆
	<%  }%>
	<jsp:include page="foot.jsp" />
	</div>
  </body>
</html>
