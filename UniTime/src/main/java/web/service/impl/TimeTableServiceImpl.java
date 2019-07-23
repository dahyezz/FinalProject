package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TimeTableDao;
import web.dto.TempTable;
import web.service.face.TimeTableService;

@Service
public class TimeTableServiceImpl implements TimeTableService {

	@Autowired TimeTableDao timeTableDao;
	
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
		String id = (String)session.getAttribute("email");
		List mylist = timeTableDao.selectMyList(id);
		
		String lec = "department_name in ('"+ mylist.get(3) +"','공통')";
		for(int i=0;i<mylist.size();i++) {
			lec += "and (lecture_day not in"+ mylist.get(7)
					+" or start_time not in"+ mylist.get(8)+ ")";
		}
		
		lec += "and start_time "+(String)req.getParameter("timepriority")
				+"ORDER BY DBMS_RANDOM.VALUE";
		
		//lec 출력 테스트 
		System.out.println(lec);
		
		return timeTableDao.recommend(lec);
	}

}
