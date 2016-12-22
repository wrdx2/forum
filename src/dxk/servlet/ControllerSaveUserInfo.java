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

public class ControllerSaveUserInfo extends HttpServlet {

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

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		int NuserType=0;
		if (session.getAttribute("userType") != null) {
			NuserType = (Integer) session.getAttribute("userType");
		}
		if(NuserType==1 || NuserType==2 ){
			String username = request.getParameter("username").trim();
			String password = request.getParameter("password").trim();
			String email = request.getParameter("email").trim();
			int sex = Integer.parseInt(request.getParameter("sex").trim());
			int userId = Integer.parseInt(request.getParameter("userId").trim());
			int userType = Integer
					.parseInt(request.getParameter("userType").trim());			
			String backNews;
			try {
				Connection conn = MysqlDB.getConnection();
				Statement stmt = MysqlDB.createStatement(conn);
				String sql = "update [user] set username ='" + username
						+ "',password='" + password + "',userType=" + userType
						+ ",email = '" + email + "',sex= " + sex
						+ " where userId= " + userId;
				int rs = MysqlDB.executeUpdate(stmt, sql);
				if (rs != 0) {
					backNews = "操作成功";
				} else {
					backNews = "操作失败";
				}
	
				MysqlDB.close(stmt);
				MysqlDB.close(conn);
			} catch (Exception e) {
				backNews = "操作失败"+e;
			}
			request.setAttribute("backNews", backNews);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("userList");
			dispatcher.forward(request, response);
		}else{
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
