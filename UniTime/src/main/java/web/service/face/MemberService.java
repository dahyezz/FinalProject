package web.service.face;

import web.dto.Member;

public interface MemberService {

	/**
	 * 로그인 성공/실패 체크
	 * 
	 * @param member - 로그인 시도하려는 회원 객체
	 * @return boolean - 성공/실패 유무
	 */
	public boolean loginCheck(Member member);

	/**
	 * 로그인 성공한 회원의 회원정보 가져오기
	 * 
	 * @param member - 로그인 성공한 회원 (email, pw)
	 * @return Member- 로그인 성공한 회원의 모든 정보
	 */
	public Member getLoginMember(Member member);

	/**
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Member member)throws Exception;
	
	public Member idCheck(String hakbun) throws Exception;

}
