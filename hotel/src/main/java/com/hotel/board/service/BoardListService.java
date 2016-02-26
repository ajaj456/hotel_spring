package com.hotel.board.service;

import java.util.List;

import com.hotel.board.dao.BoardDao;
import com.hotel.board.model.Board;
import com.hotel.board.model.BoardModel;
import com.hotel.common.model.JspData;
import com.hotel.common.service.ServiceInterface;

public class BoardListService implements ServiceInterface{
	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardListService.service()");
		// page처리를 위한 변수 선언
		// page : 현재 page = 보여줄 페이지 ( 기본  =  1 )
		int page = (Integer)obj;
		int totalPage = 0; // 전체 페이지 =  (전체글수-1) / 페이지당 글 수 + 1
		int totalRow = 0; // 전체 글수 = DB에서 가져온다. Dao의 메소드 호출
		int rowsPerPage = 5; // 한페이지에 보여 줄 글의 갯수 = 정해준다.
		int startRow = 0; // DB에서 가져올 글의 첫 번째 순서(rownum) 번호
		// startRow = ( page-1 ) * rowsPerPage + 1
		int endRow = 0; // DB에서 가져올 글의 마지막 순서(rownum) 번호
		// endRow = startRow + rowsPerPage - 1
		
		int pagesPerGroup = 5; // 한 화면에 나타날 페이지의 갯수
		int startPage = 0; // 화면에 처음 시작하는 페이지
		// (현재페이지-1)/한 화면의 페이지 갯수 * 한 화면의 페이지 갯수 + 1 
		int endPage = 0; // 화면에 나타나는 끝 페이지
		// 시작페이지+한 화면의 페이지 갯수 -1 : 마지막 페이지를 넘을 수 없다.
		
		
		// 전체 줄 수를 구해오는 메소드 호출
		totalRow = boardDao.totalRow();
		//System.out.println("BoardListService.service().totalRow:" + totalRow);
		// 전체 페이지 = ( 전체 줄수 -1 ) / 한페이지당 줄의 수 +1
		totalPage = (totalRow-1)/rowsPerPage + 1;
		// 현재 페이지의 첫번째 줄번호 = (현재페이지 - 1)* 한페이지당 글의 수 +1
		startRow = (page -1 )*rowsPerPage +1;
		// 현재 페이지의 마지막 줄번호 = 첫번째 줄번호+한페이지당 글수 -1
		endRow = startRow+rowsPerPage-1;
		
		
		
		// 시작페이지 = (현재페이지 -1)/한 화면 당 페이지 수 *한 화면당 페이지 수 +1
		startPage = ( page - 1 ) / pagesPerGroup * pagesPerGroup + 1;
		// 끝페이지 = 시작페이지 + 한화면당페이지수 - 1 : 마지막 페이지를 넘을 수 없다.
		endPage = startPage + pagesPerGroup - 1;
		if(endPage>totalPage) endPage = totalPage;
		
		JspData jspData = new JspData();
		jspData.setTotalPage(totalPage);
		jspData.setStartPage(startPage);
		jspData.setEndPage(endPage);
		jspData.setPage(page);
		jspData.setPagesPerGroup(pagesPerGroup);
		jspData.setStartRow(startRow);
		jspData.setEndRow(endRow);
		
		@SuppressWarnings("unchecked")
		List<Board> list = (List<Board>) boardDao.list(jspData);
		// jsp에 totalPage를 넘기기 위해서 JspDate를 생성 후 담는다.
		BoardModel boardModel = new BoardModel();
		// BoardModel은 List와 JspData를 다 가지고 있다. 
		boardModel.setList(list);
		boardModel.setJspData(jspData);
		return boardModel;
	}
	

}
