package web.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.FreeBoard;
import web.dto.LectureBoard;
import web.dto.Member;
import web.dto.TastyBoard;
import web.dto.UsedBoard;
import web.util.Paging;

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
	
	public List<TastyBoard> tastyList(Paging tastyPaging);
	public List<FreeBoard> freeList(Paging paging);
	public List<UsedBoard> usedList(Paging paging);
	public List<LectureBoard> lectureList(Paging paging);
	
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

	public List myList(String id);

	public boolean pwFind(Member member);

	public Member getPwfind(Member member) throws Exception;


	public Paging getTastycurPage(Map<String, Object> map);

	public Paging getFreecurPage(Map<String, Object> map);

	public Paging getLecturecurPage(Map<String, Object> map);

	public Paging getUsedcurPage(Map<String, Object> map);

}
