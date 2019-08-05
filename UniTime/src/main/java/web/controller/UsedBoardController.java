package web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dto.UsedBoard;
import web.dto.UsedImage;
import web.dto.UsedComment;
import web.service.face.UsedService;
import web.util.Paging;

@Controller
public class UsedBoardController {
	
	@Autowired UsedService usedService;
	@Autowired ServletContext context;
	
	// 테스트 코드 위한 Logger 객체 생성 
	private static final Logger logger
	= LoggerFactory.getLogger(UsedBoard.class);
	
	
	/**
	 *  used/List 페이지 컨트롤러
	 */
	@RequestMapping(value="/used/list", method=RequestMethod.GET)
	public void list(
			Model model,
			@RequestParam(defaultValue="1") int curPage 
			) {
		
		Paging paging = usedService.getPage(curPage);
		model.addAttribute("paging", paging);
		
		List<UsedBoard> boardList
		= usedService.list(paging);
		model.addAttribute("list", boardList);
		
	}
	
	
	/**
	 *  used/view 페이지 컨트롤러 
	 */
	@RequestMapping(value="/used/view", method=RequestMethod.GET)
	public void view(
			@RequestParam int boardno,
			Model model
		) {
		
		usedService.hitview(boardno);
		
		UsedBoard usedboard = usedService.view(boardno);
		model.addAttribute("usedboard", usedboard);
		
		List<UsedComment> commentList = usedService.getCmt(boardno);
		model.addAttribute("commentList", commentList);
	}
	
	
	/**
	 * used/write 컨트롤러
	 * 게시글 작성
	 */
	@RequestMapping(value="/used/write", method=RequestMethod.GET)
	public void write(
			HttpSession session,
			Model model
		) {
		
		logger.info("게시글 작성 중");

		UsedBoard usedboard = new UsedBoard();
		
		usedboard.setWriter((String)session.getAttribute("nick"));
		
		model.addAttribute("usedboard", usedboard);
		
	}
	
	@RequestMapping(value="/used/write", method=RequestMethod.POST)
	public String writingProc(
			UsedBoard usedboard,
			Model model,
			String images
			) {
		
		logger.info("작성된 게시글 처리 중");
		logger.info(usedboard.toString());
		
		// 게시글 작성
		usedService.write(usedboard,images);
		
		return "redirect:/used/list";
	}
	
	
	/**
	 * 게시글 수정 
	 * model 이용해서 board에 게시글 삽입
	 * 
	 * @param usedboard
	 * @param model
	 */
	@RequestMapping(value="/used/update", method=RequestMethod.GET)
	public void update(
			@RequestParam int boardno,
			Model model
		) {
		
		logger.info("게시글 수정 중");
		UsedBoard usedboard = usedService.view(boardno); 
		
		model.addAttribute("usedboard", usedboard);
		model.addAttribute("boardno", boardno);
	}
	
	
	@RequestMapping(value="/used/update",
			method=RequestMethod.POST)
	public String updatingProc(
			UsedBoard usedboard,
			Model model
		) {
		
		logger.info("게시글 수정 처리중.");
		logger.info(usedboard.toString());
		
		usedService.update(usedboard);

		return "redirect:/used/view?boardno="+usedboard.getBoardno();
	}
	
	
	/**
	 * 게시글 삭제
	 * 
	 * @param usedboard
	 * @return
	 */
	@RequestMapping(value="/used/delete",
			method=RequestMethod.GET)
	public String delete(
			@RequestParam int boardno
		) {
		usedService.delete(boardno);
		
		return "redirect:/used/list";
	}
	
	
	
	/**
	 *  이미지 저장하기(upload) 컨트롤러 
	 */
	@RequestMapping(value="/used/imgUpload", method=RequestMethod.POST)
	public @ResponseBody UsedImage imgUpload(
			UsedImage usedimg,
			@RequestParam("img") MultipartFile imgUpload
			) {
		
		usedimg = usedService.storeImg(
				usedimg, imgUpload, context);
		
		return usedimg;
	}
	
	
	@RequestMapping(value="/usedImage",
			method=RequestMethod.GET)
	public void loadImg(
			UsedImage usedimg,
			HttpServletResponse resp) {
		
		usedimg = usedService.getImg(usedimg);
		
		File file = usedService.findImg(usedimg, context);
		resp.setContentLength((int)file.length());
		resp.setCharacterEncoding("utf-8");
		

		FileInputStream fis = null;
		logger.info(context.getRealPath("usedUpload"));
		try {
			fis = new FileInputStream(file);
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
	
	
	/**
	 * 댓글 목록 조회하는 컨트롤러 
	 * @param usedboard
	 * @param model
	 */
	@RequestMapping(value="/used/commentList",
			method=RequestMethod.GET)
	public void commentList(
			UsedBoard usedboard,
			Model model
		) {
		
		logger.info("댓글목록 조회");
		
		// List 댓글 객체 생성 
		List<UsedComment> commentList = usedService.getCmt(usedboard.getBoardno());
		
		// 모델로 댓글 객체 전달
		model.addAttribute("commentList", commentList);
	}
	
	
	/**
	 *  댓글 작성 컨트롤러 
	 * @param comment
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/used/writecomment", method=RequestMethod.POST)
	public String writeComment(
			UsedComment usdedcmt,
			Model model) {
		
		usedService.writeCmt(usdedcmt);
		
		List<UsedComment> commentList = usedService.getCmt(usdedcmt.getBoardno());
		model.addAttribute("commentList", commentList);

		return "redirect:/used/commentList?boardno="+usdedcmt.getBoardno();
	}
	
	
	/**
	 *  댓글 수정하는 컨트롤러 
	 * @param usedComment
	 * @param model
	 */
	@RequestMapping(value="/used/updateComment", method=RequestMethod.POST)
	public String updateComment(
			UsedComment usdedcmt,
			Model model
		) {
	
		logger.info("댓글 수정중");
		usedService.updateCmt(usdedcmt);
		
		UsedBoard usedboard = new UsedBoard();
		int boardno = usedboard.getBoardno();
		
		List<UsedComment> commentList = usedService.getCmt(boardno);
		model.addAttribute("commentList", commentList);
		
		return "redirect:/used/commentList?boardno="+usdedcmt.getBoardno();
	}
	
	
	/**
	 *  댓글 삭제하는 컨트롤러 
	 * @param usedComment
	 * @param response
	 */
	@RequestMapping(value="/used/deleteComment", method=RequestMethod.POST)
	public String deleteComment(
			UsedComment usedComment,
			Model model
		) {
		logger.info(usedComment.toString());
		
		usedService.deleteCmt(usedComment);
		
		List<UsedComment> commentList = usedService.getCmt(usedComment.getBoardno());
		model.addAttribute("commentList", commentList);
		
		return "redirect:/used/commentList?boardno="+usedComment.getBoardno();
	}
	
	
}
