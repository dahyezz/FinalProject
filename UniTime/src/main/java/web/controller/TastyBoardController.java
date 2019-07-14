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

import web.dto.TastyBoard;
import web.service.face.TastyBoardService;
import web.util.Paging;

@Controller
public class TastyBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(TastyBoardController.class);
	
	@Autowired TastyBoardService tastyBoardService;
	
	@RequestMapping(value="/tasty/list", method=RequestMethod.GET)
	public void list(Model model,
			@RequestParam(defaultValue="1") int curPage
			) {
		
		Paging paging = tastyBoardService.getcurPage(curPage);
		
		List<TastyBoard> boardList = tastyBoardService.list(paging);

		model.addAttribute("list", boardList);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/tasty/view", method=RequestMethod.GET)
	public void view(TastyBoard tastyBoard, Model model) {
		
		logger.info(tastyBoard.toString());
		
		tastyBoard = tastyBoardService.getBoard(tastyBoard);
		
		model.addAttribute("board", tastyBoard);
	}
	
	@RequestMapping(value="/tasty/write", method=RequestMethod.GET)
	public void write() { }

	@RequestMapping(value="/tasty/write", method=RequestMethod.POST)
	public String writeProc(TastyBoard tastyBoard) {
		
		tastyBoardService.write(tastyBoard);
		
		logger.info(tastyBoard.toString());
		
		return "redirect:/tasty/view?boardno="+tastyBoard.getBoardno();
	}
	
	@RequestMapping(value="/tasty/delete", method=RequestMethod.GET)
	public String delete(TastyBoard tastyBoard) {
		tastyBoardService.delete(tastyBoard);
		
		return "redirect:/tasty/list";
	}
	
	@RequestMapping(value="/tasty/update", method=RequestMethod.GET)
	public void update(TastyBoard tastyBoard, Model model) {
		tastyBoard = tastyBoardService.getBoard(tastyBoard);
		
		model.addAttribute("board", tastyBoard);
	}
	
	@RequestMapping(value="/tasty/update", method=RequestMethod.POST)
	public String updateProc(TastyBoard tastyBoard) {
		logger.info(tastyBoard.toString());
		tastyBoardService.update(tastyBoard);
		
		return "redirect:/tasty/view?boardno="+tastyBoard.getBoardno();
	}

	
}
