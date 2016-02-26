/*
 * BoardModel에는 LIst<Board> 와 JspData의 
 *정보를 담을 수 있는 변수를 선언한다. 
 */
package com.hotel.notice.model;

import java.util.List;

import com.hotel.common.model.JspData;

public class NoticeModel {
 // 게시판 리스트를 담은 LIst 객체 변수 선언
	private List<Notice> list;
	private JspData jspData;
	
	public List<Notice> getList() {
		return list;
	}
	public void setList(List<Notice> list) {
		this.list = list;
	}
	public JspData getJspData() {
		return jspData;
	}
	public void setJspData(JspData jspData) {
		this.jspData = jspData;
	}
	
}
