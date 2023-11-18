package com.vet.main.file;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FileVO {
	
	private Long fileNo;
	private String fileName;
	private String originalFileName;

	private String originalName;
}
