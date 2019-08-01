package web.service.face;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.UsedBoard;
import web.dto.UsedImage;
import web.dto.UsedComment;
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
			UsedBoard usedboard,
			String images
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
	public UsedBoard view(int boardno);

	
	/**
	 *  조회수 증가시키기 
	 * @param boardno
	 */
	public void hitview(int boardno);
	
	
	/**
	 *  게시글 수정한다.
	 *  @param UsedBoard
	 */
	public void update(UsedBoard usedboard);
	
	
	/**
	 *  게시글을 삭제한다.
	 *  @param UsedBoard
	 */
	public void delete(int boardno);
	
	
	/**
	 *  사진 저장
	 * @param usedimg
	 * @param img
	 * @param context
	 * @return
	 */
	public UsedImage storeImg(
			UsedImage usedimg,
			MultipartFile img,
			ServletContext context);
	
	/**
	 *  사진 조회 
	 * @param usedimg
	 * @return
	 */
	public UsedImage getImg(UsedImage usedimg);
	
	/**
	 * 
	 * @param usedimg
	 * @param context
	 * @return
	 */
	public File findImg(
			UsedImage usedimg,
			ServletContext context
			);
	
	
	/**
	 *  게시판에 댓글을 입력한다.
	 *  @param UsedComment
	 */
	public void writeCmt(UsedComment usedcmt);
	
	/**
	 *  게시글 번호를 통해 댓글을 가져온다.
	 *  @param UsedComment
	 *  @return 
	 */
	public List<UsedComment> getCmt(int boardno);
	
	
	/**
	 *  댓글 객체에서 게시글 번호 가져오기
	 * @param usedComment
	 * @return
	 */
	public UsedComment getBoardno(UsedComment usedComment);
	
	/**
	 * 댓글 삭제하기 
	 * @param usedComment
	 */
	public void deleteCmt(UsedComment usedComment);
	
	/**
	 *  댓글 수정하기 
	 * @param usedComment
	 */
	public void updateCmt(UsedComment usedComment);
	
}
