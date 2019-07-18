package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
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
		

		// STEP1. 게시글 당 하나의 사진만 첨부한다고 가정하고 boardno 알아오기
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
	public TastyFile load(int fileno) {
		return tastyBoardDao.selectFileByFileno(fileno);
	}
	
	@Override
	public Resource loadAsResource(String storedName) {
		
		Path rootLocation;
		
		if(storedName.toCharArray()[0] == '/') {
			storedName = storedName.substring(1);
		}
		
//		Path file = r
		
		return null;
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
}
