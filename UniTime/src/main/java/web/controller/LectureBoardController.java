package web.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.BadReport;
import web.dto.LectureBoard;
import web.dto.LectureComment;
import web.dto.TimeTable;
import web.service.face.LectureBoardService;
import web.util.Paging;

@Controller
public class LectureBoardController {

	@Autowired private LectureBoardService lectureBoardService;
	
	@Autowired ServletContext context;

	private static final Logger logger = LoggerFactory.getLogger(LectureBoardController.class);
	
	@RequestMapping(value="/lecture/list", method=RequestMethod.GET)
	public void list( HttpServletRequest req, Model model) {
		
		//요청 파라미터에서 curPage 얻어오기
		Paging paging=lectureBoardService.getCurPage(req);
		
		//MODEL로 paging 객체 넣기
		model.addAttribute("paging", paging);
		model.addAttribute("searchType", paging.getSearchType());
		model.addAttribute("keyword",paging.getKeyword());
		
		//LectureBoard 테이블 전체 조회 결과 얻기
		List list=lectureBoardService.list(paging);
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping(value="/lecture/view", method=RequestMethod.GET)
	public void view(LectureBoard lectureBoard, TimeTable timeTable, Model model) {
		
		//게시글 번호 파싱
		int boardno = lectureBoard.getBoardno();
			
		lectureBoard=lectureBoardService.view(boardno);
		
		int department_code=lectureBoard.getDepartment_code();
		
		timeTable=lectureBoardService.getTimeTable(department_code);
			
		//MODEL로 객체 전달
		model.addAttribute("board", lectureBoard);
		model.addAttribute("timetable",timeTable);
	}
	
	@RequestMapping(value="/lecture/write", method=RequestMethod.GET)
	public void write() {	}
	
	@RequestMapping(value="/lecture/write", method=RequestMethod.POST)
	public String writeProc(HttpSession session, LectureBoard lectureBoard) {
		
		//세션 정보 넣어주기
		lectureBoard.setWriter((String)session.getAttribute("nick"));
		
		//게시글 작성
		lectureBoardService.write(lectureBoard);
		
		return "redirect:/lecture/list";
	}
	
	@RequestMapping(value="/lecture/update", method=RequestMethod.GET)
	public void update(LectureBoard lectureBoard, Model model) {
		
		//게시글 정보 가져오기
		lectureBoard=lectureBoardService.view(lectureBoard.getBoardno());
		model.addAttribute("board", lectureBoard);
	}
	
	@RequestMapping(value="/lecture/update", method=RequestMethod.POST)
	public String updateProc(LectureBoard lectureBoard) {
		
		//게시글 수정
		lectureBoardService.update(lectureBoard);
			
		return "redirect:/lecture/view?boardno="+lectureBoard.getBoardno();

	}
	
	@RequestMapping(value="/lecture/delete", method=RequestMethod.GET)
	public String delete(LectureBoard lectureBoard) {
		
		//게시글 삭제
		lectureBoardService.delete(lectureBoard.getBoardno());
		
		return "redirect:/lecture/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/lecture/commentview", method= RequestMethod.GET)
	public List<LectureComment> commentView(int boardno) {
		
		//게시글의 댓글 조회
		List<LectureComment> commentList=lectureBoardService.commentList(boardno);
		
		return commentList;
	}
	
	@RequestMapping(value="/lecture/commentwrite", method=RequestMethod.POST)
	@ResponseBody
	public void commentWrite(HttpSession session, LectureComment lectureComment) {
		
		lectureComment.setWriter((String)session.getAttribute("nick"));
		
		//댓글 작성
		lectureBoardService.commentWrite(lectureComment);
	}
	
	@RequestMapping(value="/lecture/commentdelete", method=RequestMethod.POST)
	@ResponseBody
	public void commentDelete(LectureComment lectureComment) {
		
		lectureBoardService.commentDelete(lectureComment.getCommentno());
		
	}
	
	@RequestMapping(value="/lecture/checkdelete", method=RequestMethod.GET)
	public String checkDelete(int[] checkDelete) {
		
		for(int boardno : checkDelete) {
			lectureBoardService.delete(boardno);
		}
		
		return "redirect:/lecture/list";
	}
	
	@RequestMapping(value="/lecture/report", method=RequestMethod.GET)
	public void report(BadReport badReport, Model model) {	
		
		logger.info(badReport.toString());
		model.addAttribute("badReport",badReport);
	}
	
	@RequestMapping(value="/lecture/report", method=RequestMethod.POST)
	public void reportProc(BadReport badReport, HttpServletResponse resp) {
	
		logger.info(badReport.toString());

		lectureBoardService.report(badReport);

	}
}
