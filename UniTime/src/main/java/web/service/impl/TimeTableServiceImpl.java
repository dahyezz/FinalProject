package web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dao.face.TimeTableDao;
import web.dto.TastyBoard;
import web.dto.TempTable;
import web.dto.TimeTable;
import web.service.face.TimeTableService;

@Service
public class TimeTableServiceImpl implements TimeTableService {

	@Autowired TimeTableDao timeTableDao;
	@Autowired MemberDao memberDao;
	
	@Override
	public List list() {
		return timeTableDao.selectAll();
	}

	@Override
	public void myListInsert(TempTable temp) {
		timeTableDao.insertMyList(temp);
	}
	
	

	@Override
	public void myListDelete(TempTable temp) {
		timeTableDao.deleteMyList(temp);
	}

	@Override
	public List myList(String id) {
		
		return timeTableDao.selectMyList(id);
	}

	@Override
	public List recommendList(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Map<String,String> map = new HashMap<String, String>();
		
		
		map.put("stime", req.getParameter("timepriority"));
		map.put("etime", Integer.toString(Integer.parseInt(req.getParameter("timepriority"))+3));
		map.put("classNum", req.getParameter("classNum"));
		map.put("id",(String)session.getAttribute("email"));
		
		List reclist = timeTableDao.recommendTmp(map);
		
		return reclist;
	}

	@Override
	public boolean checkLecture(TempTable temp) {
		
		boolean check = true;
		if(timeTableDao.lectureCheck(temp)==0) {
			check=true;
		}
		else {
			check=false;
		}
		
		return check;
	}

	@Override
	public TimeTable getTableByTemp(TempTable temp) {
		return timeTableDao.getTableByTemp(temp);
	}


}
