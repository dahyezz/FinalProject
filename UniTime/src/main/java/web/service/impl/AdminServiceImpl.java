package web.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.service.face.AdminService;
import web.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired AdminDao adminDao;
	
	// 여기부터 회원관리 페이지
	
	@Override
	public List memberSelectAll(Paging paging) {

		return adminDao.memberSelectAll(paging);
	}
	
	@Override
	public Paging getMemberCurPage(HttpServletRequest req) {

		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		String search = req.getParameter("search");
		
		if(search != null && search != "") {
		// 전체 게시글 수
			int totalCount = adminDao.selectMemberSearchCntAll(search);
			
			Paging paging = new Paging(totalCount, curPage);
			paging.setSearch(search);

			return paging;
		} else {
			int totalCount = adminDao.selectMemberCntAll();
			
			Paging paging = new Paging(totalCount, curPage);
			
			return paging;
		}
		// 페이징 객체 생성
	}
	
	@Override
	public void memberDelete(String[] email) {
		
		HashMap map = new HashMap();
		map.put("email", email);
		
		adminDao.memberDelete(map);
	}
	
	@Override
	public void memberPenalty(String[] email) {

		HashMap map = new HashMap();
		map.put("email", email);
		
		adminDao.memberUpdate(map);
	}
	
	@Override
	public void moveBlackList() {
		
		adminDao.moveBlackList();
		adminDao.deletePenalty();
	}
	 
	
	//여기부터 블랙리스트 관리 페이지
	
	@Override
	public List blackListSelectAll(Paging paging) {

		return adminDao.blackListSelectAll(paging);
	}
	
	@Override
	public Paging getBlackListCurPage(HttpServletRequest req) {

		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		String search = req.getParameter("search");
		
		if(search != null && search != "") {
		// 전체 게시글 수
			int totalCount = adminDao.selectBlackListSearchCntAll(search);
			
			Paging paging = new Paging(totalCount, curPage);
			paging.setSearch(search);

			return paging;
		} else {
			int totalCount = adminDao.selectBlackListCntAll();
			
			Paging paging = new Paging(totalCount, curPage);
			
			return paging;
		}
		// 페이징 객체 생성
	}
	
	@Override
	public void blackListDelete(String[] email) {
		
		HashMap map = new HashMap();
		map.put("email", email);
		
		adminDao.blackListDelete(map);
	}
	
	
	// 여기부터 신고리스트 관리 페이지
	@Override
	public List badReportSelectAll(Paging paging) {

		return adminDao.badReportSelectAll(paging);
	}
	
	@Override
	public Paging getBadReportCurPage(HttpServletRequest req) {

		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		String search = req.getParameter("search");
		
		if(search != null && search != "") {
		// 전체 게시글 수
			int totalCount = adminDao.selectBadReportSearchCntAll(search);
			
			Paging paging = new Paging(totalCount, curPage);
			paging.setSearch(search);

			return paging;
		} else {
			int totalCount = adminDao.selectBadReportCntAll();
			
			Paging paging = new Paging(totalCount, curPage);
			
			return paging;
		}
		// 페이징 객체 생성
	}
	
	@Override
	public void badReportDelete(int[] badno) {

		HashMap map = new HashMap();
		map.put("badno", badno);
		
		adminDao.badReportDelete(map);
	}
	


}
