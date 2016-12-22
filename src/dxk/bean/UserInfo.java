package dxk.bean;

/**
 * @author dxk
 * 
 */
public class UserInfo {
	private int age = 0; // 年龄
	private String backNews = ""; // 返回信息
	private String email = ""; // 邮箱
	private String nowdate; // 当前时间
	private String password = ""; // 密码
	private String picture = ""; // 头像路径
	private String regdate; // 注册日期
	private int score = 0; // 积分
	private int sex = 0;
	private int userid; // 用户ID
	private String username = ""; // 用户名
	private int userType = 0; // 用户类型

	public int getAge() {
		return age;
	}

	public String getBackNews() {
		return backNews;
	}

	public String getEmail() {
		return email;
	}

	public String getNowdate() {
		return nowdate;
	}

	public String getPassword() {
		return password;
	}

	public String getPicture() {
		return picture;
	}

	public String getRegdate() {
		return regdate;
	}

	public int getScore() {
		return score;
	}

	public int getSex() {
		return sex;
	}

	public int getUserid() {
		return userid;
	}

	public String getUsername() {
		return username;
	}

	public int getUserType() {
		return userType;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setNowdate(String nowdate) {
		this.nowdate = nowdate;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}
}
