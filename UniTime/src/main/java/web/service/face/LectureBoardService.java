package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.BadReport;
import web.dto.LectureBoard;
import web.dto.LectureComment;
import web.dto.TimeTable;
import web.util.Paging;

public interface LectureBoardService {

	/**
	 * 	게시글 리스트 조회
	 * @param paging - 조회 대상 페이징 객체
	 * @return List - 게시글을 조회한 결과
	 */
	public List list(Paging paging);
	
	/**
	 * 	요청파라미터에서 curPage를 파싱한다
	 * @param req - 요청 정보 객체
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getCurPage(HttpServletRequest req);
	
	/**
	 * 	조회수 증가, 게시글 조회
	 * @param boardno - 게시글 번호
	 * @return LectureBoard - 게시글 조회한 결과
	 */
	public LectureBoard view(int boardno);
	
	/**
	 * 	강의코드로 시간표 정보 가져오기
	 * @param department_code - 강의코드
	 * @return TimeTable
	 */
	public TimeTable getTimeTable(int department_code);

	/**
	 * 	게시글 작성
	 * @param LectureBoard - 게시글
	 */
	public void write(LectureBoard lectureBoard);
	
	/**
	 * 	게시글 수정
	 * @param LectureBoard
	 */
	public void update(LectureBoard lectureBoard);
	
	/**
	 * 	게시글, 댓글 삭제
	 * @param boardno - 게시글 번호
	 */
	public void delete(int boardno);
	
	/**
	 *	댓글 리스트 조회
	 * @param boardno - 게시글 번호
	 * @return List - 댓글 조회 결과
	 */
	public List<LectureComment> commentList(int boardno);
	
	/**
	 * 	댓글 입력
	 * @param LectureComment - 게시글 댓글
	 */
	public void commentWrite(LectureComment lectureCommment);
	
	/**
	 * 	댓글 삭제
	 * @param commentno - 게시글의 댓글 번호
	 */
	public void commentDelete(int commentno);
	
	/**
	 * 	게시글 신고
	 * @param badReport
	 * @return boolean - 신고 가능 true/false
	 */
	public boolean report(BadReport badReport);
	
	/**
	 * 	강의 시간표 리스트 가져오기
	 * @return List
	 */
	public List<TimeTable> getTimeTable();
}
