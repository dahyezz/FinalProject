package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDao memberDao;

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
}
