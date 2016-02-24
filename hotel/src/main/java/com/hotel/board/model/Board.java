package com.hotel.board.model;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int no, hit, bno, grade;
	private String title, content, wdate, fileName, id;
	private MultipartFile file;

	public int getNo() {
		return no;
	}

	public int getHit() {
		return hit;
	}

	public int getBno() {
		return bno;
	}

	public int getGrade() {
		return grade;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getWdate() {
		return wdate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getId() {
		return id;
	}

	public MultipartFile getFile() {
		return file;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", hit=" + hit + ", bno=" + bno + ", grade=" + grade + ", title=" + title
				+ ", content=" + content + ", wdate=" + wdate + ", fileName=" + fileName + ", id=" + id + ", file="
				+ file + "]";
	}

}
