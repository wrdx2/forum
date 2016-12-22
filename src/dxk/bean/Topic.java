package dxk.bean;

public class Topic {
	private String backNews = "";
	private int locked = 0;
	private int replyCount = 0;
	private String topicContent = "";
	private int topicId;
	private String topicTime;
	private String topicTitle = "";
	private int userId = 0;
	private int view = 0;

	public String getBackNews() {
		return backNews;
	}

	public int getLocked() {
		return locked;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public String getTopicContent() {
		return topicContent;
	}

	public int getTopicId() {
		return topicId;
	}

	public String getTopicTime() {
		return topicTime;
	}

	public String getTopicTitle() {
		return topicTitle;
	}

	public int getUserId() {
		return userId;
	}

	public int getView() {
		return view;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}

	public void setLocked(int locked) {
		this.locked = locked;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public void setTopicTime(String topicTime) {
		this.topicTime = topicTime;
	}

	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setView(int view) {
		this.view = view;
	}
}
