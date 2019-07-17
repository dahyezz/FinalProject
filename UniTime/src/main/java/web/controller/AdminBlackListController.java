package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.face.AdminBlackListDao;

@Controller
public class AdminBlackListController {
	
	@Autowired AdminBlackListDao adminBlackListDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/admin/blacklist", method = RequestMethod.GET)
	public void blackList() {
		
	}
	

}
