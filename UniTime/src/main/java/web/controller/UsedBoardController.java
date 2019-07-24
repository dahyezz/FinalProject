package web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
			UsedBoard usedBoard
			) {
		
		logger.info("게시글 보기");
		logger.info(usedBoard.toString());
		
		// 게시글 번호 파싱
		int boardno = usedBoard.getBoardno();
		
		// 게시글 조회
		usedBoard = usedService.view(boardno);
		
		// 게시글 이미지 조회
		UsedImage usedImg = usedService.viewImg(boardno);
		
		// model로 객체 전달 
		model.addAttribute("usedboard", usedBoard);
		model.addAttribute("viewImg", usedImg);
		
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
			@RequestParam(value="usedimg") MultipartFile img
			) {
		
		logger.info("작성된 게시글 처리 중");
		
		// 세션 정보 넣어주기 
		usedBoard.setWriter((String)session.getAttribute("nick"));
		
		// 게시글 작성, 첨부파일 저장
		usedService.write(usedBoard, img, context);
		
		return "redirect:/used/list";
	}
	
	
	/**
	 * used/update 컨트롤러
	 * 게시글 수정
	 */
	@RequestMapping(value="/used/update", method=RequestMethod.GET)
	public void update(
			UsedBoard usedboard,
			Model model) {
		
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
		
		// redirect 한글 깨짐 해결
		String tag = null;
		try {
			tag=URLEncoder.encode(usedboard.getTag(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/used/view?tag="+tag+"&boardno="+usedboard.getBoardno();
	}
	
//	@RequestMapping(value="/used/delete",
//			method=RequestMethod.GET)
//	public String delete(UsedBoard usedboard) {
//		usedService.delete(usedboard.getBoardno());
//		
//		return "redirect:/used/list";
//	}
	
	
}
