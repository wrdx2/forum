package dxk.server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import dxk.bean.Topic;

/**
 * 
 * @author dxk
 * @version 1.0
 * @date 2010-4-5
 * 
 */
public class MysqlDB {

	/**
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=forum;user=sa;password=sql");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 
	 * @param conn
	 * @return
	 */
	public static Statement createStatement(Connection conn) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	/**
	 * 
	 * @param stmt
	 * @param sql
	 * @return rs
	 */
	public static ResultSet executeQuery(Statement stmt, String sql) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 
	 * @param stmt
	 * @param sql
	 * @return ret
	 */
	public static int executeUpdate(Statement stmt, String sql) {
		int ret = 0;
		try {
			ret = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ret;
	}

	/**
	 * @param conn
	 */
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}

	/**
	 * @param stmt
	 */
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt = null;
		}
	}

	/**
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
	}

	/**
	 * 获得帖子
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Collection<Topic> getTopics() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Topic> topicList = new ArrayList<Topic>();

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt
					.executeQuery("select * from topic");
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setBackNews("成功");
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTopicTitle(rs.getString("topicTitle"));
				topic.setTopicContent(rs.getString("topicContent"));
				topic.setView(rs.getInt("view"));
				topic.setLocked(rs.getInt("locked"));
				topic.setTopicTime(rs.getDate("topicTime").toString());
				topic.setUserId(rs.getInt("userId"));
				topicList.add(topic);
			}
			return topicList;
		} finally {
			close(rs);
			close(stmt);
			close(conn);
		}
	}

	/**
	 *得到选择的帖子信息。
	 */

}
