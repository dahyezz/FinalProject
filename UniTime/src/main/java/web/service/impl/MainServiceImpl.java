package web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MainDao;
import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.TastyBoard;
import web.dto.TimeTable;
import web.dto.Unilist;
import web.dto.UsedBoard;
import web.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired MainDao mainDao;
	
	@Override
	public List<FreeBoardNotice> freeboardNotice(Map<String, Object> map) {

		return mainDao.freeboardNotice(map);
	}
	
	@Override
	public List<FreeBoard> freeboard(Map<String, Object> map) {

		return mainDao.freeboard(map);
	}
	
	@Override
	public List<TastyBoard> tastyBoard(Map<String, Object> map) {
 
		return mainDao.tastyBoard(map);
	}
	
	@Override
	public List<UsedBoard> usedBoard(Map<String, Object> map) {

		return mainDao.usedBoard(map);
	}
	
	@Override
	public List<TimeTable> timeTable(String email) {

		return mainDao.timeTable(email);
	}
	
	@Override
	public List<Unilist> getUniList(String keyword) {
		
//		if(keyword == null || keyword.equals("")) {
//			keyword = "";
//		}
		
		return mainDao.selectAllUnilist(keyword);
	}

}
