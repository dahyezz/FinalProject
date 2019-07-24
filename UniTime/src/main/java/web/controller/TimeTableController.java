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

import web.dto.TempTable;
import web.service.face.TimeTableService;

@Controller
public class TimeTableController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	
	@Autowired TimeTableService timeTableService;
	
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
		
		System.out.println(names);
		String id= (String) session.getAttribute("email");
		
		TempTable temp = new TempTable();
		
		temp.setUser_email(id);
		temp.setLecture_code(Integer.parseInt(names));
		
		timeTableService.myListInsert(temp);
		List mylist = timeTableService.myList(id);
	
		
		model.addAttribute("myList", mylist);
		
		
		return "redirect:/timetable/lecturelist";
	}
	
	
	@RequestMapping(value="/timetable/deletemylist", method=RequestMethod.POST)
	public String deleteMylist(Model model, @RequestParam("names") String names, HttpSession session) {
		
		System.out.println(names);
		String id= (String) session.getAttribute("email");
		
		TempTable temp = new TempTable();
		
		temp.setUser_email(id);
		temp.setLecture_code(Integer.parseInt(names));
		
		timeTableService.myListDelete(temp);
		List mylist = timeTableService.myList(id);
	
		model.addAttribute("myList", mylist);
		
		
		return "redirect:/timetable/lecturelist";
	}
	
	@RequestMapping(value="/timetable/recommend", method=RequestMethod.GET)
	public void recommend(Model model, HttpSession session) {
		
		String id= (String) session.getAttribute("email");
		List mylist = timeTableService.myList(id);
		model.addAttribute("myList", mylist);
		
	}
	
	@RequestMapping(value="/timetable/recommendlist", method=RequestMethod.GET)
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
	
}
