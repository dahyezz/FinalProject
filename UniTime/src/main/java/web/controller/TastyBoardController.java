package web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

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
	
	// json 데이터로 응답을 보내기 위한 
	@Autowired MappingJackson2JsonView jsonView;

	
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
		
		return "redirect:/tasty/view?boardno="+tastyBoard.getBoardno();
	}
	
	@RequestMapping(value="/tasty/imageUpload", method=RequestMethod.POST)
	public void imageUpload(
			TastyBoard tastyBoard,
			@RequestParam("file") MultipartFile fileupload,
			HttpServletResponse resp
//			ModelAndView mav
			) {
		
		logger.info(tastyBoard.toString());
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("tastyUpload"));
		
		//첨부파일 저장
		TastyFile tastyfile = tastyBoardService.uploadFile(tastyBoard, fileupload, context);
//		return ResponseEntity.ok().body("/tasty/"+tastyFile.getFileno());
		logger.info(tastyfile.toString());
		String url = tastyfile.getOriginName();
//		mav.setViewName("multipartResolver");
//		mav.setView(jsonView);
//		mav.addObject("file", tastyfile);
		
//		return mav;
		
		try {
			resp.getWriter().append("{\"url\":"+url+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
//	  @GetMapping("/tasty/{fileno}")
//	  @ResponseBody
//	  public ResponseEntity<?> serveFile(@PathVariable int fileno, HttpServletResponse response) {
//	      try {
//	          TastyFile tastyfile = tastyBoardService.load(fileno);
//	          logger.info(tastyfile.toString());
//
//	          HttpHeaders headers = new HttpHeaders();
//	          
//	          Resource resource = tastyBoardService.loadAsResource(tastyfile.getStoredName());
//	          
////	          File src = new File(context.getRealPath("tastyUpload"), tastyfile.getStoredName());
//////	          Resource resource = (Resource) src;
////	          logger.info(src.toString());
////	          
////	          response.setContentType("application/octet-stream");
////	          response.setContentLength((int)src.length());
////	          response.setCharacterEncoding("utf-8");
////	          
////	          File origin = new File(context.getRealPath("tastyUpload"), tastyfile.getStoredName());
////	          
////	          FileInputStream fis = new FileInputStream(origin);
////	          Resource resource = (Resource) origin;
//	          
//	          String fileName = tastyfile.getOriginName();
//	          headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
//	 
//	          
//	          
////	          if (MediaUtils.containsImageMediaType(t.getContentType())) {
////	              headers.setContentType(MediaType.valueOf(uploadedFile.getContentType()));
////	          } else {
////	              headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
////	          }
//	            
//	          return ResponseEntity.ok().headers(headers).body(resource);
//	            
//	      } catch (Exception e) {
//	          e.printStackTrace();
//	          return ResponseEntity.badRequest().build();
//	      }
//	  }

	
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
	public String writeComment(TastyComment tastyComment) {
		
		logger.info(tastyComment.toString());
		
		tastyBoardService.writeComment(tastyComment);
		
		return "redirect:/tasty/view?boardno="+tastyComment.getBoardno();
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

	
}
