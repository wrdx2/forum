package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dxk.bean.Login;
import dxk.server.MysqlDB;

public class ControllerLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String backNews = "";
		Login loginBean = null;
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		if (username == null) {
			username = "";
		}
		if (password == null) {
			password = "";
		}

		HttpSession session = request.getSession(true);
		try {
			loginBean = (Login) session.getAttribute("login");
			if (loginBean == null) {
				loginBean = new Login();
				session.setAttribute("login", loginBean);
			}
		} catch (Exception ee) {
			loginBean = new Login();
			session.setAttribute("login", loginBean);
		}

		boolean success = loginBean.isSuccess();
		if (success == true && username.equals(loginBean.getUsername())) {
			backNews = username + "已经登录了";
			loginBean.setBackNews(backNews);
			response.sendRedirect("index.jsp");
		} else {
			Connection conn = MysqlDB.getConnection();
			Statement stmt = MysqlDB.createStatement(conn);
			String sql = "select * from [user] where username='" + username
					+ "'and password='" + password + "'";
			ResultSet rs = MysqlDB.executeQuery(stmt, sql);
			try {
				if (rs.next()) {
					backNews = "登录成功";
					int userId = rs.getInt("userId");
					int userType = rs.getInt("userType");
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(true);
					loginBean.setUsername(username);
					loginBean.setPassword(password);
					loginBean.setUserType(userType);
					session.setAttribute("userId", userId);
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					session.setAttribute("userType", userType);
					response.sendRedirect("index.jsp");
				} else {
					backNews = "用户名或密码错误";
					loginBean.setBackNews(backNews);
					loginBean.setSuccess(false);
					loginBean.setUsername(username);
					loginBean.setPassword(password);
					response.sendRedirect("pages/loginMessage.jsp");
				}
			} catch (SQLException ee) {
				backNews = "" + ee;
				loginBean.setBackNews(backNews);
				loginBean.setSuccess(false);
			}
			MysqlDB.close(rs);
			MysqlDB.close(stmt);
			MysqlDB.close(conn);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

}
