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
	 *  @return List<UsedBoard> : 전체 조회 결과 반환
	 */
	public List<UsedBoard> selectAll(Paging paging);
	
	/*
	 *  조회수 기능 
	 *  
	 *  @param UsedBoard
	 */
	public void updateHit(UsedBoard usedBoard);
	
	/*
	 *  게시글 조회하기 
	 *  
	 *  @param usedBoard : 조회할 게시글 번호
	 *  @return UsedBoard : 조회된 게시글 정보 반환
	 */
	public UsedBoard selectBoardByBoardno(UsedBoard usedBoard);
	
}
