package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.BadReport;
import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.FreeFile;
import web.dto.TastyBoard;
import web.dto.TastyFile;
import web.dto.FreeComment;
import web.util.Paging;

public interface FreeBoardService {
	
	/**
	 * 	게시글 리스트 조회
	 * @param paging - 조회 대상 페이징 객체
	 * @return List - 게시글을 조회한 결과
	 */
	public List list(Paging paging);
	
	/**
	 * 	요청파라미터에서 curPage를 파싱한다
	 * @param req - 요청 정보 객체
	 * @return Paging - 페이징 계산이 완료된 객체
	 */
	public Paging getCurPage(HttpServletRequest req);
	
	/**
	 * 	조회수 증가, 게시글 조회
	 * @param boardno - 게시글 번호
	 * @return FreeBoard - 게시글 조회한 결과
	 */
	public FreeBoard view(int boardno);

	/**
	 * 	게시글 작성 ,파일 업로드
	 * @param freeBoard - 게시글
	 * @param file - 첨부파일
	 * @param context - 서블릿 컨텍스트
	 */
	public void write(FreeBoard freeBoard, MultipartFile file, ServletContext context);
	
	/**
	 * 	summernote 이미지 업로드
	 * @param freeBoard
	 * @param fileupload
	 * @param context
	 * @return
	 */
	public FreeFile uploadImage(FreeBoard freeBoard, MultipartFile fileupload, ServletContext context);
	
	/**
	 * 	게시글 수정
	 * @param Freeboard
	 */
	public void update(FreeBoard freeBoard);
	
	/**
	 * 	게시글, 첨부파일, 댓글 삭제
	 * @param boardno - 게시글 번호
	 */
	public void delete(int boardno);
	
	/**
	 * 	게시글번호로 첨부파일 조회
	 * @param boardno - 게시글 번호
	 * @return FreeFile - 조회된 파일 정보
	 */
	public FreeFile viewFile(int boardno);
	
	/**
	 * 	파일번호로 파일정보를 조회한다
	 * @param fileno - 조회대상 파일번호
	 * @return FreeFile - 조회된 파일의 정보
	 */
	public FreeFile getFile(int fileno);
	
	/**
	 *	댓글 리스트 조회
	 * @param boardno - 게시글 번호
	 * @return List - 댓글 조회 결과
	 */
	public List<FreeComment> commentList(int boardno);
	
	/**
	 * 	댓글 입력
	 * @param freeComment - 게시글 댓글
	 */
	public void commentWrite(FreeComment freeCommment);
	
	/**
	 * 	댓글 삭제
	 * @param commentno - 게시글의 댓글 번호
	 */
	public void commentDelete(int commentno);
	
	/**
	 * 	공지 게시글 리스트 조회
	 * @return List - 공지게시글을 조회한 결과
	 */
	public List noticeList();
	
	/**
	 * 	공지 게시글 조회, 조회수 증가
	 * @param boardno - 게시글 번호
	 * @return FreeBoardNotice - 공지 게시글 조회한 결과
	 */
	public FreeBoardNotice viewNotice(int boardno);

	/**
	 * 	공지 게시글 작성
	 * @param freeBoardNotice - 게시글
	 */
	public void writeNotice(FreeBoardNotice freeBoardNotice);
	
	/**
	 * 	공지 게시글 수정
	 * @param FreeboardNotice
	 */
	public void updateNotice(FreeBoardNotice freeBoardNotice);
	
	/**
	 * 	공지 게시글 삭제
	 * @param boardno - 게시글 번호
	 */
	public void deleteNotice(int boardno);
	
	/**
	 * 	게시글 신고
	 * @param badReport
	 */
	public void declare(BadReport badReport);

}
