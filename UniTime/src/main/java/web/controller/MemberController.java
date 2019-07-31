package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.FreeBoard;
import web.dto.Member;
import web.dto.TastyBoard;
import web.dto.UsedBoard;
import web.service.face.FreeBoardService;
import web.service.face.MemberService;
import web.service.face.TastyBoardService;

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
			session.setAttribute("hakbun", member.getHakbun());
			
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
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() { }
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(Member member) throws Exception { 
		logger.info(member.toString());
		
		memberService.join(member);
		
		return "redirect:/member/joinEmail";
	}
	
	@RequestMapping(value = "/member/joinEmail", method = RequestMethod.GET)
	public void joinEmail() {
		
	}
	
	@RequestMapping(value = "/member/joinComplete", method = RequestMethod.GET)
	public void joinComplete() {
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST)
	public int postIdCheck(String hakbun) throws Exception {
		
		logger.info("post idCheck");
		logger.info(hakbun);
		
		Member idCheck =  memberService.idCheck(hakbun);
		
		 int result = 0;
		 
		 if(idCheck != null) {
		  result = 1;
		 } 
		 
		 return result;
		 
		}
	@ResponseBody
	@RequestMapping(value = "/member/nickCheck", method = RequestMethod.POST)
	public int postNickCheck(String nickname) throws Exception {
		
		logger.info("post nickCheck");
		logger.info(nickname);
		
		Member nickCheck =  memberService.nickCheck(nickname);
		
		 int result1 = 0;
		 
		 if(nickCheck != null) {
		  result1 = 1;
		 } 
		 
		 return result1;
		 
		}
	
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public void mypage(Model model, Member member, HttpSession session) {
		
		member.setNickname((String) session.getAttribute("nick"));
		
		List<TastyBoard> tastyList = memberService.tastyList(member);
		
		model.addAttribute("tastyList", tastyList);
		
		member.setNickname((String) session.getAttribute("nick"));
		
		List<FreeBoard> freeList = memberService.freeList(member);
		
		model.addAttribute("freeList", freeList);
		
		member.setNickname((String) session.getAttribute("nick"));
		
		List<UsedBoard> usedList = memberService.usedList(member);
		
		model.addAttribute("usedList", usedList);
	
	}
	
	@RequestMapping(value = "/member/mypage/delete1", method = RequestMethod.GET)
	public String tastyDelete(String names) {
		
		logger.info("삭제할 게시글 : " + names);
		memberService.tastyDelete(names);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value = "/member/mypage/delete2", method = RequestMethod.GET)
	public String freeDelete(String names) {
		
		logger.info("삭제할 게시글 : " + names);
		memberService.freeDelete(names);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value = "/member/mypage/delete3", method = RequestMethod.GET)
	public String usedDelete(String names) {
		
		logger.info("삭제할 게시글 : " + names);
		memberService.usedDelete(names);
		
		return "redirect:/member/mypage";
	}
	
	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.GET)
	public void memberDelete() throws Exception {
		
		logger.info("회원탈퇴페이지");

	}
	
	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.POST)
	public String memberDeleteProc(HttpSession session, Member member, RedirectAttributes rttr) throws Exception {
		
		logger.info("회원탈퇴");
		
		String email = (String)session.getAttribute("email");
		Member member1 = memberService.getinfo(email);
		String oldPass = member1.getPassword();
		 String newPass = member.getPassword();
		     
		 if(!(oldPass.equals(newPass))) {
		  rttr.addFlashAttribute("msg", false);
		  return "redirect:/member/memberDelete";
		 }
		 
		 memberService.memberDelete(member1);
		 
		 session.invalidate();
		
		return "redirect:/main";
		
	}
	
	@RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public void memberModify() throws Exception {
		logger.info("수정화면");
	}
	
	// 회원정보 수정 post
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String memberModifyProc(HttpSession session, Member member) throws Exception {
		
	 logger.info("modify 처리");
	 
	 memberService.memberModify(member);
	 
	 logger.info(member.toString());
	 
	 session.invalidate();
	 
	 return "redirect:/";
	}
	
	@RequestMapping(value = "/member/modifyNick", method = RequestMethod.GET)
	public void memberModifyNick() throws Exception {
		logger.info("수정화면");
	}
	
	// 회원정보 수정 post
	@RequestMapping(value = "/member/modifyNick", method = RequestMethod.POST)
	public String memberModifyNickProc(HttpSession session, Member member) throws Exception {
		
	 logger.info("modifyNick 처리");
	 
	 memberService.memberModifyNick(member);
	 
	 logger.info(member.toString());
	 
	 session.invalidate();
	 
	 return "redirect:/";
	}
	
//	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
//	public void memberGrades() throws Exception {
//		logger.info("grades");
//	}
}











