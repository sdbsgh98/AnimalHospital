package com.vet.main.notice;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManger;
	
	@Value("${app.upload}")
	private String uploadPath;
	
	@Value("${app.notice}")
	private String username; 
	
	public List<NoticeVO> getNoticeList(Pager pager) throws Exception {
		pager.setPerPage(10L); //10개씩
		pager.makeRowNum(); //출력할 row 처음
		Long totalCount = noticeDAO.getTotal(pager); //전체 데이터
		pager.makePageNum(totalCount); //데이터수로 페이지 수
		return noticeDAO.getNoticeList(pager);
	}
	
	public int noticeAdd(NoticeVO noticeVO, MultipartFile[] files) throws Exception{
		int result = noticeDAO.noticeAdd(noticeVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			NoticeFileVO fileVO = new NoticeFileVO();
			String fileName = fileManger.save(this.uploadPath + this.username, multipartFile);
			fileVO.setNoticeNo(noticeVO.getNoticeNo());
			fileVO.setOriginalName(multipartFile.getOriginalFilename());
			fileVO.setFileName(fileName);
			result = noticeDAO.setFileAdd(fileVO);
		}
		
		
		return result;
	}
	
	public NoticeVO noticeDetail(NoticeVO noticeVO)throws Exception{
		return noticeDAO.noticeDetail(noticeVO);
	}
	
	public int noticeUpdate(NoticeVO noticeVO, MultipartFile[] files, HttpSession session)throws Exception{
		int result = noticeDAO.noticeUpdate(noticeVO);
		
		if (files != null) {
		    for(MultipartFile multipartFile:files) {
		        if(multipartFile.isEmpty()) {
		            continue;
		        }
			
			NoticeFileVO fileVO = new NoticeFileVO();
			String fileName = fileManger.save(this.uploadPath + this.username, multipartFile);
			fileVO.setNoticeNo(noticeVO.getNoticeNo());
			fileVO.setOriginalName(multipartFile.getOriginalFilename());
			fileVO.setFileName(fileName);
			result = noticeDAO.setFileAdd(fileVO);
		    }
		}
		
		
		return result;
	}
	
	public int hitUpdate(NoticeVO noticeVO)throws Exception{
		return noticeDAO.hitUpdate(noticeVO);
	}
	
	
	
	public int noticeDelete(NoticeVO noticeVO)throws Exception{
		List<NoticeFileVO> list = noticeDAO.fileDelete(noticeVO);
		
		for(NoticeFileVO noticeFileVO: list) {
			if(noticeFileVO == null) {
				continue;
			}
			fileManger.fileDelete(noticeFileVO, this.uploadPath + this.username);
		}
		
		int result = noticeDAO.noticeDelete(noticeVO);
		
		return result;
	}
	
	public int fileUpdateDelete(NoticeFileVO noticeFileVO)throws Exception{
		fileManger.fileDelete(noticeFileVO, this.uploadPath + this.username);
		
		int result = noticeDAO.fileUpdateDelete(noticeFileVO);
		
		return result;
	}
	
	public NoticeFileVO noticeFileDown(NoticeFileVO noticeFileVO)throws Exception{
		return noticeDAO.fileDetail(noticeFileVO);
	}
	
}
