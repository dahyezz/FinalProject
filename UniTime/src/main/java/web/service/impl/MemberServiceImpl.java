package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.MailUtils;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDao memberDao;
	@Autowired private JavaMailSender mailSender;
	
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
	      
	      sendMail.setSubject("회원가입 이메일 인증");
	      sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
	            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
	            .append("<a href='http://localhost:8088/member/joinConfirm?auth_key='")
	            .append(">이메일 인증 확인</a>")
	            .toString());
	      sendMail.setFrom("gjflrhlanf1@naver.com", "hyunwoo");
	      sendMail.setTo(member.getEmail());
	      sendMail.send();
		
	}
}
