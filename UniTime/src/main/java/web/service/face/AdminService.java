package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.util.Paging;

public interface AdminService {
	
	// 여기부터 회원관리 페이지
	
	/**
	 * 
	 * @return 모든 회원 정보 조회 
	 */
	public List memberSelectAll(Paging paging);
	
	/**
	 * 요청파라미터에서 curPage를 파싱한다
	 * 
	 * @param 
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getMemberCurPage(HttpServletRequest req);
	
	/**
	 * 
	 * @param hakbun 삭제할 회원의 학번
	 */
	public void memberDelete(String[] email);
	
	/**
	 * 
	 * @param hakbun 경고횟수 +1 할 회원의 학번
	 */
	public void memberPenalty(String[] email);
	
	/**
	 * 
	 * 경고횟수 3회이상인 회원 블랙리스트 추가 
	 */
	public void moveBlackList();
	
	
	// 여기부터 블랙리스트 관리 페이지
	
	/**
	 * 
	 * @return 모든 회원 정보 조회 
	 */
	public List blackListSelectAll(Paging paging);
	
	/**
	 * 요청파라미터에서 curPage를 파싱한다
	 * 
	 * @param 
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getBlackListCurPage(HttpServletRequest req);
	
	/**
	 * 
	 */
	public void blackListDelete(String[] email);
	
	
	// 여기부터 신고리스트 관리 페이지
	
	/**
	 * 
	 * @return 모든 회원 정보 조회 
	 */
	public List badReportSelectAll(Paging paging);
	
	/**
	 * 요청파라미터에서 curPage를 파싱한다
	 * 
	 * @param 
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getBadReportCurPage(HttpServletRequest req);
	
	/**
	 * 
	 * @param badno 삭제할 게시판의 번호
	 */
	public void badReportDelete(int[] badno);
	
	/**
	 * 
	 * @param badno 경고부여 할 닉네임이 있는 게시판의 번호
	 */
	public void badReportPenalty(int[] badno);
	
	
	// 여기부터 사이트 관리 페이지
	public int memberCntAll();
	
	public int blackListCntAll();
	
	public int badReportCntAll();
	
	public void visitInsert(HttpServletRequest req);
	
	
	

}
