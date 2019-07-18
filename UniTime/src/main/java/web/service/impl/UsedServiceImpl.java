package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.UsedDao;
import web.dto.UsedBoard;
import web.service.face.UsedService;
import web.util.Paging;

@Service
public class UsedServiceImpl implements UsedService {
	
	@Autowired UsedDao usedDao;
	
	@Override
	public Paging getPage(int curPage) {
		
		int totalCount = usedDao.selectCntAll();
		
		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		return paging;
	}
	
	@Override
	public List<UsedBoard> list(Paging paging) {
		return usedDao.selectAll(paging);
	}
	
	@Override
	public UsedBoard view(UsedBoard usedBoard) {
		usedDao.updateHit(usedBoard);
		
		return usedDao.selectBoardByBoardno(usedBoard);
	}
}
