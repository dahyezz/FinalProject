package web.dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.springframework.transaction.annotation.Transactional;

import web.dto.FreeBoard;
import web.dto.LectureBoard;
import web.dto.Member;
import web.dto.TastyBoard;
import web.dto.UsedBoard;
import web.util.Paging;

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
	
	public Member selectMemberByHakbun(Member member);

	public void insert(Member member);

	public Member idCheck(String hakbun) throws Exception;
	public Member nickCheck(String nickname) throws Exception;
	public Member emailCheck(String email) throws Exception;

	public List<TastyBoard> tastyList(Paging paging);
	public List<FreeBoard> freeList(Member member);
	public List<UsedBoard> usedList(Member member);
	public List<LectureBoard> lectureList(Member member);
	
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
	 * 회원 비밀번호 수정
	 */
	public void memberModify(Member member) throws Exception;
	
	/*
	 * 회원 닉네임 수정
	 */
	public void memberModifyNick(Member member) throws Exception;
	
	
	 public void tastyUpdateNick(Map<String, Object> parameters);
	 public void freeUpdateNick(Map<String, Object> parameters);
	 public void usedUpdateNick(Map<String, Object> parameters);
	 public void lectureUpdateNick(Map<String, Object> parameters);
	 
	
	public void memberGrades(Member member);
	
	
	//로그인한 이메일과 같은
	public List selectMyList(String id);
	
		// 비밀번호 찾기
		public String find_pw(String email) throws Exception;

		public int selectCntMemberPwFind(Member member);

		public Member selectMemberPwfind(Member member);

}





