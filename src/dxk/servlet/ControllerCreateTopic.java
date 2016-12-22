package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dxk.bean.Topic;
import dxk.server.MysqlDB;

public class ControllerCreateTopic extends HttpServlet {

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

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
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
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest
	 * , javax.servlet.http.HttpServletResponse)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		int userId = ((Integer) session.getAttribute("userId")).intValue();
		Topic topic = new Topic();
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("topic", topic);

		String backNews = "";
		String topicTitle = request.getParameter("topicTitle").trim();
		String topicContent = request.getParameter("topicContent").trim();
		String nowDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		if (topicTitle == null) {
			topicTitle = "";
		}
		if (topicContent == null) {
			topicContent = "";
		}
		try {
			Connection conn = MysqlDB.getConnection();
			Statement stmt = MysqlDB.createStatement(conn);
			String sql = "insert into topic(topicTitle,topicContent,topicTime,userId) values ('"
					+ topicTitle + "','" + topicContent+ "','" + nowDate + "','" + userId + "')";
			int ret = MysqlDB.executeUpdate(stmt, sql);
			if (ret != 0) {
				backNews = "成功";
				topic.setBackNews(backNews);
				topic.setTopicTitle(topicTitle);
				topic.setTopicContent(topicContent);
				topic.setTopicTime(nowDate);
			}
			MysqlDB.close(stmt);
			MysqlDB.close(conn);
		} catch (Exception e) {
			backNews = "" + e;
			topic.setBackNews(backNews);
		}
		response.sendRedirect("index.jsp");
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}
