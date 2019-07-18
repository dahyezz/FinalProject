package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UsedDao;
import web.dto.UsedBoard;
import web.service.face.UsedService;
import web.util.Paging;

@Service
public class UsedServiceImpl implements UsedService {
	
	@Autowired UsedDao usedDao;
	
	// Paging 
	@Override
	public Paging getPage(int curPage) {
		
		int totalCount = usedDao.selectCntAll();
		
		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		return paging;
	}
	
	// 게시글 리스트 ('/used/list')
	@Override
	public List<UsedBoard> list(Paging paging) {
		return usedDao.selectAll(paging);
	}
	
	// 게시글 상세보기 ('used/view')
	@Override
	public UsedBoard view(UsedBoard usedBoard) {
		usedDao.updateHit(usedBoard);
		
		return usedDao.selectBoardByBoardno(usedBoard);
	}
	
	// 게시글 작성하기 ('used/write')
	@Override
	public void write(
			UsedBoard usedBoard,
			HttpSession session
			) {
		String writer = (String)session.getAttribute("writer");
	
		usedBoard.setWriter(writer);
		
		usedDao.write(usedBoard);
	}
}
