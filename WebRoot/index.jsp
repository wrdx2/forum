<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.Collection,java.util.Iterator"%>
<%@page import="dxk.server.MysqlDB,dxk.bean.Topic,dxk.bean.Login"%>
<jsp:useBean id="topicList" scope="application"
	class="dxk.server.MysqlDB" />

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
<title>论坛 -- 首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Page-Enter"
	content="revealTrans(duration=2,transtion=23)" />
<meta http-equiv="Page-Exit"
	content="revealTrans(duration=2，transtion=23)" />
<meta name="keywords" content="论坛,王荣道首页" />
<meta name="description" content="论坛  我们交流的平台" />
<meta name="author" content="王荣道" />
<meta name="copyright" content="信1305_20132997_王荣道" />
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/common.css" />

</head>

<body>
	<div id="main">
		<%@include file="pages/head.jsp"%>
		<table id="topicList" frame="void">
			<tr bgcolor="#E6E6E6">
				<th width="750px" align="left" class="topicTitleList">标题</th>
				<th width="90px" align="center">发帖日期</th>
				<th width="30px" align="center">点击</th>
				<%
					if (userType != 0) {
				%>
				<th width="40px" align="center">删除</th>
				<th width="40px" align="center">关闭</th>
				<%
					}
				%>
			</tr>
			<%
				Collection dao = topicList.getTopics();
				Iterator it = dao.iterator();
				int i = 1;
				String bg;
				while (it.hasNext()) {
					if (i % 2 == 0) {
						bg = "#FFFFFF";
					} else {
						bg = "#d7eafb";
					}
					Topic topic = (Topic) it.next();
					String topicTitle = topic.getTopicTitle();
					String topicContent = topic.getTopicContent();
					int view = topic.getView();
					int locked = topic.getLocked();
					int topicId = topic.getTopicId();
					String topicTime = topic.getTopicTime();
					int replyCount = topic.getReplyCount();
			%>
			<tr bgcolor="<%=bg%>">
				<td align="left" class="topicTitleList"><a
					href="viewContent?topicId=<%=topicId%>"><%=topicTitle%></a></td>
				<td align="center"><%=topicTime%></td>
				<td align="center"><%=view%></td>
				<%
					if (userType != 0) {
				%>
				<td><a href="deleteTopic?topicId=<%=topicId%>">删除</a></td>
				<td><a
					href="closeTopic?topicId=<%=topicId%>&locked=<%=locked%>"> <%
 	if (locked == 1) {
 				out.print("关闭");
 			} else {
 				out.print("开启");
 			}
 %> </a></td>
				<%
					}
						i++;
				%>
			</tr>
			<%
				}
			%>
		</table>
		<jsp:include page="pages/foot.jsp" />
	</div>
</body>


</html>