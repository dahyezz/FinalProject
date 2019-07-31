package web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.GetProxy;
import web.dto.BadReport;
import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.FreeFile;
import web.dto.TastyBoard;
import web.dto.TastyFile;
import web.dto.FreeComment;
import web.service.face.FreeBoardService;
import web.util.Paging;

@Controller
public class FreeBoardController {

	@Autowired private FreeBoardService freeBoardService;
	
	@Autowired ServletContext context;

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@RequestMapping(value="/free/list", method=RequestMethod.GET)
	public void list( HttpServletRequest req, Model model) {
		logger.info("자유게시판 리스트");
		
		//FreeBoardNotice 테이블 전제 조회 결과 얻기
		List noticeList=freeBoardService.noticeList();
		model.addAttribute("noticeList", noticeList);
		
		//요청 파라미터에서 curPage 얻어오기
		Paging paging=freeBoardService.getCurPage(req);
		
		//MODEL로 paging 객체 넣기
		model.addAttribute("paging", paging);
		model.addAttribute("searchType", paging.getSearchType());
		model.addAttribute("keyword",paging.getKeyword());
		
		//FreeBoard 테이블 전체 조회 결과 얻기
		List list=freeBoardService.list(paging);
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value="/free/view", method=RequestMethod.GET)
	public void view(FreeBoard freeBoard, FreeBoardNotice freeBoardNotice, Model model) {
		
		//게시글 조회
		if("공지".equals(freeBoardNotice.getTag())) {
			
			freeBoardNotice=freeBoardService.viewNotice(freeBoardNotice.getBoardno());
			
			model.addAttribute("board",freeBoardNotice);
			
		} else{
			//게시글 번호 파싱
			int boardno = freeBoard.getBoardno();
			
			freeBoard=freeBoardService.view(boardno);
			
			//게시글의 파일 조회
			FreeFile file=freeBoardService.viewFile(boardno);
			
			//게시글의 댓글 조회
			//List<FreeComment> commentList=freeBoardService.commentList(boardno);
			
			//MODEL로 객체 전달
			model.addAttribute("board", freeBoard);
			model.addAttribute("viewFile", file);
			//model.addAttribute("commentList", commentList);
		}
	}
	
	@RequestMapping(value="/free/write", method=RequestMethod.GET)
	public void write() {	}
	
	@RequestMapping(value="/free/write", method=RequestMethod.POST)
	public String writeProc(HttpSession session, FreeBoard freeBoard, FreeBoardNotice freeBoardNotice, 
							@RequestParam(value="file") MultipartFile fileupload) {
		
		//세션 정보 넣어주기
		freeBoard.setWriter((String)session.getAttribute("nick"));
		freeBoardNotice.setWriter((String)session.getAttribute("nick"));
		
		//게시글 작성, 첨부파일 저장
		if("공지".equals(freeBoardNotice.getTag())) {
			freeBoardService.writeNotice(freeBoardNotice);
		} else {
			freeBoardService.write(freeBoard, fileupload, context);
		}
		
		return "redirect:/free/list";
	}
	
