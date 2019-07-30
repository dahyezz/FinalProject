package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.FreeBoardDao;
import web.dto.BadReport;
import web.dto.FreeBoard;
import web.dto.FreeBoardNotice;
import web.dto.FreeFile;
import web.dto.TastyBoard;
import web.dto.TastyFile;
import web.service.face.FreeBoardService;
import web.dto.FreeComment;
import web.util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired FreeBoardDao freeBoardDao;

	@Override
	public List list(Paging paging) {
		
		return freeBoardDao.selectAll(paging);
	}
	
	@Override
	public Paging getCurPage(HttpServletRequest req) {
		
		//전달 파라미터 curPage 파싱
		String param=req.getParameter("curPage");
		int curPage=0;
		if(param!=null && !"".equals(param)) {
			curPage=Integer.parseInt(param);
		}
		
		//검색 파라미터 파싱
		String searchType=req.getParameter("searchType");
		String keyword=req.getParameter("keyword");
		
		//페이징 객체 생성
		Paging paging = new Paging();
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		
		//전체/검색된 게시글 수
		int totalCount=freeBoardDao.selectCntAll(paging);
		
		//새로운 메소드의 페이징 객체 생성
		paging=new Paging(totalCount,curPage);
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		
		return paging;
	}

	@Override
	public FreeBoard view(int boardno) {
		
		freeBoardDao.updateHit(boardno);
		
		return freeBoardDao.selectBoardByBoardno(boardno);
	}
	
	@Override
	public void write(FreeBoard freeBoard, MultipartFile file, ServletContext context) {
		
		//파일이 저장될 경로
		String storedPath=context.getRealPath("freeUpload");
		
		//UUID
		String uId=UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름(원본 이름 + UUID)
		String name=file.getOriginalFilename()+"_"+uId;
		
		//저장될 파일 객체
		File dest=new File(storedPath,name);
		
		//파일 저장
		try {
			file.transferTo(dest);	//실제 저장
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//게시글 시퀀스 번호 조회
		int boardno=freeBoardDao.selectBoardno();
		
		//게시글 작성(데이터베이스 삽입)
		if(freeBoard!=null) {
			freeBoard.setBoardno(boardno);
			
			if(freeBoard.getTitle()==null || "".equals(freeBoard.getTitle())) {
				freeBoard.setTitle("(제목없음)");
			}
			
			freeBoardDao.insertBoard(freeBoard);
		}
		
		//DB에 저장(업로드 정보 기록)
		FreeFile freeFile=new FreeFile();
		freeFile.setOriginname(file.getOriginalFilename());
		System.out.println("원본 이름 : "+freeFile.getOriginname());
		
		freeFile.setStoredname(name);
		freeFile.setFilesize((int)file.getSize());
		
		//파일 업로드(데이터 베이스 삽입)
		if(freeFile.getOriginname() != null && !"".equals(freeFile.getOriginname())) {
			freeFile.setBoardno(boardno);
			freeBoardDao.insertFile(freeFile);
		}
	}
	
	@Override
	public FreeFile uploadImage(FreeBoard freeBoard, MultipartFile fileupload, ServletContext context) {
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("freeUpload");
		
		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일의 이름(원본이름 + UUID)
		String name = fileupload.getOriginalFilename()+"_"+uId;
		
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
		
		if(freeBoard.getBoardno()!=0)
			boardno = freeBoard.getBoardno();
		
		//DB에 저장(업로드 정보 기록)
		FreeFile freeFile = new FreeFile();
		freeFile.setBoardno(boardno);
		freeFile.setOriginname(fileupload.getOriginalFilename());
		freeFile.setStoredname(name);
		freeFile.setFilesize((int)fileupload.getSize());
		
		freeBoardDao.insertFile(freeFile);
		
		return freeFile;
	}

	@Override
	public void update(FreeBoard freeBoard) {
		
		//게시글 수정
		freeBoardDao.updateBoard(freeBoard);
	}
	
	@Override
	public void delete(int boardno) {
		
		//게시글의 파일첨부 삭제
		freeBoardDao.deleteFileByBoardno(boardno);
		
		//게시글의 댓글 삭제
		freeBoardDao.deleteCommentByBoardno(boardno);
		
		//게시글 삭제		
		freeBoardDao.deleteBoard(boardno);
	}

	@Override
	public FreeFile viewFile(int boardno) {
		
		return freeBoardDao.selectFileByBoardno(boardno);
	}

	@Override
	public FreeFile getFile(int fileno) {
		
		return freeBoardDao.selectFileByFileno(fileno);
	}
	
	@Override
	public List<FreeComment> commentList(int boardno) {
		return freeBoardDao.selectCommentByBoardno(boardno);
	}

	@Override
	public void commentWrite(FreeComment freeComment) {
		
		freeBoardDao.insertComment(freeComment);		
	}

	@Override
	public void commentDelete(int commentno) {
		
		freeBoardDao.deleteComment(commentno);		
	}
	
	@Override
	public List noticeList() {
		
		return freeBoardDao.selectNoticeAll();
	}
	
	@Override
	public FreeBoardNotice viewNotice(int boardno) {
		
		freeBoardDao.updateNoticeHit(boardno);
		
		return freeBoardDao.selectNoticeByBoardno(boardno);
	}
	
	@Override
	public void writeNotice(FreeBoardNotice freeBoardNotice) {
		
		freeBoardDao.insertNoticeBoard(freeBoardNotice);
	}

	@Override
	public void updateNotice(FreeBoardNotice freeBoardNotice) {
		
		//게시글 수정
		freeBoardDao.updateNoticeBoard(freeBoardNotice);
	}
	
	@Override
	public void deleteNotice(int boardno) {
		
		//게시글 삭제		
		freeBoardDao.deleteNoticeBoard(boardno);
	}

	@Override
	public void declare(BadReport badReport) {
		freeBoardDao.insertFreeBoardReport(badReport);
	}
}
