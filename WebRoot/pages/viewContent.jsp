<%@ page language="java" import="java.util.*,dxk.bean.*"
	pageEncoding="UTF-8"%>
<jsp:useBean id="user" type="dxk.bean.UserInfo" scope="request" />
<jsp:useBean id="topic" type="dxk.bean.Topic" scope="request" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	int topicId = Integer.parseInt(request.getAttribute("topicId")
			.toString());
	int locked = topic.getLocked();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>游戏论坛--<jsp:getProperty property="topicTitle" name="topic" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Page-Enter" content="revealTrans(duration=3,transtion=23)" />
		<meta http-equiv="Page-Exit" content="revealTrans(duration=3，transtion=23)" />
		<meta name="keywords" content="论坛,信息系统，王荣道" />
		<meta name="description" content="游戏论坛  我们交流的平台" />	
		<meta name="author" content="王荣道" />
		<meta name="copyright" content="信1305_20132997_王荣道" />
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script type="text/javascript" src="js/viewContent.js"></script>
	</head>

	<body>
		<div id="main">
			<%@include file="head.jsp"%>

			<%--  帖子的相关信息--%>
			<div
				style="width: 940px; padding-left: 10px; height: 24px; line-height: 24px; background: #EDF3FD">
				主题：<jsp:getProperty property="topicTitle" name="topic" />
			</div>
			<table class="replyContent">
				<tr>
					<th valign="top" onmouseover="javascript:messTShow();" onmouseout="javascript:messTHidden();" >
					
					<!--个人信息弹出层-->
					<div class="replyUserMessage" id="topicShow">
						<span> <jsp:getProperty property="username" name="user" />的个人资料
						</span>
						<ul>
							<li>
								邮箱：
							</li>
							<li><jsp:getProperty property="email" name="user" /></li>
							<li>
								注册时间:
							</li>
							<li><jsp:getProperty property="regdate" name="user" /></li>
							<li>
								性别：
								<%
								int Tsex = user.getSex();
								if (Tsex == 0)
									out.print("保密");
								else if (Tsex == 1)
									out.print("男");
								else
									out.print("女");
							%>
							</li>
							<li>
								年龄：<jsp:getProperty property="age" name="user" /></li>
						</ul>
					</div>
							
						<div class="replyLeftTop">
							发帖:<jsp:getProperty property="username" name="user" />
							<br/>
							邮箱:
							<jsp:getProperty property="email" name="user" />
						</div>
						<img src="images/user/002.jpg"
							alt="<jsp:getProperty property="username" name="user"/>的个人头像"
							title="<jsp:getProperty property="username" name="user"/>的个人头像" />
					</th>
					<td valign="top">
						<div class="replyListTop">
							发表于：<jsp:getProperty property="topicTime" name="topic" />
							浏览统计：<jsp:getProperty property="view" name="topic" />人次
						</div>
						<jsp:getProperty property="topicContent" name="topic" />
					</td>
				</tr>
			</table>

			<%
				@SuppressWarnings("unchecked")
				List<Reply> res = (ArrayList<Reply>) request.getAttribute("replyList");
				int floor = 1;
				for (Reply re : res) {
					int replyId = re.getReplyId();
					String repUsername = re.getUsername();
					String repEmail = re.getEmail();
					String repDate = re.getReplyTime();
					String repRegDate = re.getRegdate();
					int repAge = re.getAge();
					int sex = re.getSex();
					String repSex = "保密";
					switch (sex) {
					case 1:
						repSex = "男";
						break;
					case 2:
						repSex = "女";
						break;
					}
			%>
			<%-- 回帖的相关信息 --%>
			<table class="replyContent">
				<tr>
					<th valign="top" onmouseover="javascript:messShow('re<%=replyId%>');" onmouseout="javascript:messHidden('re<%=replyId%>');">
					
						<!--个人信息弹出层-->
						<div class="replyUserMessage" id="re<%=replyId%>">
							<span> <%=repUsername%>的个人资料 </span>
							<ul>
								<li>
									邮箱：
								</li>
								<li><%=repEmail%></li>
								<li>
									注册时间:
								</li>
								<li><%=repRegDate%></li>
								<li>
									性别：<%=repSex%></li>
								<li>
									年龄：<%=repAge%></li>
							</ul>
						</div>
										
						<div class="replyLeftTop">
							回帖：<%=repUsername%>
							<br />
							邮箱：<%=repEmail%>
						</div>
						<img src="images/user/005.jpg" alt="<%=repUsername%>" title="<%=repUsername%>的个人头像" />
					</th>
					<td valign="top">
						<div class="replyListTop">
							回复于：<%=repDate%>	
							<!-- 楼层 -->
							<div class="replyFloor">
								<%
									out.print(floor + "楼");
										floor++;
										if (userType != 0) {
								%>
								<a href="deleteReply?replyId=<%=replyId%>&topicId=<%=topicId%>"><img
										src="images/common/delete.gif" alt="删除此回复" title="删除此回帖"
										class="deleteReply" /> </a>
								<%
									}
								%>
							</div>						
						</div>
							<%
								out.print(re.getReplyContent());
							%>
							
					</td>
				</tr>
			</table>
			<%--  会员回帖--%>
			<%
				}
				if (username != null && locked == 1) {
			%>
			<form action="reply" method="post" onsubmit="return replyCheck();">
				<p>
					回复：
				</p>
				<textarea name="replyContent" id="replyContent" rows="10" cols="50"></textarea>
				<br />
				<input type="submit" name="sumbit" value="提交" class="sub" />
				<input type="hidden" name="topicId" value="<%=topicId%>" />
				<input type="reset" value="重填" class="sub" />
			</form>
			<%
				} else if (username == null) {
			%>
			<center>
				<font color="#AAAAAA" size="+1"><b>友情提示：登陆之后你才可以回复帖子</b></font>
			</center>
			<%
				} else {
			%>
			<center>
				<font color="#AAAAAA" size="+1"><b>友情提示：此贴已经被管理员关闭，暂时不能回复</b></font>
			</center>
			<%
				}
			%>

			<jsp:include page="foot.jsp" />
		</div>

	</body>
</html>