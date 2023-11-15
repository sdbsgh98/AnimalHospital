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
	private Date createDate;
	private Date modifyDate;
	private String contents;
	private Long hit;
	private boolean important;
	
	public List<NoticeFileVO> fileVO;
	
	private String empName;
	
}
