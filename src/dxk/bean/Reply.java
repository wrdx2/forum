package dxk.bean;

public class Reply {
	private int age = 0; // 年龄
	private String backNews;
	private String email = null; // 邮箱
	private String nowdate; // 当前时间
	private String picture = null; // 头像路径
	private String regdate; // 注册日期
	private String replyContent = "";
	private int replyId;
	private String replyTime;
	private int score = 0; // 积分
	private int sex = 0;
	private int topicId;
	private int userId;
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

	public String getPicture() {
		return picture;
	}

	public String getRegdate() {
		return regdate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public int getReplyId() {
		return replyId;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public int getScore() {
		return score;
	}

	public int getSex() {
		return sex;
	}

	public int getTopicId() {
		return topicId;
	}

	public int getUserId() {
		return userId;
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

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}
}
