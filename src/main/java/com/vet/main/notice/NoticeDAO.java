package com.vet.main.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;

@Mapper
public interface NoticeDAO {

	public Long getTotal(Pager pager) throws Exception;
	
	public List<NoticeVO> getNoticeList (Pager pager) throws Exception;
	
}
