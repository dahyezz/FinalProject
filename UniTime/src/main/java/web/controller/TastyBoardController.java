package web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dto.TastyBoard;
import web.dto.TastyComment;
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
		List<TastyComment> commentList = tastyBoardService.getComment(tastyBoard);
		
		model.addAttribute("board", tastyBoard);
		model.addAttribute("commentList", commentList);
	}
	
	@RequestMapping(value="/tasty/write", method=RequestMethod.GET)
	public void write() { }

	@RequestMapping(value="/tasty/write", method=RequestMethod.POST)
	public String writeProc(TastyBoard tastyBoard) {

		tastyBoardService.write(tastyBoard);
		
		logger.info(tastyBoard.toString());
		
		return "redirect:/tasty/list";
//		return "redirect:/tasty/view?boardno="+tastyBoard.getBoardno();
	}
	
	@RequestMapping(value="/tasty/imageUpload", method=RequestMethod.POST)
	public void imageUpload(
			TastyBoard tastyBoard,
			@RequestParam("file") MultipartFile fileupload,
			HttpServletResponse resp,
			HttpServletRequest req
//			ModelAndView mav
			) {
		
		logger.info(tastyBoard.toString());
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("tastyUpload"));
		
		//첨부파일 저장
		TastyFile tastyfile = tastyBoardService.uploadFile(tastyBoard, fileupload, context);
		logger.info(tastyBoard.toString());
		logger.info(tastyfile.toString());
//		String url = tastyfile.getStoredName();
	
		
		try {
//			resp.getWriter().append("{\"fileno\":"+tastyfile.getFileno()+"}");
//			resp.getWriter().append("{\"boardno\":"+tastyfile.getBoardno()+"}");
			resp.getWriter().append("{\"fileno\":"+tastyfile.getFileno()+", \"boardno\":"+tastyfile.getBoardno()+"}");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping(value="/tastyUpload", method=RequestMethod.GET)
	public void getFiles(ModelAndView mav, TastyFile tastyfile, HttpServletRequest req, HttpServletResponse resp) {
		
		logger.info("getfile--------------------------------");
		logger.info(tastyfile.toString());
		
		tastyfile = tastyBoardService.getFile(tastyfile);
		logger.info(tastyfile.toString());
		
		File src = new File(context.getRealPath("tastyUpload"), tastyfile.getStoredName());
		
		resp.setContentLength((int) src.length());
		resp.setCharacterEncoding("utf-8");
		
		String filename = "";
		
		try {
			filename = URLEncoder.encode(tastyfile.getOriginName(), "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		//UTF-8 인코딩 오류 수정 (한글만 바꿔야 하는데 특수기호까지 바꿔서 문제가 생기는것)
		filename = filename.replace("+", "%20"); //띄어쓰기
		
		filename = filename.replace("%5B", "["); 
		filename = filename.replace("%5D", "]");
		
		filename = filename.replace("%21", "!"); 
		filename = filename.replace("%23", "#"); 
		filename = filename.replace("%24", "$"); 
		
		
		File origin = new File(context.getRealPath("tastyUpload"), tastyfile.getStoredName());
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(origin);
			OutputStream out = resp.getOutputStream();
	
			FileCopyUtils.copy(fis, out);
			
			out.flush();
			
			fis.close();
			out.close();
			
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

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
	

	@RequestMapping(value="/tasty/writeComment", method=RequestMethod.POST)
	public String writeComment(TastyComment tastyComment, HttpServletResponse response, Model model) {
		
		response.setContentType("application/json;charset=UTF-8");

		logger.info(tastyComment.toString());
		
		tastyBoardService.writeComment(tastyComment);
		
		tastyComment = tastyBoardService.getComment(tastyComment);
//		return "redirect:/tasty/view?boardno="+tastyComment.getBoardno();
		
		TastyBoard tastyBoard = new TastyBoard();
		tastyBoard.setBoardno(tastyComment.getBoardno());
//		List<TastyComment> commentList = tastyBoardService.getComment(tastyBoard);
//		model.addAttribute("commentList", commentList);
		
		return "redirect:/tasty/comment?boardno="+tastyBoard.getBoardno();
	}
	
	@RequestMapping(value="/tasty/comment", method=RequestMethod.GET)
	public void commentList(TastyBoard tastyBoard, Model model) {
		
		List<TastyComment> commentList = tastyBoardService.getComment(tastyBoard);
		model.addAttribute("commentList", commentList);
	}
	
	@RequestMapping(value="/tasty/deleteComment", method=RequestMethod.POST)
	public void deleteComment(TastyComment tastyComment, HttpServletResponse response) {
		logger.info(tastyComment.toString());
		
		tastyComment = tastyBoardService.getBoardno(tastyComment);
		tastyBoardService.deleteComment(tastyComment);
		
		boolean success = true;
		
		try {
			response.getWriter().append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="/tasty/listDelete", method=RequestMethod.POST)
	public String deleteList(String names) {
//		logger.info(names);
		
		tastyBoardService.deleteList(names);
		
		return "redirect:/tasty/list";
	}

	
}
