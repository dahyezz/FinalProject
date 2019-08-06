package web.service.impl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import web.dao.face.FreeBoardDao;
import web.dao.face.MemberDao;
import web.dao.face.TastyBoardDao;
import web.dao.face.UsedDao;
import web.dto.FreeBoard;
import web.dto.MailUtils;
import web.dto.Member;
import web.dto.TastyBoard;
import web.dto.UsedBoard;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDao memberDao;
	@Autowired private JavaMailSender mailSender;
	@Autowired TastyBoardDao tastyBoardDao;
	@Autowired FreeBoardDao freeBoardDao;
	@Autowired UsedDao usedDao;
	
	@Override
	public boolean loginCheck(Member member) {
		
		if(memberDao.selectCntLogin(member) > 0) {
			return true;
		}
		return false;
		
	}
	
	@Override
	public Member getLoginMember(Member member) {
		return memberDao.selectMemberByEmail(member);
	}

	@Override
	public void join(Member member) throws Exception {
		
		int hakbun = member.getHakbun();
		
		String str = Integer.toString(hakbun);
		
		str = str.substring(4, 7);
		
		int departmentCode = Integer.parseInt(str);
		
		member.setDepartmentCode(departmentCode);
		
		memberDao.insert(member);
		
	    // mail 작성 관련 
	    MailUtils sendMail = new MailUtils(mailSender);
	      
	
	    sendMail.setSubject("슬기로운 대학생활 회원가입 이메일 인증입니다.");
	    sendMail.setText(new StringBuffer().append("<h1>슬기로운 대학생활 이메일 인증입니다.</h1>")
	          .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
	          .append("<p>인증를 완료하시면 슬기로운 대학생활의 서비스를 이용하실 수 있습니다.</p>")
	          .append("<a href='http://192.168.30.169:8080/member/joinComplete'")
	          .append(">이메일 인증 확인</a>")
	          .toString());
	    sendMail.setFrom("gjflrhlanf1@gmail.com", "hyunwoo");
	    sendMail.setTo(member.getEmail());
	    sendMail.send();
		
	}

	@Override
	public Member idCheck(String hakbun) throws Exception {
		return memberDao.idCheck(hakbun);
	}
	@Override
	public Member nickCheck(String nickname) throws Exception {
		return memberDao.nickCheck(nickname);
	}

	@Override
	public List tastyList(Member member) {
		return memberDao.tastyList(member);
	}

	@Override
	public List freeList(Member member) {
		return memberDao.freeList(member);
	}
	
	@Override
	public List usedList(Member member) {
		return memberDao.usedList(member);
	}


	@Override
	public void tastyDelete(String names) {

		String[] nameList = names.split(",");
	      int deleteList[] = new int[nameList.length];
	      TastyBoard tastyBoard = new TastyBoard();
	      
	      for(int i=0; i<nameList.length; i++) {
	         deleteList[i] = Integer.parseInt(nameList[i]);
	         
	         tastyBoard.setBoardno(deleteList[i]);
	         
	         tastyBoardDao.deleteCommentByBoardno(tastyBoard);
	         tastyBoardDao.deleteFileByboardno(tastyBoard);
	         tastyBoardDao.deleteBoardByBoardno(tastyBoard);
	      }
	}
	
	@Override
	public void freeDelete(String names) {

		String[] nameList = names.split(",");
	      int deleteList[] = new int[nameList.length];
	      FreeBoard freeBoard = new FreeBoard();
	      
	      for(int i=0; i<nameList.length; i++) {
	         deleteList[i] = Integer.parseInt(nameList[i]);
	         
	         freeBoard.setBoardno(deleteList[i]);
	         
	 		//게시글의 파일첨부 삭제
	 		freeBoardDao.deleteFileByBoardno(deleteList[i]);
	 		
	 		//게시글의 댓글 삭제
	 		freeBoardDao.deleteCommentByBoardno(deleteList[i]);
	 		
	 		//게시글 삭제		
	 		freeBoardDao.deleteBoard(deleteList[i]);
	      }
	}

	@Override
	public void usedDelete(String names) {

		String[] nameList = names.split(",");
	      int deleteList[] = new int[nameList.length];
	      UsedBoard usedBoard = new UsedBoard();
	      
	      for(int i=0; i<nameList.length; i++) {
	         deleteList[i] = Integer.parseInt(nameList[i]);
	         
	         usedBoard.setBoardno(deleteList[i]);
	         
		    // DB에서 이미지 삭제 
		    usedDao.deleteImgByBoardno(deleteList[i]);
			
			// 게시글 삭제
			usedDao.deleteBoardByBoardno(deleteList[i]);
	         
	      }
	}

	@Override
	public void memberDelete(Member member) throws Exception {
		
		memberDao.memberDelete(member);
		
	}

	@Override
	public Member getinfo(String email) {
		
		Member member = new Member();
		member.setEmail(email);
		return memberDao.selectMemberByEmail(member);
	}
	
	@Override
	public void memberModify(Member member) throws Exception {
		memberDao.memberModify(member);
	}
	
	@Override
	public void memberModifyNick(Member member) throws Exception {
		/*
		 * memberDao.memberModifyNick(member); memberDao.tastyUpdateNick(member);
		 * memberDao.freeUpdateNick(member); memberDao.usedUpdateNick(member);
		 * memberDao.lectureUpdateNick(member);
		 */
	}
	
	@Override
	public void memberGrades(Member member)  {
		memberDao.memberGrades(member);
	}

	@Override
	public List myList(String id) {
		return memberDao.selectMyList(id);
	}

	@Override
	public boolean pwFind(Member member) {
		if(memberDao.selectCntMemberPwFind(member) >= 1)
			return true;
		else
			return false;
	}

	@Override
	public Member getPwfind(Member member) throws Exception {
		
	    // mail 작성 관련 
	    MailUtils sendMail = new MailUtils(mailSender);
	      
	    member =  memberDao.selectMemberPwfind(member);
	    
	    sendMail.setSubject("슬기로운 대학생활 비밀번호 찾기 이메일 인증입니다.");
	    sendMail.setText(new StringBuffer().append("<h1>슬기로운 대학생활 비밀번호 찾기 이메일 인증입니다.</h1>")
		      .append(member.getNickname()+" 님의 ")
	          .append("비밀번호는 "+member.getPassword()+" 입니다</p>")
	          .append("<p>비밀번호를 변경해주세요</p>")
	          .toString());
	    sendMail.setFrom("gjflrhlanf1@gmail.com", "hyunwoo");
	    sendMail.setTo(member.getEmail());
	    sendMail.send();
		
		return memberDao.selectMemberPwfind(member);
	}
	
}



