package web.service.face;

import java.util.List;

public interface AdminMemberService {
	
	/**
	 * 
	 * @return 모든 회원 정보 조회 
	 */
	public List memberSelectAll();
	
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
