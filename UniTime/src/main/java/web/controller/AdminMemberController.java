package web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.AdminMemberService;

@Controller
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired AdminMemberService adminMemberService;
	
	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public void adminMember(Model model) {
		
		List list = adminMemberService.memberSelectAll();
		
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/admin/memberDelete", method = RequestMethod.GET)
	public String adminMemberDelete(String[] email) {
		
		logger.info("삭제할 학번:" + email);
		adminMemberService.memberDelete(email);
		
		return "redirect:/admin/member";
	}
	
	@RequestMapping(value="/admin/memberPenalty", method = RequestMethod.GET)
	public String adminMemberPenalty(String[] email) {
		
		
		logger.info("경고 +1 :" + Arrays.toString(email));
		adminMemberService.memberPenalty(email);
		
		return "redirect:/admin/member";
	}

	
	
	
	
	
}
