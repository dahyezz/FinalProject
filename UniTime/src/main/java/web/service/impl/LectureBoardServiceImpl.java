package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.LectureBoardDao;
import web.dto.BadReport;
import web.dto.LectureBoard;
import web.dto.LectureComment;
import web.dto.TimeTable;
import web.service.face.LectureBoardService;
import web.util.Paging;

@Service
public class LectureBoardServiceImpl implements LectureBoardService{

	@Autowired LectureBoardDao lectureBoardDao;

	@Override
	public List list(Paging paging) {
		
		return lectureBoardDao.selectAll(paging);
	}
	
	@Override
	public Paging getCurPage(HttpServletRequest req) {
		
		//전달 파라미터 curPage 파싱
		String param=req.getParameter("curPage");
		int curPage=0;
		if(param!=null && !"".equals(param)) {
			curPage=Integer.parseInt(param);
		}
		
		int listCount=9;
		
		//검색 파라미터 파싱
		String searchType=req.getParameter("searchType");
		String keyword=req.getParameter("keyword");
		
		//페이징 객체 생성
		Paging paging = new Paging();
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		
		//전체/검색된 게시글 수
		int totalCount=lectureBoardDao.selectCntAll(paging);
		
		//새로운 메소드의 페이징 객체 생성
		paging=new Paging(totalCount,curPage,listCount);
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		
		return paging;
	}

	@Override
	public LectureBoard view(int boardno) {
		
		lectureBoardDao.updateHit(boardno);
		
		return lectureBoardDao.selectBoardByBoardno(boardno);
	}
	
	@Override
	public TimeTable getTimeTable(int department_code) {

		return lectureBoardDao.selectTimeTableBydepartmentcode(department_code);
	}
	
	@Override
	public void write(LectureBoard lectureBoard) {

		lectureBoardDao.insertBoard(lectureBoard);

	}

	@Override
	public void update(LectureBoard lectureBoard) {
		
		//게시글 수정
		lectureBoardDao.updateBoard(lectureBoard);
	}
	
	@Override
	public void delete(int boardno) {
		
		//게시글의 댓글 삭제
		lectureBoardDao.deleteCommentByBoardno(boardno);
		
		//게시글 삭제		
		lectureBoardDao.deleteBoard(boardno);
	}
	
	@Override
	public List<LectureComment> commentList(int boardno) {
		return lectureBoardDao.selectCommentByBoardno(boardno);
	}

	@Override
	public void commentWrite(LectureComment lectureComment) {
		
		lectureBoardDao.insertComment(lectureComment);		
	}

	@Override
	public void commentDelete(int commentno) {
		
		lectureBoardDao.deleteComment(commentno);		
	}

	@Override
	public boolean report(BadReport badReport) {
		
		//같은 신고가 들어올 때
		if(lectureBoardDao.selectCntLectureReport(badReport)>0) {
			return false;	//기존에 있는 신고이면 false
		} else {
			lectureBoardDao.insertLectureReport(badReport);
			
			return true;
		}
	}

	@Override
	public List<TimeTable> getTimeTable() {
		return lectureBoardDao.selectTimeTable();
	}
}
