package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dxk.bean.Reply;
import dxk.bean.Topic;
import dxk.bean.UserInfo;
import dxk.server.MysqlDB;

public class ControllerViewContent extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String backNews = "", topicTitle = "", topicContent = ""; // 帖子的信息
		String topicTime;
		int locked, userId, view; // 帖子的信息
		String backNews2 = "", email = "", username = ""; // 发帖人的信息
		//String regdate;
		int score = 0, age = 0, sex = 0; // 发帖人的信息

		request.setCharacterEncoding("UTF-8");
		int topicId = Integer.parseInt(request.getParameter("topicId").trim());
		request.setAttribute("topicId", topicId);
		Topic topic = new Topic();
		UserInfo user = new UserInfo();
		request.setAttribute("topic", topic);
		request.setAttribute("user", user);

		try {
			Connection conn = MysqlDB.getConnection();
			Statement stmt = MysqlDB.createStatement(conn);

			/**
			 * 查询帖子的相关信息
			 */
			String sql = "select * from topic where topicId= " + topicId;
			ResultSet rs = MysqlDB.executeQuery(stmt, sql);
			if (rs.next()) {
				backNews = "操作成功";
				topicTitle = rs.getString("topicTitle");
				topicContent = rs.getString("topicContent");
				topicTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(rs.getTimestamp("topicTime"));
				view = rs.getInt("view");
				locked = rs.getInt("locked");
				userId = rs.getInt("userId");
				topic.setBackNews(backNews);
				topic.setLocked(locked);
				topic.setTopicId(topicId);
				topic.setTopicTime(topicTime);
				topic.setTopicTitle(topicTitle);
				topic.setUserId(userId);
				topic.setView(view);
				topic.setTopicContent(topicContent);

				String updateView = "update topic set [view] = [view] +1  where topicId ="
						+ topicId; // 把浏览量加一
				int rs3 = MysqlDB.executeUpdate(stmt, updateView);
				if (rs3 != 0) {

				} else {

				}

				/**
				 * 查询发帖人的相关信息
				 */
				String sql2 = "select * from [user] where userId = " + userId;
				ResultSet rs2 = MysqlDB.executeQuery(stmt, sql2);
				if (rs2.next()) {
					backNews2 = "操作成功";
					username = rs2.getString("username");
					score = rs2.getInt("score");
					email = rs2.getString("email");
					age = rs2.getInt("age");
					sex = rs2.getInt("sex");
					user.setRegdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(rs2.getDate("regdate")));
					user.setBackNews(backNews2);
					user.setAge(age);
					user.setSex(sex);
					user.setEmail(email);
					// user.setRegdate(regdate);
					user.setUsername(username);
					user.setScore(score);
					MysqlDB.close(rs2);
				}
			}

			MysqlDB.close(rs);
			MysqlDB.close(stmt);
			MysqlDB.close(conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			backNews = "" + e;
			topic.setBackNews(backNews);
		}

		/**
		 * 以下是获取回帖的相关信息
		 */

		List<Reply> lists = new ArrayList<Reply>();
		try {
			Connection conn4 = MysqlDB.getConnection();
			Statement stmt4 = MysqlDB.createStatement(conn4);
			String sql4 = "select [user].*, reply.* from [user],reply where topicId = "
					+ topicId
					+ " and [user].userId = reply.userId order by reply.replyId";
			ResultSet rs4 = MysqlDB.executeQuery(stmt4, sql4);

			while (rs4.next()) {
				Reply replyList = new Reply();
				replyList.setBackNews("成功");
				replyList.setTopicId(topicId);
				replyList.setReplyId(rs4.getInt("replyId"));
				replyList.setReplyContent(rs4.getString("replyContent"));
				replyList.setScore(rs4.getInt("score"));
				replyList.setAge(rs4.getInt("age"));
				replyList.setEmail(rs4.getString("email"));
				replyList.setUsername(rs4.getString("username"));
				replyList.setUserType(rs4.getInt("userType"));
				replyList.setSex(rs4.getInt("sex"));
				replyList.setReplyTime(new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss").format(rs4
						.getTimestamp("replyTime")));
				replyList
						.setRegdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(rs4.getTimestamp("regdate")));
				lists.add(replyList);
			}
			MysqlDB.close(rs4);
			MysqlDB.close(stmt4);
			MysqlDB.close(conn4);
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("replyList", lists);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("pages/viewContent.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
