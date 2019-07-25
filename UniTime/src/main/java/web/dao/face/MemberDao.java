package web.dao.face;

import java.util.HashMap;
import java.util.List;

import web.dto.Member;
import web.dto.TastyBoard;

public interface MemberDao {

	/**
	 * 로그인 체크 
	 * 
	 * @param member - 로그인 시도하려는 회원 객체
	 * @return int - Count(*)
	 */
	public int selectCntLogin(Member member);

	/**
	 * Email로 회원 정보 조회
	 * 
	 * @param member - 조회하려는 회원의 이메일이 담긴 객체
	 * @return Member - 조회하려는 회원의 모든 정보
	 */
	public Member selectMemberByEmail(Member member);

	public void insert(Member member);

	public Member idCheck(String hakbun) throws Exception;
	public Member nickCheck(String nickname) throws Exception;

	public List tastyList(Member member);
	public List freeList(Member member);
	public List usedList(Member member);
	
	/**
	 * 
	 * @param number 삭제할 회원의 글
	 */
	public void tastyDelete(HashMap map);
	public void freeDelete(HashMap map);
	public void usedDelete(HashMap map);

	/*
	 * 회원탈퇴
	 */
	public void memberDelete(Member member) throws Exception;
	
	/*
	 * 회원 수정
	 */
	public void memberModify(Member member) throws Exception;
}





