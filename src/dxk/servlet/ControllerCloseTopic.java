package dxk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dxk.server.MysqlDB;

public class ControllerCloseTopic extends HttpServlet {

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

		request.setCharacterEncoding("UTF-8");
		int topicId = Integer.parseInt(request.getParameter("topicId").trim());
		int locked = Integer.parseInt(request.getParameter("locked").trim());
		if (locked == 0) {
			locked = 1;
		} else {
			locked = 0;
		}
		HttpSession session = request.getSession(true);
		int userType = Integer.parseInt(session.getAttribute("userType")
				.toString());
		if (userType != 0) {
			try {
				Connection conn = MysqlDB.getConnection();
				Statement stmt = MysqlDB.createStatement(conn);
				String sql = "update topic set locked = " + locked
						+ " where topicId =" + topicId;
				int rs = MysqlDB.executeUpdate(stmt, sql);
				if (rs != 0) {
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
				} else {
					response.sendRedirect("error/error.jsp");
				}
				MysqlDB.close(stmt);
				MysqlDB.close(conn);
			} catch (Exception e) {
			}
		} else {
			response.sendRedirect("error/error.jsp");
		}
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
