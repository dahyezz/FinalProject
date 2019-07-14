package web.service.face;

import java.util.List;

import web.dto.TastyBoard;
import web.util.Paging;

public interface TastyBoardService {

	/**
	 * 현재페이지와 총 게시글 수, listCount로 페이징 객체 만들기
	 * 
	 * @param curPage - 현재페이지
	 * @return Paging - 페이징 정보가 담긴 페이징 객체
	 */
	public Paging getcurPage(int curPage);

	/**
	 * 전체 게시글 목록 불러오기
	 * 
	 * @param paging - 페이징 객체
	 * @return List<TastyBoard> - 전체 글 리스트
	 */
	public List<TastyBoard> list(Paging paging);

	/**
	 * 게시글 조회하기
	 * 
	 * @param tastyBoard - 조회할 게시글의 게시글번호
	 * @return TastyBoard - 조회된 게시글 객체
	 */
	public TastyBoard getBoard(TastyBoard tastyBoard);

	/**
	 * 게시글 작성하기
	 * 
	 * @param tastyBoard - 작성할 게시글 객체
	 */
	public void write(TastyBoard tastyBoard);

	/**
	 * 게시글 삭제하기
	 * 
	 * @param tastyBoard - 삭제할 게시글 객체
	 */
	public void delete(TastyBoard tastyBoard);

	/**
	 * 게시글 수정하기
	 * 
	 * @param tastyBoard - 수정할 게시글 객체
	 */
	public void update(TastyBoard tastyBoard);

}
