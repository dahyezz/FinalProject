package web.dao.face;

import java.util.List;

import web.dto.BadReport;
import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.FreeFile;
import web.dto.FreeComment;
import web.util.Paging;

public interface FreeBoardDao {

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
	public FreeBoard selectBoardByBoardno(int boardno);
	
	/**
	 *	게시글 조회 수 증가
	 * @param boardno - 게시글 번호
	 */
	public void updateHit(int boardno);
	
	/**
	 * 	삽입할 게시글의 시퀀스 번호 조회
	 * @return int - 게시글 번호 조회
	 */
	public int selectBoardno();
	
	/**
	 * 	작성한 게시글 삽입
	 * @param Freeboard
	 */
	public void insertBoard(FreeBoard freeBoard);
	
	/**
	 * 	게시글 수정
	 * @param Freeboard
	 */
	public void updateBoard(FreeBoard freeBoard);
	
	/**
	 * 	게시글 삭제
	 * @param boardno
	 */
	public void deleteBoard(int boardno);
	
	/**
	 * 	파일 삽입
	 * @param FreeFile
	 */
	public void insertFile(FreeFile freeFile);
	
	/**
	 * 	게시글의 파일 조회
	 * @param boardno - 게시글 번호
	 * @return FreeFile - 조회된 파일 정보
	 */
	public FreeFile selectFileByBoardno(int boardno);
	
	/**
	 * 	파일 번호를 이용하여 파일정보를 조회
	 * @param fileno - 조회할 파일 번호
	 * @return FreeFile - 조회된 파일 정보 객체
	 */
	public FreeFile selectFileByFileno(int fileno); 
	
	/**
	 * 	파일 번호를 이용하여 게시물의 파일 삭제
	 * @param boardno
	 */
	public void deleteFileByBoardno(int boardno);

	/**
	 * 	게시글의 댓글 조회
	 * @param boardno - 게시글 번호
	 * @return List - 댓글 조회 리스트
	 */
	public List<FreeComment> selectCommentByBoardno(int boardno);
	
	/**
	 * 	게시글에 댓글 입력
	 * @param FreeComment
	 */
	public void insertComment(FreeComment freeComment);
	
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
	 *	공지 게시글 리스트 조회
	 * @return 공지 게시글을 조회한 결과
	 */
	public List selectNoticeAll();
	
	/**
	 * 	글 번호로 공지 게시글 조회
	 * @param boardno - 게시글 번호
	 * @return 게시글 조회한 결과
	 */
	public FreeBoardNotice selectNoticeByBoardno(int boardno);
	
	/**
	 *	공지 게시글 조회 수 증가
	 * @param boardno - 게시글 번호
	 */
	public void updateNoticeHit(int boardno);
	
	/**
	 * 	작성한 공지 게시글 삽입
	 * @param FreeboardNotice
	 */
	public void insertNoticeBoard(FreeBoardNotice freeBoardNotice);
	
	/**
	 * 	공지 게시글 수정
	 * @param FreeboardNotice
	 */
	public void updateNoticeBoard(FreeBoardNotice freeBoardNotice);
	
	/**
	 * 	공지 게시글 삭제
	 * @param boardno
	 */
	public void deleteNoticeBoard(int boardno);
	
	/**
	 * 	같은 신고 count
	 * @param badReport
	 * @return int - 같은 신고 갯수
	 */
	public int selectCntFreeReport(BadReport badReport);
	
	/**
	 * 	자유게시판 신고
	 * @param badReport - 신고 테이블
	 */
	public void insertFreeReport(BadReport badReport);
}
