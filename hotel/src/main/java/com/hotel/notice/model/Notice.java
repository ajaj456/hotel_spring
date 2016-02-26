package com.hotel.notice.model;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int no,hit;
	private String title, content, wdate, startDate, endDate,fileName,firstYN;
	private MultipartFile file;

	//	리스트를 위한 변수들
	private String period;
	private int page;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFirstYN() {
		return firstYN;
	}
	public void setFirstYN(String firstYN) {
		this.firstYN = firstYN;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "Notice [no=" + no + ", hit=" + hit + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", fileName=" + fileName + ", firstYN="
				+ firstYN + ", file=" + file + ", period=" + period + ", page=" + page + "]";
	}
	
	
	
	
}
