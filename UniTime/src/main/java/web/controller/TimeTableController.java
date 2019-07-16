package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.TimeTableService;

@Controller
public class TimeTableController {
	
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	
	@Autowired TimeTableService timeTableService;
	
	@RequestMapping(value="/timetable/lecturelist", method=RequestMethod.GET)
	public void lectureAll(Model model) { 
		logger.info("시간표 메인페이지 - 강의 목록");
		
		List list = timeTableService.list();
		
		model.addAttribute("lectureList",list);
		
	}

	
	@RequestMapping(value="/timetable/recommend", method=RequestMethod.GET)
	public void selectLecture() {
		
	}
	
	@RequestMapping(value="/timetable/recommend", method=RequestMethod.POST)
	public String recommend() {
		
		return "";
	}
	
}
