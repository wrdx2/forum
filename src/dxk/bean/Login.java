package dxk.bean;

/**
 * @author dxk
 * 
 */
public class Login {

	private String backNews = "";
	private String password;
	private boolean success = false;
	private String username;
	private int userType = 0; // 用户类型

	public String getBackNews() {
		return backNews;
	}

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}

	public int getUserType() {
		return userType;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

}
