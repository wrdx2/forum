package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dxk.bean.UserInfo;
import dxk.server.MysqlDB;

public class ControllerRegister extends HttpServlet {

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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		UserInfo user = new UserInfo();
		request.setAttribute("user", user);
		request.setCharacterEncoding("UTF-8");
		String backNews = "";
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String email = request.getParameter("email").trim();
		String picture = request.getParameter("picture").trim();
		String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(Calendar.getInstance().getTime());
		if (username == null) {
			username = "";
		}
		if (password == null) {
			password = "";
		}
		if (email == null) {
			email = "";
		}
		if (picture == null) {
			picture = "";
		}

		try {
			Connection conn = MysqlDB.getConnection();
			Statement stmt = MysqlDB.createStatement(conn);
			String sql = "select username from [user] where username = '"
					+ username + "'";
			ResultSet rs = MysqlDB.executeQuery(stmt, sql);
			if (rs.next()) {
				backNews = "注册失败，此用户名已存在!";
				user.setBackNews(backNews);
			} else {
				String sql2 = "insert into [user](username,password,email,picture,regdate) values ('"
						+ username
						+ "','"
						+ password
						+ "','"
						+ email
						+ "','"
						+ picture + "','" + nowDate + "')";
				int ret = MysqlDB.executeUpdate(stmt, sql2);
				if (ret != 0) {
					backNews = "注册成功";
					user.setBackNews(backNews);
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					String sql3 = "select * from [user] where username = '"
							+ username + "' and password ='" + password + "'";
					ResultSet rs2 = MysqlDB.executeQuery(stmt, sql3);
					if (rs2.next()) {
						int userId = rs2.getInt("userId");
						int userType = rs2.getInt("userType");
						session.setAttribute("userId", userId);
						session.setAttribute("userType", userType);
					}
					MysqlDB.close(rs2);
				}
			}
			MysqlDB.close(rs);
			MysqlDB.close(stmt);
			MysqlDB.close(conn);
		} catch (Exception e) {
			backNews = "" + e;
			user.setBackNews(backNews);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("pages/register.jsp");
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
