package web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.TastyBoard;
import web.dto.TastyFile;
import web.service.face.TastyBoardService;
import web.util.Paging;

@Controller
public class TastyBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(TastyBoardController.class);
	
	@Autowired ServletContext context;
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
	
	@RequestMapping(value="/tasty/imageUpload", method=RequestMethod.POST)
	public ResponseEntity<?> imageUpload(
			TastyBoard tastyBoard,
			@RequestParam("file") MultipartFile fileupload
			) {
		
		logger.info(tastyBoard.toString());
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("tastyUpload"));
		
		TastyFile tastyFile = tastyBoardService.uploadFile(fileupload);
		return ResponseEntity.ok().body("/image/"+tastyFile.getFileno());
		
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
