package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminMemberDao;
import web.service.face.AdminMemberService;
import web.util.Paging;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired AdminMemberDao adminMemberDao;
	
	@Override
	public List memberSelectAll(Paging paging) {

		return adminMemberDao.memberSelectAll(paging);
	}
	
	@Override
	public Paging getCurPage(HttpServletRequest req) {

		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		String search = req.getParameter("search");
		
		if(search != null && search != "") {
		// 전체 게시글 수
			int totalCount = adminMemberDao.selectSearchCntAll(search);
			
			Paging paging = new Paging(totalCount, curPage);
			paging.setSearch(search);

			return paging;
		} else {
			int totalCount = adminMemberDao.selectCntAll();
			
			Paging paging = new Paging(totalCount, curPage);
			
			return paging;
		}
		// 페이징 객체 생성
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
