package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.util.Paging;

public interface AdminMemberDao {
	
	/**
	 * 
	 * @return 멤버테이블 전체조회 리스트
	 */
	public List memberSelectAll(Paging paging);
	
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
	 * @param hakbun 삭제할 회원의 학번
	 */
	public void memberDelete(HashMap email);
	
	/**
	 * 
	 * @param hakbun 경고횟수 +1 할 회원의 학번
	 */
	public void memberUpdate(HashMap email);

}
