package com.hotel.board.model;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int no,hit,bno;
	private String title,content,wdate,grade,fileName,id;
	private MultipartFile file;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Board(int no, int hit, int bno, String title, String content, String wdate, String grade, String fileName,
			String id, MultipartFile file) {
		super();
		this.no = no;
		this.hit = hit;
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.grade = grade;
		this.fileName = fileName;
		this.id = id;
		this.file = file;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", hit=" + hit + ", bno=" + bno + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", grade=" + grade + ", fileName=" + fileName + ", id=" + id + ", file=" + file
				+ "]";
	}
	
}
