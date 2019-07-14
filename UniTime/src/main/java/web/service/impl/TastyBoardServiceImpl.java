package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TastyBoardDao;
import web.dto.TastyBoard;
import web.service.face.TastyBoardService;
import web.util.Paging;

@Service
public class TastyBoardServiceImpl implements TastyBoardService{

	@Autowired TastyBoardDao tastyBoardDao;
	
	@Override
	public Paging getcurPage(int curPage) {

		int totalCount = tastyBoardDao.selectCntAll();
		int listCount = 9;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		return paging;
	}
	
	@Override
	public List<TastyBoard> list(Paging paging) {
		return tastyBoardDao.selectAll(paging);
	}
	
	@Override
	public TastyBoard getBoard(TastyBoard tastyBoard) {
		tastyBoardDao.updateHit(tastyBoard);
		
		return tastyBoardDao.selectBoardByBoardno(tastyBoard);
	}
	
	@Override
	public void write(TastyBoard tastyBoard) {
		tastyBoardDao.insertBoard(tastyBoard);
	}
	
	@Override
	public void delete(TastyBoard tastyBoard) {
		tastyBoardDao.deleteBoardByBoardno(tastyBoard);
	}
	
	@Override
	public void update(TastyBoard tastyBoard) {
		tastyBoardDao.updateBoard(tastyBoard);
	}
}
