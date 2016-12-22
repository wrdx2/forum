package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dxk.bean.UserInfo;
import dxk.server.MysqlDB;

public class ControllerModifyInfo extends HttpServlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserInfo info = new UserInfo();
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("userInfo", info);// 将Bean存储到request对象中

		HttpSession session = request.getSession(true);
		int userId = ((Integer) session.getAttribute("userId")).intValue();
		String username = (String) session.getAttribute("username");
		String pwd = (String) session.getAttribute("password");

		String backNews = "";
		String password = request.getParameter("password").trim();
		String email = request.getParameter("email").trim();
		int age = Integer.parseInt(request.getParameter("age").trim());
		int sex = Integer.parseInt(request.getParameter("sex").trim());
		if (password == null) {
			password = "";
		}
		if (email == null) {
			email = "";
		}

		try {
			Connection conn = MysqlDB.getConnection();
			Statement stmt = MysqlDB.createStatement(conn);
			String sql = "update [user] set password ='" + password
					+ "',email = '" + email + "',age = '" + age + "',sex= '"
					+ sex + "' where username= '" + username
					+ "'and password = '" + pwd + "'and userId = '" + userId
					+ "'";
			int rs = MysqlDB.executeUpdate(stmt, sql);
			if (rs != 0) {
				backNews = "操作成功";
				info.setBackNews(backNews);
				session.setAttribute("username", username);
				session.setAttribute("password", password);
			} else {
				backNews = "操作失败";
				info.setBackNews(backNews);

			}

			MysqlDB.close(stmt);
			MysqlDB.close(conn);
		} catch (Exception e) {
			backNews = "" + e;
			info.setBackNews(backNews);
		}
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("pages/modifyInfo.jsp");
		dispatcher.forward(request, response);
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
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
