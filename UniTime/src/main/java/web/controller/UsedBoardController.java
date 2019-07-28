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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dto.UsedBoard;
import web.dto.UsedImage;
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
	
	
	/**
	 *  used/view 페이지 컨트롤러 
	 */
	@RequestMapping(value="/used/view",
			method=RequestMethod.GET)
	public void view(
			Model model,
			UsedBoard usedboard
			) {
		
		logger.info("게시글 보기");
		logger.info(usedboard.toString());
		
		// 게시글 번호 파싱
		int boardno = usedboard.getBoardno();
		
		// 게시글 조회
		usedboard = usedService.view(boardno);
		
		// model로 객체 전달 
		model.addAttribute("usedboard", usedboard);
		
	}
	
	
	/**
	 * used/write 컨트롤러
	 * 게시글 작성
	 */
	@RequestMapping(value="/used/write",
			method=RequestMethod.GET)
	public void write() {
		logger.info("게시글 작성 중");
	}
	
	@RequestMapping(value="/used/write",
			method=RequestMethod.POST)
	public String writingProc(
			HttpSession session,
			UsedBoard usedBoard,
			String images
			) {
		
		logger.info("작성된 게시글 처리 중");
		
		// 세션 정보 넣어주기 
		usedBoard.setWriter((String)session.getAttribute("nick"));
		
		// 게시글 작성, 첨부파일 저장
		usedService.write(usedBoard,images);
		
		return "redirect:/used/list";
	}
	
	
	/**
	 *  이미지 저장하기 컨트롤러 
	 */
	@RequestMapping(value="/used/productImage", method=RequestMethod.POST)
	public void productImage(
			UsedBoard usedboard,
			@RequestParam("img") MultipartFile fileupload,
			HttpServletResponse resp
			) {
		
		logger.info(usedboard.toString());
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("usedUpload"));
		
		
		
		//첨부파일 저장
		UsedImage usedImage = usedService.uploadFile(usedboard, fileupload, context);
		logger.info(usedboard.toString());
		logger.info(usedImage.toString());
	
		
		
		try {
			resp.getWriter().append("{\"usedimgno\":"+usedImage.getUsedImgNo()+", \"boardno\":"+usedImage.getBoardno()+"}");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	
	/**
	 *  이미지 불러오기 컨트롤러 
	 */

	@RequestMapping(value="/usedUpload", method=RequestMethod.GET)
	public void getFiles(
			ModelAndView mav, 
			UsedImage usedImg,
			HttpServletResponse resp
		) {
		
		logger.info("getfile--------------------------------");
		logger.info(usedImg.toString());
		
		usedImg = usedService.getImg(usedImg);
		logger.info(usedImg.toString());
		
		File src = new File(context.getRealPath("usedUpload"), usedImg.getStoredName());
		
		resp.setContentLength((int) src.length());
		resp.setCharacterEncoding("utf-8");
		
		String filename = "";
		
		try {
			filename = URLEncoder.encode(usedImg.getOriginName(), "utf-8");
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
		
		File origin = new File(context.getRealPath("usedUpload"), usedImg.getStoredName());
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
	
	
	
	/**
	 * used/update 컨트롤러
	 * 게시글 수정
	 */
	@RequestMapping(value="/used/update", method=RequestMethod.GET)
	public void update(
			UsedBoard usedboard,
			Model model
		) {
		
		logger.info("게시글 수정 중");
		
		// 게시글 정보 가져오기
		usedboard = usedService.view(usedboard.getBoardno());
		model.addAttribute("usedboard", usedboard);
	}
	
	@RequestMapping(value="/used/update",
			method=RequestMethod.POST)
	public String updatingProc(UsedBoard usedboard) {
		
		logger.info("수정된 게시글 처리 중");
		
		usedService.update(usedboard);

		
		return "redirect:/used/view?boardno="+usedboard.getBoardno();
	}
	
	@RequestMapping(value="/used/delete",
			method=RequestMethod.GET)
	public String delete(UsedBoard usedboard) {
		usedService.delete(usedboard);
		
		return "redirect:/used/list";
	}
	
	
}
