package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.util.Paging;

public interface AdminDao {
	
	//여기부터 회원관리 페이지
	
	/**
	 * 
	 * @return 멤버테이블 전체조회 리스트
	 */
	public List memberSelectAll(Paging paging);
	
	/**
	 * 
	 * @return 전체 게시글 수
	 */
	public int selectMemberCntAll();
	
	/**
	 * 
	 * @param 검색어
	 * @return 검색된 전체 게시글 수
	 */
	public int selectMemberSearchCntAll(String select);
	
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
	
	/**
	 * 경고횟수 3회이상인 회원 블랙리스트 추가 
	 */
	public void moveBlackList();
	
	/**
	 * 경고횟수 3회이상인 회원 탈퇴
	 */
	public void deletePenalty();
	
	
	// 여기부터 블랙리스트 관리 페이지
	
	/**
	 * 
	 * @return 멤버테이블 전체조회 리스트
	 */
	public List blackListSelectAll(Paging paging);
	
	/**
	 * 
	 * @return 전체 게시글 수
	 */
	public int selectBlackListCntAll();
	
	/**
	 * 
	 * @param 검색어
	 * @return 검색된 전체 게시글 수
	 */
	public int selectBlackListSearchCntAll(String select);
	
	/**
	 * 
	 * @param 삭제할 블랙리스트 해당email
	 */
	public void blackListDelete(HashMap email);
	
	
	//여기부터 회원관리 페이지
	
	/**
	 * 
	 * @return 멤버테이블 전체조회 리스트
	 */
	public List badReportSelectAll(Paging paging);
	
	/**
	 * 
	 * @return 전체 게시글 수
	 */
	public int selectBadReportCntAll();
	
	/**
	 * 
	 * @param 검색어
	 * @return 검색된 전체 게시글 수
	 */
	public int selectBadReportSearchCntAll(String select);
	
	/**
	 * 
	 * @param hakbun - 삭제할 회원의 학번
	 */
	public void badReportDelete(HashMap badno);
	
	public void badReportPenalty(HashMap badno);
	

	// 여기부터 사이트관리 페이지
	public void visitInsert();
	
	public int visitCntAll();
	
	public int visitCnt();
	
	
	
	

}
