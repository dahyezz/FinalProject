package web.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminMemberDao;
import web.service.face.AdminMemberService;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired AdminMemberDao adminMemberDao;
	
	@Override
	public List memberSelectAll() {

		return adminMemberDao.memberSelectAll();
	}
	
	@Override
	public void memberDelete(String[] email) {
		
		HashMap map = new HashMap();
		map.put("email", email);
		
		adminMemberDao.memberDelete(map);
	}
	
	@Override
	public void memberPenalty(String[] email) {

		HashMap map = new HashMap();
		map.put("email", email);
		
		adminMemberDao.memberUpdate(map);
	}


}
