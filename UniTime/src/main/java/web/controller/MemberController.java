package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.FreeBoard;
import web.dto.LectureBoard;
import web.dto.Member;
import web.dto.TastyBoard;
import web.dto.UsedBoard;
import web.service.face.FreeBoardService;
import web.service.face.MemberService;
import web.util.Paging;

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
				redirectUrl = "/kg_main";
			}
			
		} else {
			redirectUrl = "/main";
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
	
	@ResponseBody
	@RequestMapping(value = "/member/emailCheck", method = RequestMethod.POST)
	public int postEmailCheck(String email) {
		logger.info("post emailCheck");
		logger.info(email);
		
		Member emailCheck;

		 int result2 = 0;
		try {
			emailCheck = memberService.emailCheck(email);
			
			 
			 if(emailCheck != null) {
			  result2 = 1;
			 } 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		 return result2;
		 
		}
	
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public void mypage(Model model, Member member, HttpSession session,
			@RequestParam(defaultValue = "1") int curPage, Map<String, Object> map
			) {

		String id= (String) session.getAttribute("email");
		List mylist = memberService.myList(id);
		
		model.addAttribute("myList", mylist);
	}
	
	@RequestMapping(value="/member/tastyList", method=RequestMethod.GET)
	public ModelAndView tastyList(ModelAndView mav, Member member, HttpSession session,
			Paging paging, Map<String, Object> map
			) {
		
		
		map.put("curPage",paging.getCurPage());
		map.put("writer", member.getNickname());
		logger.info(member.toString());
		
		paging = memberService.getTastycurPage(map);
		paging.setKeyword((String) session.getAttribute("nick"));
		
		List<TastyBoard> tastyList = memberService.tastyList(paging);
		
		mav.addObject("tastyList", tastyList);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		logger.info(paging.toString());
		return mav;
	}
	
	@RequestMapping(value="/member/freeList", method=RequestMethod.GET)
	public ModelAndView freeList(ModelAndView mav, Member member, HttpSession session,
			Paging paging, Map<String, Object> map
			) {
		
		map.put("curPage",paging.getCurPage());
		map.put("writer", member.getNickname());
		logger.info(member.toString());
		
		paging = memberService.getFreecurPage(map);
		paging.setKeyword((String) session.getAttribute("nick"));
		
		List<FreeBoard> freeList = memberService.freeList(paging);
		
		mav.addObject("freeList", freeList);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/member/lectureList", method=RequestMethod.GET)
	public ModelAndView lectureList(ModelAndView mav, Member member, HttpSession session,
			Paging paging, Map<String, Object> map
			) {
		
		map.put("curPage",paging.getCurPage());
		map.put("writer", member.getNickname());
		logger.info(member.toString());
		
		paging = memberService.getLecturecurPage(map);
		paging.setKeyword((String) session.getAttribute("nick"));
		
		List<LectureBoard> lectureList = memberService.lectureList(paging);
		
		mav.addObject("lectureList", lectureList);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/member/usedList", method=RequestMethod.GET)
	public ModelAndView usedList(ModelAndView mav, Member member, HttpSession session,
			Paging paging, Map<String, Object> map
			) {
		
		map.put("curPage",paging.getCurPage());
		map.put("writer", member.getNickname());
		logger.info(member.toString());
		
		paging = memberService.getUsedcurPage(map);
		paging.setKeyword((String) session.getAttribute("nick"));
		
		List<UsedBoard> usedList = memberService.usedList(paging);
		
		mav.addObject("usedList", usedList);
		mav.addObject("paging", paging);
		mav.setViewName("jsonView");
		return mav;
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
	 
	 logger.info(member.toString());
	 
	 memberService.memberModifyNick(member);
	 
	 session.invalidate();
	 
	 return "redirect:/";
	}

	@RequestMapping(value = "/member/pwFind", method = RequestMethod.GET)
	public void pwFind() {
		
	}
	
	@RequestMapping(value = "/member/pwFind", method = RequestMethod.POST)
	public ModelAndView pwFindProc(Member member, ModelAndView mav) throws Exception {
		
				logger.info(member.toString());
				boolean pwFind = memberService.pwFind(member);

				if(pwFind) {
					member = memberService.getPwfind(member);
				}
				
				mav.addObject("success", pwFind);
				mav.addObject("password", member.getPassword());
				mav.setViewName("jsonView");
				
				return mav;
	}

}











