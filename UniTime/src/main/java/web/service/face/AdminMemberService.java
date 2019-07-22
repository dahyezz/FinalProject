package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.util.Paging;

public interface AdminMemberService {
	
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
	public Paging getCurPage(HttpServletRequest req);
	
	/**
	 * 
	 * @param hakbun 삭제할 회원의 학번
	 */
	public void memberDelete(String[] email);
	
	/**
	 * 
	 * @param hakbun 경고횟수 +1 학 회원의 학번
	 */
	public void memberPenalty(String[] email);

}
