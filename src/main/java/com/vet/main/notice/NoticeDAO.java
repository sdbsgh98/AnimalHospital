package com.vet.main.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.Pager;
import com.vet.main.file.FileVO;

@Mapper
public interface NoticeDAO {

	public Long getTotal(Pager pager) throws Exception;
	
	public List<NoticeVO> getNoticeList (Pager pager) throws Exception;
	
	public int noticeAdd(NoticeVO noticeVO) throws Exception;
	
	public int setFileAdd(FileVO fileVO) throws Exception;
	
	public NoticeVO noticeDetail(NoticeVO noticeVO) throws Exception;
	
	public int noticeUpdate(NoticeVO noticeVO) throws Exception;
	
	public int noticeDelete(NoticeVO noticeVO) throws Exception;
	
	public int fileUpdateDelete(NoticeFileVO noticeFileVO) throws Exception;
	
	public List<NoticeFileVO> fileDelete(NoticeVO noticeVO) throws Exception;

	public int hitUpdate(NoticeVO noticeVO)throws Exception;
	
	public NoticeFileVO fileDetail(NoticeFileVO noticeFileVO)throws Exception;
	
	public Long getTotal2(DeptPager deptPager) throws Exception;
	
	public List<NoticeVO> getNoticeList2(DeptPager deptPager) throws Exception;
}
