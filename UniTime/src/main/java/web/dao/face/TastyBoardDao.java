package web.dao.face;

import java.util.List;

import web.dto.BadReport;
import web.dto.TastyBoard;
import web.dto.TastyComment;
import web.dto.TastyFile;
import web.util.Paging;

public interface TastyBoardDao {

	/**
	 * 총 게시글 수 가져오기
	 * 
	 * @return int - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 전체 게시글 불러오기
	 * 
	 * @param paging - 페이징 객체
	 * @return List<TastyBoard> - 전체 조회 결과
	 */
	public List<TastyBoard> selectAll(Paging paging);

	/**
	 * 게시글 조회
	 * 
	 * @param tastyBoard - 조회할 게시글의 게시글 번호
	 * @return TastyBoard - 조회된 게시글 정보
	 */
	public TastyBoard selectBoardByBoardno(TastyBoard tastyBoard);

	/**
	 * 게시글 삽입
	 * 
	 * @param tastyBoard
	 */
	public void insertBoard(TastyBoard tastyBoard);

	/**
	 * 게시글 삭제
	 * 
	 * @param tastyBoard
	 */
	public void deleteBoardByBoardno(TastyBoard tastyBoard);

	/**
	 * 겟글 수정
	 * 
	 * @param tastyBoard
	 */
	public void updateBoard(TastyBoard tastyBoard);

	/**
	 * 조회수 증가시키기
	 * 
	 * @param tastyBoard
	 */
	public void updateHit(TastyBoard tastyBoard);

	/**
	 * tastyboard 테이블 next sequence 값 가져오기
	 * 
	 * @return
	 */
	public int selectBoardno();

	/**
	 * (수정) temptasty에 insert 하기
	 * filetable에 insert하기
	 * 
	 * 
	 * @param tastyfile
	 */
	public void insertFile(TastyFile tastyfile);

	public TastyFile selectFileByFileno(int fileno);

	/**
	 * 게시글에 대한 전체 댓글 리스트 불러오기
	 * 
	 * @param tastyBoard
	 * @return
	 */
	public List<TastyComment> selectAllCommentByBoardno(TastyBoard tastyBoard);

	/**
	 * 댓글 삽입하기
	 * 
	 * @param tastyComment
	 */
	public void insertComment(TastyComment tastyComment);

	/**
	 * 댓글 삭제
	 * 
	 * @param tastyComment
	 */
	public void deleteComment(TastyComment tastyComment);

	public TastyComment selectBoardnoByCommentno(TastyComment tastyComment);

	/**
	 * 게시글 삭제 시 해당 댓글도 전부 삭제
	 * 
	 * @param tastyBoard - 삭제하려는 게시글 번호
	 */
	public void deleteCommentByBoardno(TastyBoard tastyBoard);

	/**
	 * 게시글 삭제 시 첨부된 파일도 삭제
	 * 
	 * @param tastyBoard - 삭제하려는 게시글 번호
	 */
	public void deleteFileByboardno(TastyBoard tastyBoard);

	public void updateComment(TastyComment tastyComment);

	public void insertBadByBoard(BadReport badReport);

	public List<TastyFile> selectFileByBoardno(TastyBoard tastyBoard);

	/**
	 * tastyfile에 데이터 삽입 후 temptasty delete
	 * 
	 * @param file
	 */
	public void deleteTemp(TastyFile file);

	/**
	 * tastyfile에 데이터 삽입
	 * 
	 * @param file
	 */
	public void insertTastyfile(TastyFile file);

	public int selectCntFile(TastyBoard tastyBoard);




}
