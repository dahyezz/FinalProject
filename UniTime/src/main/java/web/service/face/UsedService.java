package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.UsedBoard;
import web.dto.UsedImage;
import web.util.Paging;

public interface UsedService {

	/**
	 *  현재 페이지와 총 게시글 수
	 *  listCount로 Paging 객체 생성
	 *  
	 *  @param curPage : 현재 페이지 
	 *  @return Paging : 페이징 객체 
	 */
	public Paging getPage(
			int curPage
		);
	
	/**
	 *  전체 게시글 목록 불러오기 
	 *  
	 *  @param Paging : 페이징 객체 
	 *  @return List<UsedBoard> : 전체 글 List
	 */
	public List<UsedBoard> list(
			Paging paging
		);
	
	
	/**
	 * 게시글 작성하기 
	 * 
	 * @param usedBoard : 작성할 게시글
	 * @return usedBoard : 반환할 게시글 
	 */
	public void write(
			UsedBoard usedboard,String images
		);
	
	/**
	 *  게시글 속 이미지 저장하기 
	 */
	public UsedImage uploadFile(
			UsedBoard usedboard, 
			MultipartFile fileupload,
			ServletContext context
		);
	
	/**
	 *  게시글 조회하기 
	 *  
	 *  @param usedBoard : 조회할 게시글의 게시글번호 
	 *  @return UsedBoard : 조회된 게시글 객체 
	 */
	public UsedBoard view(
			int boardno
		);
	
	/**
	 *  게시글 이미지 가져오기 
	 */
	public UsedImage getImg(UsedImage usedimg);
	

//	/**
//	 *  게시글 번호로 첨부파일 조회 
//	 *  
//	 *  @param boardno : 게시글 번호
//	 *  @return UsedFile : 조회된 파일 정보
//	 */
//	public UsedImage viewImg(int boardno);
//	
//	
//	/**
//	 *  파일번호로 파일정보를 조회한다 
//	 *  
//	 *  @param fileno : 조회대상 파일번호 
//	 *  @return UsedFile : 조회된 파일의 정보
//	 */
//	public UsedImage getImg(UsedImage usedImg);
	
	
	/**
	 *  게시글 수정한다.
	 *  @param UsedBoard
	 */
	public void update(UsedBoard usedboard);
	
}
