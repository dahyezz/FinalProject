package web.dao.face;

import java.util.List;

import web.dto.UsedBoard;
import web.dto.UsedImage;
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
	 *  게시글 조회하기 
	 *  
	 *  @param usedBoard : 조회할 게시글 번호
	 *  @return usedBoard : 조회된 게시글 정보 반환
	 */
	public UsedBoard selectBoardByBoardno(int boardno);
	
	/*
	 *  조회수 기능 
	 *  
	 *  @param UsedBoard
	 */
	public void updateHit(int boardno);
	
	
	/*
	 *  새 게시글의 번호 조회 
	 *  @return int
	 */
	public int selectBoardno();
	
	/*
	 * 게시글 작성하기 
	 * 
	 * @param usedBoard : 작성할 게시글
	 * @return usedBoard : 반환할 게시글 
	 */
	public void write(UsedBoard usedBoard);
	
	
	/*
	 *  이미지 추가
	 *  @param UsedImage
	 */
	public void insertImg(UsedImage usedImage);
	
	/*
	 * 게시글의 파일 조회 
	 *
	 * @param boardno : 게시글 번호
	 * @return usedImgNo : 조회된 이미지 정보 객체
	 */
	public UsedImage selectImgByBoardno(int boardno);
	
	/*
	 *  파일번호를 이용하여 이미지 정보 조회
	 *  
	 *  @param usedImgNo : 조회할 이미지 번호
	 *  @return UsedImg : 조회된 파일 정보 객체
	 */
	public UsedImage selectImgByImgno(int usedImgNo);
}
