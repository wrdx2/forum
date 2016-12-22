<%@ page language="java" import="java.util.*,dxk.bean.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String backNews="";
	if(request.getAttribute("backNews")!=null){
	backNews=request.getAttribute("backNews").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>游戏论坛--会员列表</title>
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
			if (backNews.trim() != "") {
					out.println("<div id=\"backNews\">");
					out.println(backNews);
					out.println("</div>");
				}
		%>
		<div id="userListPage">
			<ul class="userList">
				<li style="width:130px;">姓名</li>
				<li style="width:130px;">密码</li>
				<li style="width:130px;">邮箱</li>
				<li style="width:60px;">性别</li>
				<li style="width:102px;">身份</li>
				<li style="width:30px;">年龄</li>
				<li style="width:130px;">注册日期</li>
				<li style="width:60px;">操作</li>
			</ul>
			<%
				@SuppressWarnings("unchecked")
					List<UserInfo> res = (ArrayList<UserInfo>) request.getAttribute("userList");
					int floor = 1;
					for (UserInfo re : res) {
						String Lusername = re.getUsername();
						String Lpassword = re.getPassword();
						int LSuserType = re.getUserType();
						int Luserid = re.getUserid();
						int Lage = re.getAge();
						String Lemail = re.getEmail();
						String LregDate = re.getRegdate();
						int sex = re.getSex();
						String Lsex = "保密";
						String LuserType;
						if (LSuserType == 1) {
							LuserType = "管理员";
						}else if(LSuserType ==2){
							LuserType = "超级管理员";					
						}else{ 
							LuserType = "普通会员";
						}
						switch (sex) {
						case 1:
							Lsex = "男";
							break;
						case 2:
							Lsex = "女";
							break;
						}
						if(LSuserType != 2){
			%>

			<form action="saveUserInfo" name="L<%=Luserid%>" method="post">
				<input type="hidden" name="userId" value="<%=Luserid%>" />
				<ul class="userList">
					<li style="width:130px;"><%=Lusername%></li>
					<%
						if((LSuserType != 0) && (userType == 1)){
									out.print("<li style='width:130px;'>******</li>"); 
								}else{
									out.print("<li style='width:130px;'>"+Lpassword+"</li>");
								}
					%>
					<li style="width:130px;"><%=Lemail%></li>
					<li style="width:60px;"><%=Lsex%></li>
					<li style="width:102px;"><%=LuserType%></li>
					<li style="width:30px;"><%=Lage%></li>
					<li style="width:130px;"><%=LregDate%></li>
					<li style="width:60px;">
						<%
							if((LSuserType == 0) || (userType == 2)){
						%> 
						<input type="button" onclick="changeForum(event);" id="submit" value="修改" /> 
						<%
 	}else{out.print("无"); }
 %>
					</li>
				</ul>
			</form>
			<%
				}
					}
			%>
		</div>
		<jsp:include page="foot.jsp" />
	</div>
	<script type="text/javascript">
		function changeForum(event) {
			var oevent = event ? event : window.event;
			var target = oevent.target ? oevent.target : oevent.srcElement;
			var oul = target.parentNode.parentNode;
			var oli = oul.getElementsByTagName("li");
			oli[0].innerHTML = '<input type="text" class="text" name="username" value="' + oli[0].innerHTML + '" />';
			oli[1].innerHTML = '<input type="text" class="text" name="password" value="' + oli[1].innerHTML + '" />';
			oli[2].innerHTML = '<input type="text" class="text" name="email" value="' + oli[2].innerHTML + '" />';
			oli[3].innerHTML = '<select name="sex"><option value="0" >保密</option><option value="1" >男</option><option value="2">女</option></select>';
			var userTypeText = oli[6].innerHTML;
			oli[4].innerHTML = '<select name="userType"><option value="0">普通会员</option><option value="1">管理员</option></select>';
			oli[7].innerHTML = '<input type="submit"  name="submit" value="保存" />';
		}
	</script>
</body>
</html>
