package web.service.face;

import java.util.List;

import web.dto.UsedBoard;
import web.util.Paging;

public interface UsedService {

	
	/*
	 *  현재 페이지와 총 게시글 수
	 *  listCount로 Paging 객체 생성
	 *  
	 *  @param curPage : 현재 페이지 
	 *  @return Paging : 페이징 객체 
	 */
	public Paging getPage(int curPage);
	
	/*
	 *  전체 게시글 목록 불러오기 
	 *  
	 *  @param Paging : 페이징 객체 
	 *  @return List<UsedBoard> : 전체 글 List
	 */
	public List<UsedBoard> list(Paging paging);
}
