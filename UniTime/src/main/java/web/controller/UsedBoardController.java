package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.UsedBoard;
import web.service.face.UsedService;
import web.util.Paging;

@Controller
public class UsedBoardController {
	
	// 테스트 코드 위한 Logger 객체 생성 
	private static final Logger logger
	= LoggerFactory.getLogger(UsedBoard.class);
	
	@Autowired UsedService usedService;
	
	
	/*
	 *  used/List 페이지 컨트롤러
	 */
	@RequestMapping(value="/used/list",
			method=RequestMethod.GET)
	public void list(
			Model model,
			@RequestParam(defaultValue="1") int curPage 
			) {
		
		Paging paging = usedService.getPage(curPage);
		
		List<UsedBoard> boardList
		= usedService.list(paging);
		
		model.addAttribute("list", boardList);
		model.addAttribute("paging", paging);
		
	}
	
	
	/*
	 *  used/view 페이지 컨트롤러 
	 */
	@RequestMapping(value="/used/view",
			method=RequestMethod.GET)
	public void view(
			Model model,
			UsedBoard usedBoard
			) {
		
		logger.info(usedBoard.toString());
		
		usedBoard = usedService.view(usedBoard);
		
		model.addAttribute("usedboard", usedBoard);
		
	}
}
