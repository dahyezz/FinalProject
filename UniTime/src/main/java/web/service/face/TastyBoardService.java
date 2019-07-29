package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.BadReport;
import web.dto.TastyBoard;
import web.dto.TastyComment;
import web.dto.TastyFile;
import web.util.Paging;

public interface TastyBoardService {

	/**
	 * 현재페이지와 총 게시글 수, listCount로 페이징 객체 만들기
	 * 
	 * @param curPage - 현재페이지
	 * @return Paging - 페이징 정보가 담긴 페이징 객체
	 */
	public Paging getcurPage(int curPage);

	/**
	 * 전체 게시글 목록 불러오기
	 * 
	 * @param paging - 페이징 객체
	 * @return List<TastyBoard> - 전체 글 리스트
	 */
	public List<TastyBoard> list(Paging paging);

	/**
	 * 게시글 조회하기
	 * 
	 * @param tastyBoard - 조회할 게시글의 게시글번호
	 * @return TastyBoard - 조회된 게시글 객체
	 */
	public TastyBoard getBoard(TastyBoard tastyBoard);

	/**
	 * 게시글 작성하기
	 * 
	 * @param tastyBoard - 작성할 게시글 객체
	 */
	public void write(TastyBoard tastyBoard);

	/**
	 * 게시글 삭제하기
	 * 
	 * @param tastyBoard - 삭제할 게시글 객체
	 */
	public void delete(TastyBoard tastyBoard);

	/**
	 * 게시글 수정하기
	 * 
	 * @param tastyBoard - 수정할 게시글 객체
	 */
	public void update(TastyBoard tastyBoard);

	public TastyFile uploadFile(TastyBoard tastyBoard, MultipartFile fileupload, ServletContext context);

	/**
	 * 댓글 불러오기
	 * 
	 * @param tastyBoard - 해당 게시글 번호
	 * @return List<TastyComment> - 댓글 리스트
	 */
	public List<TastyComment> getComment(TastyBoard tastyBoard);

	/**
	 * 댓글 쓰기
	 * 
	 * @param tastyComment - 작성한 댓글 내용
	 */
	public void writeComment(TastyComment tastyComment);

	/**
	 * 댓글 삭제하기
	 * 
	 * @param tastyComment - 삭제할 댓글 객체
	 */
	public void deleteComment(TastyComment tastyComment);

	public TastyComment getBoardno(TastyComment tastyComment);

	public TastyFile getFile(TastyFile tastyfile);

	/**
	 * 댓글번호로 댓글 조회하기
	 * 
	 * @param tastyComment
	 * @return
	 */
	public TastyComment getComment(TastyComment tastyComment);

	/**
	 * 체크 삭제하기
	 * 
	 * @param names - 삭제할 게시글 번호
	 */
	public void deleteList(String names);

	/**
	 * 댓글 수정
	 * 
	 * @param tastyComment - 수정할 댓글 정보(commentno, content)
	 */
	public void updateComment(TastyComment tastyComment);

	/**
	 * 게시글 신고
	 * 
	 * @param badReport - 게시글 번호,작성자 이름
	 * @return  ture- 신고완료, false-신고취소
	 */
	public boolean declareBoard(BadReport badReport);

	/**
	 * 게시글 수정할 때 사진 지우면 DB에서 삭제되도록 함
	 * 
	 * @param file
	 */
	public void deleteImage(TastyFile file);

	/**
	 * 신고된적이 있는지 체크
	 * 
	 * @param badReport 
	 * @return
	 */
	public boolean checkReclare(BadReport badReport);

}
