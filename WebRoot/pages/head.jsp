<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" session="true"%>
<%
	int userType = 0;
	if (session.getAttribute("userType") != null) {
		userType = (Integer) session.getAttribute("userType");
	}
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
%>

<div id="top">
	<img src="images/common/logo.gif" id="topLeft" alt="game" title="game" />
	<img src="images/common/job.gif" id="topRight" alt="广告" />
</div>
<div id="menu">
	<%
		if (username == null) {
	%>
	<a href="">首页</a>
	<a href="pages/register.jsp">注册</a>
	<a href="pages/login.jsp">登陆</a>
	<%	
		} else {
			if (userType == 1) {
				out.print("管理员：");				
			} else if(userType==2){
				out.print("超级管理员：");
			} else 
				out.print("您好！");
	%>
	<%=username%>
	<a href="">首页</a>
	<a href="pages/modifyInfo.jsp">修改个人资料</a>
	<a href="pages/createTopic.jsp">创建新帖</a>
	<%
		if(userType ==1 ||userType ==2)
			out.print("<a href='userList'>会员列表</a>");
		out.print("<a href='logout'>安全退出</a>");
		}
	%>
</div>
<noscript>
	<p class="message">提示：您的浏览器已经禁用了javascript脚本，这会影响您正常使用本站的功能。</p>
</noscript>
<!-- <script type="text/javascript">
function login(){
    var dao = document.getElementById("login");
    if (dao.style.display == "none") {
        dao.style.display = "block";
        var Tusername = document.getElementById("Tusername");
        Tusername.focus();
    }
    else 
        if (dao.style.display = "block") {
            dao.style.display = "none";
        }
}
</script> -->
