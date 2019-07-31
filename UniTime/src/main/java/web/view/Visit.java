package web.view;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import web.dao.face.AdminDao;

public class Visit implements HttpSessionListener{
	
	@Autowired AdminDao adminDao;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		adminDao.visitInsert();
		
		// 전체 방문자 수
		int totalCount = adminDao.visitCntAll();
		
		// 오늘 방문자 수
        int todayCount = adminDao.visitCnt();
         
        HttpSession session = se.getSession();
         
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
