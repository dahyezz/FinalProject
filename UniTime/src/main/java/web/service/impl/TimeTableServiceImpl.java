package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dao.face.TimeTableDao;
import web.dto.Member;
import web.dto.TempTable;
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
		String id = (String)session.getAttribute("email");
		
		List mylist = timeTableDao.recommendTmp(id);
		

		
		
//		Member mem = new Member();
//		mem.setEmail(id);
//		mem = memberDao.selectMemberByEmail(mem);
		
//		List mylist = timeTableDao.selectMyList(id);
//		
//		//"+ mem.getDepartmentCode() +"
		String lec = "department_name in ('정보통신공학과','공통')";
//		for(int i=0;i<mylist.size();i++) {
//			lec += "and (lecture_day not in"+ mylist.get(7)
//					+" or start_time not in"+ mylist.get(8)+ ")";
//		}
//		
//		//오전/오후 선택사항
//		lec += "and start_time "+(String)req.getParameter("timepriority")
//				+"ORDER BY DBMS_RANDOM.VALUE";
//		
//		//추가할 강의 선택사항
//		lec += ") WHERE ROWNUM <= "+ (String)req.getParameter("classNum");
//		
//		//lec 출력 테스트 
//		System.out.println(lec);
		
		return timeTableDao.recommend(lec);
	}

}
