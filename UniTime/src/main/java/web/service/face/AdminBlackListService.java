package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.util.Paging;

public interface AdminBlackListService {
	
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
	public Paging getCurPage(HttpServletRequest req);
	
	/**
	 * 
	 */
	public void blackListDelete(String[] email);

}
