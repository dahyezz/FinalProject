package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Member;
import web.dto.TastyBoard;

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
	public Member nickCheck(String nickname) throws Exception;
	
	public List tastyList(Member member);
	public List freeList(Member member);
	public List usedList(Member member);

	public void tastyDelete(String names);
	public void freeDelete(String names);
	public void usedDelete(String names);

	//회원 탈퇴
	public void memberDelete(Member member) throws Exception;

	public Member getinfo(String email);
	
	//비밀번호 수정
	public void memberModify(Member member) throws Exception;
	
	//닉네임 수정
	public void memberModifyNick(Member member) throws Exception;
	
	public void memberGrades(Member member);
	
	//시간표 불러오기
	public List list();
	
	//로그인한 이메일에 맞는 시간표 불러오기
	public List myList(String id);

}
