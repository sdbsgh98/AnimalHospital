package com.vet.main.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManger;
	
	public List<NoticeVO> getNoticeList(Pager pager) throws Exception {
		pager.setPerPage(10L); //10개씩
		pager.makeRowNum(); //출력할 row 처음
		Long totalCount = noticeDAO.getTotal(pager); //전체 데이터
		pager.makePageNum(totalCount); //데이터수로 페이지 수
		return noticeDAO.getNoticeList(pager);
	}
	
}
