package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.TastyBoardDao;
import web.dto.BadReport;
import web.dto.TastyBoard;
import web.dto.TastyComment;
import web.dto.TastyFile;
import web.service.face.TastyBoardService;
import web.util.Paging;

@Service
public class TastyBoardServiceImpl implements TastyBoardService{

	@Autowired TastyBoardDao tastyBoardDao;
	
	@Override
	public Paging getcurPage(Map<String, Object> map) {

		int totalCount = tastyBoardDao.selectCntAll();
		int curPage = Integer.parseInt(map.get("curPage").toString());
		
		int listCount = 9;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		paging.setSearchType((String) map.get("searchType"));
		paging.setKeyword((String) map.get("keyword"));
		paging.setListSelect((String) map.get("listSelect"));
		
		return paging;
	}
	
	@Override
	public List<TastyBoard> list(Paging paging) {
		
		if(paging.getListSelect()==null || paging.getListSelect().equals(""))
			paging.setListSelect("date");
		
		return tastyBoardDao.selectAll(paging);
	}
	
	@Override
	public TastyBoard getBoard(TastyBoard tastyBoard) {
		tastyBoardDao.updateHit(tastyBoard);
		
		return tastyBoardDao.selectBoardByBoardno(tastyBoard);
	}
	
	@Override
	public TastyBoard getBoardWriter(TastyBoard tastyBoard) {
		return tastyBoardDao.selectBoardByBoardno(tastyBoard);
	}
	
	@Override
	public void write(TastyBoard tastyBoard) {
		
//		if(tastyBoard.getBoardno()==0)
//			tastyBoard.setBoardno(tastyBoardDao.selectBoardno());
		
		tastyBoardDao.insertBoard(tastyBoard);
		
		//tastyfile에 boardno=0 인거 update해주기
		tastyBoardDao.updateBoardnoToFile(tastyBoard);
		
//		TastyBoard test = new TastyBoard();
//		test.setBoardno(0);
//		List<TastyFile> fileList = tastyBoardDao.selectFileByBoardno(test);
//		
//		for(TastyFile f : fileList) {
//			tastyBoardDao.insertTastyfile(f);
////			tastyBoardDao.deleteTemp(f);
//		}

	}
	
	@Override
	public void delete(TastyBoard tastyBoard) {
		
		tastyBoardDao.deleteCommentByBoardno(tastyBoard);
		tastyBoardDao.deleteFileByboardno(tastyBoard);
//		TastyFile file = new TastyFile();
//		file.setBoardno(tastyBoard.getBoardno());

		tastyBoardDao.deleteBoardByBoardno(tastyBoard);
	}
	
	@Override
	public void update(TastyBoard tastyBoard) {
		
//		List<TastyFile> fileList = tastyBoardDao.selectFileByBoardno(tastyBoard);
//		
//		for(TastyFile f : fileList) {
////			tastyBoardDao.insertTastyfile(f);
//			tastyBoardDao.insertFile(f);
//		}
		
		tastyBoardDao.updateBoard(tastyBoard);
	}
	
	@Override
	public TastyFile uploadFile(TastyBoard tastyBoard, MultipartFile fileupload, ServletContext context) {
		
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
		
		if(tastyBoard.getBoardno()!=0)
			boardno = tastyBoard.getBoardno();
		
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
		if(tastyComment.getCommentno()!=0) {
			tastyComment.setRefCommentno(tastyComment.getCommentno());
			tastyComment.setDept(tastyComment.getDept()+1);
			tastyBoardDao.insertComment(tastyComment);
		} else {
			tastyBoardDao.insertComment(tastyComment);
		}
		
	}
	
	@Override
	public int deleteComment(TastyComment tastyComment, String loginUser) {
		
		if(loginUser.equals("admin")) {
			tastyBoardDao.deleteComment(tastyComment);
			return 0;
		}
		
		if(tastyBoardDao.selectCntRecomment(tastyComment) > 0) {
			tastyBoardDao.updateDeletedComment(tastyComment);
			return 1;
			
		} else {
			tastyBoardDao.deleteComment(tastyComment);
			return 0;
		}
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
	
	@Override
	public void deleteList(String names) {
		
		String[] nameList = names.split(",");
		int deleteList[] = new int[nameList.length];
		TastyBoard tastyBoard = new TastyBoard();
		
		for(int i=0; i<nameList.length; i++) {
			deleteList[i] = Integer.parseInt(nameList[i]);
			
			tastyBoard.setBoardno(deleteList[i]);
			
			tastyBoardDao.deleteCommentByBoardno(tastyBoard);
			tastyBoardDao.deleteFileByboardno(tastyBoard);
			tastyBoardDao.deleteBoardByBoardno(tastyBoard);
		}
		
	}
	
	@Override
	public void updateComment(TastyComment tastyComment) {
	
		tastyBoardDao.updateComment(tastyComment);
	}
	
	@Override
	public boolean declareBoard(BadReport badReport) {
		
		if(tastyBoardDao.selectCntBadReport(badReport)>0) {
//			tastyBoardDao.deleteBadByBoard(badReport);
			
			return false;
		}
		else {
			tastyBoardDao.insertBadByBoard(badReport);
			return true;
		}
			
		
	}
	
	@Override
	public void deleteImage(TastyFile file) {
		
		TastyBoard tastyBoard = new TastyBoard();
		tastyBoard.setBoardno(file.getBoardno());
		tastyBoardDao.deleteFileByfileno(file);
	}
	
	@Override
	public boolean checkReclare(BadReport badReport) {
		
		if(tastyBoardDao.selectCntBadReport(badReport)>0)
			return true;
		else
			return false;
	}
}
