package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(HttpSession session) {
		
//		boolean loginCheck = (boolean) session.getAttribute("login");
		String loginCheck = (String) session.getAttribute("nick");
		logger.info(loginCheck);
		
		if(loginCheck == null || loginCheck == "") {
//			logger.info("test");
			return "redirect:/main_no";
		} else {
			return "/main";
		}
	}
	
	@RequestMapping(value="/main_no", method = RequestMethod.GET)
	public void main_no() { 
//		logger.info("test");
	}
	
	@RequestMapping(value="/info/termofservice", method=RequestMethod.GET)
	public void termOfService() { }

	@RequestMapping(value="/info/privacypolicy", method=RequestMethod.GET)
	public void privacypolicy() { }
	
}
