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
import web.dto.BadReport;
import web.dto.UsedBoard;
import web.dto.UsedImage;
import web.dto.UsedComment;
import web.service.face.UsedService;
import web.util.Paging;

@Service
public class UsedServiceImpl implements UsedService {
	
	@Autowired UsedDao usedDao;
	@Autowired ServletContext context;
	
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
	
	
	@Override
	public int getTotal(Paging search) {
		return usedDao.countSearch(search);
	}
	
	@Override
	public List<UsedBoard> getSearchPagingList(Paging search) {
		return usedDao.selectPageSearch(search);
	}
	
	
	// 게시글 작성하기 ('used/write')
	@Override
	public void write(
			UsedBoard usedboard,
			String images
		) {
		usedDao.write(usedboard);
		if(images != null && !"".equals(images)) {
			String[] imglist = images.split(",");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("boardno",usedboard.getBoardno());
			map.put("images",imglist);
			usedDao.updateUsedImg_KG(map);
		}
	}


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
		return usedDao.selectBoardByBoardno(boardno);
	}
	
	@Override
	public void hitview(int boardno) {
		usedDao.updateHit(boardno);
		
	}
	
	
	@Override
	public void update(UsedBoard usedboard) {
		
		// 게시글 수정
		usedDao.update(usedboard);
	}
	

	@Override
	public void delete(int boardno) {
	
		
		//  댓글 삭제
		usedDao.deleteCommentByBoardno(boardno);
		
		// 이미지 삭제 
		List<UsedImage> list = usedDao.selectImgByBoardno(boardno);
	      
	      for(UsedImage i : list) {
	         String fileName = i.getStoredName();
	         String fileDir = context.getRealPath("/usedUpload");
	         File file = new File(fileDir,fileName);
	         if(file.exists()) {file.delete();}
	      };
	      
	      // DB에서 이미지 삭제 
	      usedDao.deleteImgByBoardno(boardno);
		
		// 게시글 삭제
		usedDao.deleteBoardByBoardno(boardno);
	}
	
	
	
	@Override
	public UsedImage storeImg(
			UsedImage usedimg,
			MultipartFile img,
			ServletContext context
			) {
		String storedPath = context.getRealPath("/usedUpload");
		String uuId = UUID.randomUUID().toString().split("-")[4];
		
		// 저장되는 파일의 이름 
		String name = img.getOriginalFilename()+"_"+uuId;
		
		// 저장될 파일 객체 
		File dest = new File(storedPath, name);
		
		// 파일 저장 
		try {
			img.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		UsedImage upimage = new UsedImage();
	
		upimage.setOriginName(img.getOriginalFilename());
		upimage.setStoredName(name);
		upimage.setImgSize((int)img.getSize());
		
		usedDao.insertImg(upimage);
		logger.info(upimage.toString());
		
		return upimage;
	}
	
	@Override
	public UsedImage getImg(UsedImage usedimg) {
		return usedDao.selectImgByImgno(usedimg.getUsedImgNo());
	}
	
	@Override
	public File findImg(
			UsedImage usedimg,
			ServletContext context
			) {
		File file = new File(context.getRealPath("/usedUpload"), usedimg.getStoredName());
		
		return file;
	}
	


	@Override
	public void writeCmt(UsedComment usedcmt) {
		// 작성한 댓글을 DB에 삽입 
		usedDao.insertComment(usedcmt);
		logger.info(usedcmt.toString());
	}

	
	@Override
	public List<UsedComment> getCmt(int boardno) {
		// 게시글 번호로 댓글 조회
		return usedDao.selectAllCommentnoByBoardno(boardno);
	}

	@Override
	public UsedComment getBoardno(UsedComment usedComment) {
		return usedDao.selectBoardByCommentno(usedComment);
	}

	@Override
	public void deleteCmt(UsedComment usedComment) {
		usedDao.deleteComment(usedComment);
		
	}

	@Override
	public void updateCmt(UsedComment usedComment) {
		usedDao.updateComment(usedComment);
	}

	@Override
	public boolean reportBoard(BadReport bad) {
		if(usedDao.selectCntBadReport(bad)!=0) {
			return false;
		} else {
			usedDao.reportByBoard(bad);
			return true;
		}
	}

	@Override
	public boolean checkReport(BadReport bad) {
		if(usedDao.selectCntBadReport(bad)!=0) {
			return true;
		} else {
			return false;
		}
	}
	
}
