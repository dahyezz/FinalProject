package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TastyBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(TastyBoardController.class);
	
	@RequestMapping(value="/tasty/list", method=RequestMethod.GET)
	public void tastyList() { }

	
}
