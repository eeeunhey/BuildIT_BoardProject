package kr.ac.kopo.board.vo;

import java.util.List;

public class BoardVO {

	private int postid;
	private String title;
	private String writerid;
	private String content;
	private String location;
	private int pay;
	private String worktime;
	private String regdate;
	private String deadline;
	private byte[] image;

	public BoardVO() {

	}

	// 전체 필드 생성자

	public BoardVO(int postid, String title, String writerid, String content, String location, int pay,
			String worktime, String regdate, String deadline, byte[] image) {
		this.postid = postid;
		this.title = title;
		this.writerid = writerid;
		this.content = content;
		this.location = location;
		this.pay = pay;
		this.worktime = worktime;
		this.regdate = regdate;
		this.deadline = deadline;
		this.image = image;
	}

	// postId를 제외한 생성자 (insert 시 사용)

	// BoardVO.java 안에 아래 생성자 추가
	public BoardVO(String title, String writerid, String content, String location, int pay, String worktime,
			String regdate, String deadline, byte[] image) {
		this.title = title;
		this.writerid = writerid;
		this.content = content;
		this.location = location;
		this.pay = pay;
		this.worktime = worktime;
		this.regdate = regdate;
		this.deadline = deadline;
		this.image = image;
	}

	// Getter & Setter
	public int getPostId() {
		return postid;
	}

	public void setPostId(int postid) {
		this.postid = postid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriterId() {
		return writerid;
	}

	public void setWriterId(String writerid) {
		this.writerid = writerid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getWorkTime() {
		return worktime;
	}

	public void setWorkTime(String workTime) {
		this.worktime = workTime;
	}

	public String getRegDate() {
		return regdate;
	}

	public void setRegDate(String regdate) {
		this.regdate = regdate;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "BoardVO [postid=" + postid + ", title=" + title + ", writerid=" + writerid + ", content=" + content
				+ ", location=" + location + ", pay=" + pay + ", worktime=" + worktime + ", regdate=" + regdate
				+ ", deadline=" + deadline + ", image=" + (image != null ? "yes" : "no") + "]";
	}
}
