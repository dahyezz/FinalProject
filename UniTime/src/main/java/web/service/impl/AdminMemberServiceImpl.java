package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminMemberDao;
import web.service.face.AdminMemberService;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired AdminMemberDao adminMemberdao;
	
	@Override
	public List memberSelectAll() {

		return adminMemberdao.memberSelectAll();
	}
	


}
