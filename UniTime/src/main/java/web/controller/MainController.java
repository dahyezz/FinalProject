package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.MainService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired MainService mainService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void main(HttpSession session) { 
	}
	
	@RequestMapping(value="/kg_main", method=RequestMethod.GET)
	public void kg_main(Model model, HttpSession session) {
		
		List freeboardNoticeList = mainService.freeboardNotice();
		model.addAttribute("notice", freeboardNoticeList);
//		logger.info("공지사항 : " + freeboardNoticeList);
		
		List freeboard = mainService.freeboard();
		model.addAttribute("freeboard", freeboard);
//		logger.info("자유게시판 : " + freeboard);
		
		List tastyboard = mainService.tastyBoard();
		model.addAttribute("tastyboard", tastyboard);
//		logger.info("테이스티 : " + tastyboard);
		
		List usedBoard = mainService.usedBoard();
		model.addAttribute("usedboard", usedBoard);
		
		String email = (String)session.getAttribute("email");
		List timeTable = mainService.timeTable(email);
		model.addAttribute("myList", timeTable);
		logger.info("시간표 : " + email);
		
		
		
		

	}
	
	@RequestMapping(value="/unitime", method=RequestMethod.GET)
	public void unitime() { }
	
	
	
	@RequestMapping(value="/info/termofservice", method=RequestMethod.GET)
	public void termOfService() { }

	@RequestMapping(value="/info/privacypolicy", method=RequestMethod.GET)
	public void privacypolicy() { }
	
}
