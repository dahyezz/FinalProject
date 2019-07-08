package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//서비스 객체
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() { }

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		
		logger.info(member.toString());
		
		String redirectUrl = null;
		if(memberService.loginCheck(member)) {
			
			member = memberService.getLoginMember(member);
			
			session.setAttribute("login", true);
			session.setAttribute("email", member.getEmail());
			session.setAttribute("nick", member.getNickname());
			
			logger.info(member.toString());
			
			if(member.getNickname().equals("admin")) {
				redirectUrl = "/admin/main";
			} else {
				redirectUrl = "/main";
			}
			
		} else {
			redirectUrl = "/member/login";
		}
		
		return "redirect:" + redirectUrl;
		
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
}
