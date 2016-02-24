package com.hotel.reply.model;

public class Reply {
	private int no, reno;
	private String content, wdate, id;

	@Override
	public String toString() {
		return "Reply [no=" + no + ", reno=" + reno + ", content=" + content + ", wdate=" + wdate + ", id=" + id + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
