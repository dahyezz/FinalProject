package web.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.AdminService;
import web.util.Paging;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminService adminService;
	
	
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public void adminMain() { }
	
	
	// 여기부터 회원관리 페이지 
	
	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public void adminMember(Model model, HttpServletRequest req) {
		
		//요청파라미터에서 curPage 얻어오기
		Paging paging = adminService.getMemberCurPage(req);
		
		//MODEL로 Paging 객체 넣기
		model.addAttribute("paging", paging);
		
		List list = adminService.memberSelectAll(paging);
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/admin/memberDelete", method = RequestMethod.GET)
	public String adminMemberDelete(String[] email) {
		
		logger.info("삭제할 이메일:" + email);
		adminService.memberDelete(email);
		
		return "redirect:/admin/member";
	}
	
	@RequestMapping(value="/admin/memberPenalty", method = RequestMethod.GET)
	public String adminMemberPenalty(String[] email) {
		
		
		logger.info("경고 +1 :" + Arrays.toString(email));
		adminService.memberPenalty(email);
		
		adminService.moveBlackList();
		
		return "redirect:/admin/member";
	}
	
	// 여기부터 블랙리스트 관리 페이지
	
	@RequestMapping(value = "/admin/black", method = RequestMethod.GET)
	public void blackList(Model model, HttpServletRequest req) {
		
		//요청파라미터에서 curPage 얻어오기
		Paging paging = adminService.getBlackListCurPage(req);
		
		//MODEL로 Paging 객체 넣기
		model.addAttribute("paging", paging);
		
		List list = adminService.blackListSelectAll(paging);
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/admin/blackListDelete", method = RequestMethod.GET)
	public String adminBlackListDelete(String[] email) {
		
		logger.info("삭제할 학번:" + Arrays.deepToString(email));
		adminService.blackListDelete(email);
		
		return "redirect:/admin/black";
	}
	
	
	// 여기부터 신고리스트 관리 페이지
	
	@RequestMapping(value="/admin/badReport", method = RequestMethod.GET)
	public void adminBadreport(Model model, HttpServletRequest req) {
		
		//요청파라미터에서 curPage 얻어오기
		Paging paging = adminService.getBadReportCurPage(req);
		
		//MODEL로 Paging 객체 넣기
		model.addAttribute("paging", paging);
		
		List list = adminService.badReportSelectAll(paging);
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/admin/badReportDelete", method = RequestMethod.GET)
	public String adminBadReportDelete(int[] badno) {
		
//		logger.info("삭제할 게시글번호:" + badno);
		adminService.badReportDelete(badno);
		
		return "redirect:/admin/badReport";
	}
	
	@RequestMapping(value="/admin/badReportPenalty", method = RequestMethod.GET)
	public String adminBadReportPenalty(int[] badno) {
		
		adminService.badReportPenalty(badno);
		adminService.badReportDelete(badno);
		
		return "redirect:/admin/badReport";
	}
	
	
	// 여기부터 사이트 관리
	@RequestMapping(value="/admin/site", method = RequestMethod.GET)
	public void adminSite(Model model) {
		
		int member = adminService.memberCntAll();
		model.addAttribute("member", member);
		
		int blackList = adminService.blackListCntAll();
		model.addAttribute("blackList", blackList);
		
		int badReport = adminService.badReportCntAll();
		model.addAttribute("badReport", badReport);
		
	}
	
	

}


	
	