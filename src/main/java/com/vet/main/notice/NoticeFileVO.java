package com.vet.main.notice;

import com.vet.main.file.FileVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeFileVO extends FileVO{

	private String username;
	
	private Long noticeNo;
	
	private String originalName;
	
	
	
	/* private byte[] fileData; */
}
