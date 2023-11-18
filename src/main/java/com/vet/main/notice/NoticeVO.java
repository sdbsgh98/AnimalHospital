package com.vet.main.notice;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {

	private Long noticeNo;
	private String username;
	private String title;
	private String createDate;
	private String modifyDate;
	private String contents;
	private Long hit;
	private String important;
	
	public List<NoticeFileVO> fileVO;
	
	private String empName;
	
}
