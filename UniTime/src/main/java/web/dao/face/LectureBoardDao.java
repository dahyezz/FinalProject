package web.dao.face;

import java.util.List;

import web.dto.BadReport;
import web.dto.LectureBoard;
import web.dto.LectureComment;
import web.dto.TimeTable;
import web.util.Paging;

public interface LectureBoardDao {

	/**
	 *	게시글 리스트 조회
	 * @param paging - 조회 대상 페이징 객체
	 * @return 게시글을 조회한 결과
	 */
	public List selectAll(Paging paging);
	
	/**
	 * board 테이블 전체 COUNT 조회
	 * @param paging - 검색 결과 페이징 객체
	 * @return 테이블 전체 행 수 조회 결과
	 */
	public int selectCntAll(Paging paging);
	
	/**
	 * 	글 번호로 게시글 조회
	 * @param boardno - 게시글 번호
	 * @return 게시글 조회한 결과
	 */
	public LectureBoard selectBoardByBoardno(int boardno);
	
	/**
	 * 	강의코드로 시간표 조회
	 * @param department_code - 강의 코드
	 * @return TimeTable
	 */
	public TimeTable selectTimeTableBydepartmentcode(int department_code);
	
	/**
	 *	게시글 조회 수 증가
	 * @param boardno - 게시글 번호
	 */
	public void updateHit(int boardno);
	
	/**
	 * 	작성한 게시글 삽입
	 * @param LectureBoard
	 */
	public void insertBoard(LectureBoard lectureBoard);
	
	/**
	 * 	게시글 수정
	 * @param LectureBoard
	 */
	public void updateBoard(LectureBoard lectureBoard);
	
	/**
	 * 	게시글 삭제
	 * @param boardno
	 */
	public void deleteBoard(int boardno);
	
	/**
	 * 	게시글의 댓글 조회
	 * @param boardno - 게시글 번호
	 * @return List - 댓글 조회 리스트
	 */
	public List<LectureComment> selectCommentByBoardno(int boardno);
	
	/**
	 * 	게시글에 댓글 입력
	 * @param LectureComment
	 */
	public void insertComment(LectureComment lectureComment);
	
	/**
	 * 	게시글에 댓글 각각 삭제
	 * @param commentno - 댓글 번호
	 */
	public void deleteComment(int commentno);
	
	/**
	 * 	게시글 삭제를 위한 댓글 삭제
	 * @param boardno - 게시글 번호
	 */
	public void deleteCommentByBoardno(int boardno);
	
	/**
	 * 	같은 신고 count
	 * @param badReport
	 * @return int - 같은 신고 갯수
	 */
	public int selectCntLectureReport(BadReport badReport);
	
	/**
	 * 	자유게시판 신고
	 * @param badReport - 신고 테이블
	 */
	public void insertLectureReport(BadReport badReport);
}
