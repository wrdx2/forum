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
import javax.servlet.http.HttpSession;

import dxk.bean.UserInfo;
import dxk.server.MysqlDB;

public class ControllerUserList extends HttpServlet {

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
		HttpSession session = request.getSession(true);
		int userType=0;
		if (session.getAttribute("userType") != null) {
			userType = (Integer) session.getAttribute("userType");
		}
		if(userType==1 || userType==2 ){
			List<UserInfo> lists = new ArrayList<UserInfo>();
			try {
				Connection conn = MysqlDB.getConnection();
				Statement stmt = MysqlDB.createStatement(conn);
				String sql = "select * from [user] order by userType desc,userid";
				ResultSet rs = MysqlDB.executeQuery(stmt, sql);
	
				while (rs.next()) {
					UserInfo userList = new UserInfo();
					userList.setBackNews("操作成功");
					userList.setAge(rs.getInt("age"));
					userList.setEmail(rs.getString("email"));
					userList.setRegdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("regdate")));
					userList.setSex(rs.getInt("sex"));
					userList.setUserid(rs.getInt("userId"));
					userList.setPassword(rs.getString("password"));
					userList.setUsername(rs.getString("username"));
					userList.setUserType(rs.getInt("userType"));
					lists.add(userList);
				}
				MysqlDB.close(rs);
				MysqlDB.close(stmt);
				MysqlDB.close(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
			request.setAttribute("userList", lists);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("pages/userList.jsp");
			dispatcher.forward(request, response);
		}else {
			response.sendRedirect("error/error.jsp");
		}
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
		doGet(request, response);
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
