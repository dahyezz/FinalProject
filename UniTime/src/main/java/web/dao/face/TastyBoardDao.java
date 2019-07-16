package web.dao.face;

import java.util.List;

import web.dto.TastyBoard;
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
	 * filetable에 insert하기
	 * 
	 * @param tastyfile
	 */
	public void insertFile(TastyFile tastyfile);

	public TastyFile selectFileByFileno(int fileno);

}
