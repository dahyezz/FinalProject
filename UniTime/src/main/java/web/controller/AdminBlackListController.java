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

import web.service.face.AdminBlackListService;
import web.util.Paging;

@Controller
public class AdminBlackListController {
	
	@Autowired AdminBlackListService adminBlackListService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/admin/black", method = RequestMethod.GET)
	public void blackList(Model model, HttpServletRequest req) {
		
		//요청파라미터에서 curPage 얻어오기
		Paging paging = adminBlackListService.getCurPage(req);
		
		//MODEL로 Paging 객체 넣기
		model.addAttribute("paging", paging);
		
		List list = adminBlackListService.blackListSelectAll(paging);
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/admin/blackListDelete", method = RequestMethod.GET)
	public String adminMemberDelete(String[] email) {
		
		logger.info("삭제할 학번:" + Arrays.deepToString(email));
		adminBlackListService.blackListDelete(email);
		
		return "redirect:/admin/black";
	}
	

}