	@RequestMapping(value="/free/imageUpload", method=RequestMethod.POST)
	public void imageUpload(FreeBoard freeBoard,
							@RequestParam("file") MultipartFile fileupload,
							HttpServletResponse resp,
							HttpServletRequest req ) {
		
		//첨부파일 저장
		FreeFile freeFile = freeBoardService.uploadImage(freeBoard, fileupload, context);
		logger.info(freeBoard.toString());
		logger.info(freeFile.toString());
		
		try {
			resp.getWriter().append("{\"fileno\":"+freeFile.getFileno()+", \"boardno\":"+freeFile.getBoardno()+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 글 작성 폼에서 이미지 선택 시 summernote에 이미지 뜨도록 하는 메소드 -> tempfree에서 조회
	@RequestMapping(value="/freeImage", method=RequestMethod.GET)
	public void getImage(FreeFile freeFile, HttpServletRequest req, HttpServletResponse resp) {
	
		freeFile = freeBoardService.getFile(freeFile.getFileno());
		
		File src = new File(context.getRealPath("freeUpload"), freeFile.getStoredname());
		
		resp.setContentLength((int) src.length());
		resp.setCharacterEncoding("utf-8");
		
		String filename = "";
		
		try {
			filename = URLEncoder.encode(freeFile.getOriginname(), "utf-8");
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
		
		
		File origin = new File(context.getRealPath("freeUpload"), freeFile.getStoredname());
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
	
	@RequestMapping(value="/free/update", method=RequestMethod.GET)
	public void update(FreeBoard freeBoard, FreeBoardNotice freeBoardNotice, Model model) {
		
		//게시글 정보 가져오기
		if("공지".equals(freeBoardNotice.getTag())) {
			
			freeBoardNotice=freeBoardService.viewNotice(freeBoardNotice.getBoardno());
			model.addAttribute("board",freeBoardNotice);
			
		} else{
			freeBoard=freeBoardService.view(freeBoard.getBoardno());
			model.addAttribute("board", freeBoard);
		}
	}
	
	@RequestMapping(value="/free/update", method=RequestMethod.POST)
	public String updateProc(FreeBoard freeBoard, FreeBoardNotice freeBoardNotice) {
		
		//게시글 수정
		if("공지".equals(freeBoardNotice.getTag())) {
			
			//공지 게시글 수정
			freeBoardService.updateNotice(freeBoardNotice);
			
			//redirect 한글 깨짐 해결
			String tag = null;
			try {
				tag=URLEncoder.encode(freeBoardNotice.getTag(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			return "redirect:/free/view?tag="+tag+"&boardno="+freeBoardNotice.getBoardno();
		} else {
			
			//일반 게시글 수정
			freeBoardService.update(freeBoard);
			
			//redirect 한글 깨짐 해결
			String tag = null;
			try {
				tag=URLEncoder.encode(freeBoard.getTag(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			return "redirect:/free/view?tag="+tag+"&boardno="+freeBoard.getBoardno();
		}
	}
	
	@RequestMapping(value="/free/delete", method=RequestMethod.GET)
	public String delete(FreeBoard freeBoard, FreeBoardNotice freeBoardNotice) {
		
		//게시글 삭제
		if("공지".equals(freeBoardNotice.getTag())) {
			freeBoardService.deleteNotice(freeBoardNotice.getBoardno());
		} else {
			freeBoardService.delete(freeBoard.getBoardno());
		}
		
		return "redirect:/free/list";
	}

	@RequestMapping(value="/free/download", method=RequestMethod.GET)
	public ModelAndView download(int fileno,	//파일번호 전달 파라미터
								ModelAndView mav) {
		logger.info("파일 다운로드");
		
		//파일번호에 해당하는 파일 정보 가져오기
		FreeFile file=freeBoardService.getFile(fileno);
		
		//파일정보 Model로 값 넘기기
		mav.addObject("downFile", file);
		//-> FreeDownloadView 클래스에 Model값이 넘어감
		
		//viewName 지정
		mav.setViewName("freedown");
		//-> servlet-context.xml에 freedown이라는 이름으로 지정한 빈을 viewName으로 지정하면 FreeDownloadView 클래스가 동작
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/free/commentview", method= RequestMethod.GET)
	public List<FreeComment> commentView(int boardno) {
		
		//게시글의 댓글 조회
		List<FreeComment> commentList=freeBoardService.commentList(boardno);
		
		return commentList;
	}
	
	@RequestMapping(value="/free/commentwrite", method=RequestMethod.POST)
	@ResponseBody
	public void commentWrite(HttpSession session, FreeComment freeComment) {
		
		freeComment.setWriter((String)session.getAttribute("nick"));
		
		//댓글 작성
		freeBoardService.commentWrite(freeComment);
	}
	
	@RequestMapping(value="/free/commentdelete", method=RequestMethod.POST)
	@ResponseBody
	public void commentDelete(FreeComment freeComment) {
		
		freeBoardService.commentDelete(freeComment.getCommentno());
		
	}
	
	@RequestMapping(value="/free/checkdelete", method=RequestMethod.GET)
	public String checkDelete(int[] checkDelete) {
		
		for(int boardno : checkDelete) {
			freeBoardService.delete(boardno);
		}
		
		return "redirect:/free/list";
	}
	
	@RequestMapping(value="/free/report", method=RequestMethod.GET)
	public void report(BadReport badReport, Model model) {	
		
		logger.info(badReport.toString());
		model.addAttribute("badReport",badReport);
	}
	
	@RequestMapping(value="/free/report", method=RequestMethod.POST)
	public void reportProc(BadReport badReport, HttpServletResponse resp) {
	
		logger.info(badReport.toString());

		freeBoardService.report(badReport);
		
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out=null;
//		try {
//			out = resp.getWriter();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		if(report) {
//			out.println("<script type='text/javascript'>");
//		    out.println("alert('신고 접수 완료되었습니다.');");
//		    out.println("</script>");
//		    out.flush();
//		}else {
//			out.println("<script type='text/javascript'>");
//		    out.println("alert('이미 신고 접수 하셨습니다.');");
//		    out.println("</script>");
//		    out.flush();
//		}
	}
}
