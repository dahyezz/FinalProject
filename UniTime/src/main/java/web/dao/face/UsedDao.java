package web.dao.face;

import java.util.List;

import web.dto.UsedBoard;
import web.util.Paging;

public interface UsedDao {
	
	/*
	 *  총 게시글 수 가져오기 
	 *  
	 *  @return int : 총 게시글 수
	 */
	public int selectCntAll();
	
	/*
	 *  전체 게시글 불러오기 
	 *  
	 *  @param paging : 페이징 객체 
	 *  @return List<UsedBoard> : 전체 조회 결과 
	 */
	public List<UsedBoard> selectAll(Paging paging);
	
}
