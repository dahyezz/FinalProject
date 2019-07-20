package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.TastyBoardDao;
import web.dto.TastyBoard;
import web.dto.TastyComment;
import web.dto.TastyFile;
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
		
		// 사진을 첨부하지 않고 게시글 작성시 boardno 설정
		if(tastyBoard.getBoardno()==0)
			tastyBoard.setBoardno(tastyBoardDao.selectBoardno());
		
		tastyBoardDao.insertBoard(tastyBoard);
	}
	
	@Override
	public void delete(TastyBoard tastyBoard) {
		
		tastyBoardDao.deleteCommentByBoardno(tastyBoard);
		tastyBoardDao.deleteFileByboardno(tastyBoard);
		tastyBoardDao.deleteBoardByBoardno(tastyBoard);
	}
	
	@Override
	public void update(TastyBoard tastyBoard) {
		tastyBoardDao.updateBoard(tastyBoard);
	}
	
	@Override
	public TastyFile uploadFile(TastyBoard tastyBoard, MultipartFile fileupload, ServletContext context) {
		
//		String url = "http://localhost:8088/tastyUpload/";
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("tastyUpload");
		
		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름(원본이름 + UUID)
		String name = fileupload.getOriginalFilename()+"_"+uId;
//		url += name;
		
		//저장될 파일 객체
		File dest = new File(storedPath, name);
		
		try {
			fileupload.transferTo(dest); //실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int boardno = 0;
		
		if(tastyBoard.getBoardno()==0) {
			boardno = tastyBoardDao.selectBoardno();
		} else {
			boardno = tastyBoard.getBoardno();
		}
		
		//DB에 저장(업로드 정보 기록)
		TastyFile tastyfile = new TastyFile();
		tastyfile.setBoardno(boardno);
		tastyfile.setOriginName(fileupload.getOriginalFilename());
		tastyfile.setStoredName(name);
		tastyfile.setFilesize((int)fileupload.getSize());
		
		tastyBoardDao.insertFile(tastyfile);
		
		return tastyfile;
	}
	
		
	@Override
	public List<TastyComment> getComment(TastyBoard tastyBoard) {
		return tastyBoardDao.selectAllCommentByBoardno(tastyBoard);
	}
	
	@Override
	public void writeComment(TastyComment tastyComment) {
		tastyBoardDao.insertComment(tastyComment);
	}
	
	@Override
	public void deleteComment(TastyComment tastyComment) {
		tastyBoardDao.deleteComment(tastyComment);
	}
	
	@Override
	public TastyComment getBoardno(TastyComment tastyComment) {
		return tastyBoardDao.selectBoardnoByCommentno(tastyComment);
	}
	
	@Override
	public TastyFile getFile(TastyFile tastyfile) {
		return tastyBoardDao.selectFileByFileno(tastyfile.getFileno());
	}
	
	@Override
	public TastyComment getComment(TastyComment tastyComment) {
		return tastyBoardDao.selectBoardnoByCommentno(tastyComment);
	}
}
