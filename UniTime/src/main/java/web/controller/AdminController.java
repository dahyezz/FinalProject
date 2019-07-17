package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.face.AdminMemberService;

@Controller
public class AdminController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public void adminMain() { }
	

	

 
}
