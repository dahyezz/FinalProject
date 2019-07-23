package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.UsedDao;
import web.dto.UsedBoard;
import web.dto.UsedImage;
import web.service.face.UsedService;
import web.util.Paging;

@Service
public class UsedServiceImpl implements UsedService {
	
	@Autowired UsedDao usedDao;
	
	// Paging 
	@Override
	public Paging getPage(int curPage) {
		
		int totalCount = usedDao.selectCntAll();
		
		int listCount = 10;
		Paging paging = new Paging(totalCount, curPage, listCount);
		
		return paging;
	}
	
	// 게시글 리스트 ('/used/list')
	@Override
	public List<UsedBoard> list(Paging paging) {
		return usedDao.selectAll(paging);
	}
	
	
	// 게시글 상세보기 ('used/view')
	@Override
	public UsedBoard view(int boardno) {
		usedDao.updateHit(boardno);
		
		return usedDao.selectBoardByBoardno(boardno);
	}
	
	
	// 게시글 작성하기 ('used/write')
	@Override
	public void write(
			UsedBoard usedboard,
			MultipartFile img,
			ServletContext context
		) {
		
		
		// 게시글 시퀀스 번호 조회
		int boardno = usedDao.selectBoardno();
		
		
		// 게시글 작성
		if(usedboard!=null) {
			// 게시판 db에 boardno 저장 
			usedboard.setBoardno(boardno);
			
			if((usedboard.getTitle()==null)
				|| "".equals(usedboard.getTitle())) {
				usedboard.setTitle("(제목없음)");
			}
			
			usedDao.write(usedboard);
		}
		

		// 파일이 저장될 경로
		String storedPath = context.getRealPath("usedboard_Images");
		
		
		/*
		 *  UUID 생성
		 *  UUID 생성해서 4자릿 수마다 '-' 삽입.
		 */
		String uuid = UUID.randomUUID().toString().split("-")[4];
		
		
		// 저장된 파일의 이름 (originName + UUID)
		String filename = img.getOriginalFilename() +"-"+uuid;
		
		
		// 저장될 파일 객체 
		File dest = new File(storedPath, filename);
		
		
		// 파일 저장
		try {
			img.transferTo(dest);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		// 업로드 정보 DB에 저장
		UsedImage usedImg = new UsedImage();
		
		usedImg.setOriginName(img.getOriginalFilename());
		
		usedImg.setStoredName(filename);
		usedImg.setImgSize((int)img.getSize());
		
		// img업로드(db 삽입)
		if((usedImg.getOriginName()!=null)
			&& !"".equals(usedImg.getOriginName())) {
				usedImg.setBoardno(boardno);
				usedDao.insertImg(usedImg);
		}
		
	}

	@Override
	public UsedImage viewImg(int boardno) {
		return usedDao.selectImgByBoardno(boardno);
	}

	@Override
	public UsedImage getImg(int usedImgNo) {
		return usedDao.selectImgByImgno(usedImgNo);
	}
}
