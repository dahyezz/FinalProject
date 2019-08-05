package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired MainDao mainDao;
	
	@Override
	public List freeboardNotice() {

		return mainDao.freeboardNotice();
	}
	
	@Override
	public List freeboard() {

		return mainDao.freeboard();
	}
	
	@Override
	public List tastyBoard() {
 
		return mainDao.tastyBoard();
	}
	
	@Override
	public List usedBoard() {

		return mainDao.usedBoard();
	}

}
