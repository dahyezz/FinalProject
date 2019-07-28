package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	// 테스트 코드 위한 Logger 객체 생성 
	private static final Logger logger
	= LoggerFactory.getLogger(UsedServiceImpl.class);
	
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
	
	
	// 게시글 작성하기 ('used/write')
	@Override
	public void write(
			UsedBoard usedboard,String images
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
			logger.info(""+usedboard.getBoardno());
			if(images != null && !"".equals(images)) {
				Map<String,Object> map = new HashMap<String,Object>();
//				map.put("images", images);
				String[] imagelist = images.split(",");
				map.put("images", imagelist);
				map.put("boardno",usedboard.getBoardno());
				usedDao.updateImgno(map);
			}
		}
		
	}

//	@Override
//	public UsedImage viewImg(int boardno) {
//		return usedDao.selectImgByBoardno(boardno);
//	}
//
//	@Override
//	public UsedImage getImg(int usedImgNo) {
//		return usedDao.selectImgByImgno(usedImgNo);
//	}


	@Override
	public UsedImage uploadFile(
			UsedBoard usedboard, 
			MultipartFile img, 
			ServletContext context
		) {

		// 파일이 저장될 경로
		String storedPath = context.getRealPath("usedUpload");
		
		
		/*
		 *  UUID 생성
		 *  UUID 생성해서 4자릿 수마다 '-' 삽입.
		 */
		String uuid = UUID.randomUUID().toString().split("-")[4];
		
		
		// 저장된 파일의 이름 (originName + UUID)
		String filename = img.getOriginalFilename() +"-"+uuid;
		
		
		// 저장될 파일 객체 
		File dest = new File(storedPath, filename);
		
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
		
		
		logger.info("*********************************");
		logger.info(usedImg.toString());
		
		usedDao.insertImg(usedImg);
	

		return usedImg;
	}
	
	
	// 게시글 상세보기 ('used/view')
	@Override
	public UsedBoard view(int boardno) {
		usedDao.updateHit(boardno);
		
		return usedDao.selectBoardByBoardno(boardno);
	}
	

	@Override
	public UsedImage getImg(UsedImage usedimg) {
		return usedDao.selectImgByImgno(usedimg.getUsedImgNo());
	}
	
	
	@Override
	public void update(UsedBoard usedboard) {
		// 게시글 수정
		usedDao.update(usedboard);
	}
	

	@Override
	public void delete(UsedBoard usedboard) {
		// 게시글 삭제 
		usedDao.deleteBoardByBoardno(usedboard);
		
	}
}
