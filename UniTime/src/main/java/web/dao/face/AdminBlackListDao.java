package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.util.Paging;

public interface AdminBlackListDao {
	
	/**
	 * 
	 * @return 멤버테이블 전체조회 리스트
	 */
	public List blackListSelectAll(Paging paging);
	
	/**
	 * 
	 * @return 전체 게시글 수
	 */
	public int selectCntAll();
	
	/**
	 * 
	 * @param 검색어
	 * @return 검색된 전체 게시글 수
	 */
	public int selectSearchCntAll(String select);
	
	/**
	 * 
	 * @param 삭제할 블랙리스트 해당email
	 */
	public void blackListDelete(HashMap email);

}
