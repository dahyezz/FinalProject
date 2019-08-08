package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Member;
import web.dto.TempTable;
import web.dto.TimeTable;
import web.service.face.MemberService;
import web.service.face.TimeTableService;

@Controller
public class TimeTableController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	
	@Autowired TimeTableService timeTableService;
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/timetable/lecturelist", method=RequestMethod.GET)
	public void lectureAll(Model model, HttpSession session) { 
		logger.info("시간표 메인페이지 - 강의 목록");
		
		List list = timeTableService.list();
		
		model.addAttribute("lectureList",list);
		
		String id= (String) session.getAttribute("email");
		List mylist = timeTableService.myList(id);
		
		model.addAttribute("myList", mylist);
		
	}
	
	
	@RequestMapping(value="/timetable/containmylist", method=RequestMethod.POST)
	public String viewMylist(Model model, @RequestParam("names") String names, HttpSession session) {
		
		String id= (String) session.getAttribute("email");
		
		TempTable temp = new TempTable();
		TimeTable timeTable = new TimeTable();
		
		temp.setUser_email(id);

		
		String[] nameList = names.split(",");
		int insertList[] = new int[nameList.length];
		for(int i=0; i<nameList.length; i++) {
			insertList[i] = Integer.parseInt(nameList[i]);	
			temp.setLecture_code(insertList[i]);
			
			timeTable = timeTableService.getTableByTemp(temp);
			temp.setStart_time(timeTable.getStart_time());
			temp.setLecture_day(timeTable.getLecture_day());
			
			
			if(timeTableService.checkLecture(temp)) {
				timeTableService.myListInsert(temp);
				
				List mylist = timeTableService.myList(id);
				model.addAttribute("myList", mylist);
				
				session.setAttribute("lectureCheck", true);
			}
			
			if(!(timeTableService.checkLecture(temp))) {
				
				session.setAttribute("lectureCheck", false);
			}
			
			
		}

		
		return "redirect:/timetable/lecturelist";
	}
	
	
	@RequestMapping(value="/timetable/deletemylist", method=RequestMethod.POST)
	public String deleteMylist(Model model, @RequestParam("names") String names, HttpSession session) {
		
		String id= (String) session.getAttribute("email");
		
		TempTable temp = new TempTable();
		
		temp.setUser_email(id);

		String[] nameList = names.split(",");
		int deleteList[] = new int[nameList.length];
		for(int i=0; i<nameList.length; i++) {
			deleteList[i] = Integer.parseInt(nameList[i]);
			temp.setLecture_code(deleteList[i]);
			timeTableService.myListDelete(temp);
		}
		
		
		return "redirect:/timetable/lecturelist";
	}
	
	@RequestMapping(value="/timetable/recommend", method=RequestMethod.GET)
	public void recommend(Model model, HttpSession session) {
		
		String id= (String) session.getAttribute("email");
		Member mem = new Member();
		mem.setEmail(id);
		mem = memberService.getLoginMember(mem);
		model.addAttribute("nick", mem.getNickname());
		
		List mylist = timeTableService.myList(id);
		model.addAttribute("myList", mylist);
		
		
		
	}
	
	@RequestMapping(value="/timetable/recommend", method=RequestMethod.POST)
	public void recommendLec(Model model, HttpSession session, HttpServletRequest req
			, @RequestParam("timepriority") String timepriority
			, @RequestParam("classNum") int classNum
			) {
		
		String id= (String) session.getAttribute("email");
		List mylist = timeTableService.myList(id);
		model.addAttribute("myList", mylist);
		
		List recommendList = timeTableService.recommendList(req);
		model.addAttribute("recommendList", recommendList);
		
	}
	
	
	@RequestMapping(value="/timetable/showtable/recommendation/recommendlist", method=RequestMethod.GET)
	public void recommendList(Model model, HttpSession session, HttpServletRequest req
			, @RequestParam("timepriority") String timepriority
			, @RequestParam("classNum") int classNum
			) {
		
		String id= (String) session.getAttribute("email");
		List mylist = timeTableService.myList(id);
		model.addAttribute("myList", mylist);
		
		List recommendList = timeTableService.recommendList(req);
		model.addAttribute("recommendList", recommendList);
		
	}
	
	@RequestMapping(value="/timetable/showtable/recommendation/recommendlist", method=RequestMethod.POST)
	public String insertMytable(HttpSession session) {

		String id= (String) session.getAttribute("email");

		timeTableService.setMytable(id);
		
		
		return "redirect:/timetable/recommend";
	}

	
}
