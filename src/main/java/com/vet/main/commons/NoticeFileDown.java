package com.vet.main.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.vet.main.file.FileVO;
import com.vet.main.notice.NoticeFileVO;

import lombok.extern.slf4j.Slf4j;


@Component
@Slf4j
public class NoticeFileDown extends AbstractView{
	
	@Value("${app.upload}")
	private String filePath;

	@Value("${app.notice}")
	private String username; 
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 서버에서 파일을 찾아서 client로 전송
		// 전송하기 위해서는 '어떤 파일? 어디에있는지?' 같은 정보가 필요함
		// /GDJ68/upload/
		NoticeFileVO noticeFileVO = (NoticeFileVO)model.get("fileVO");
		log.info("--------------------------------");
		log.info("fileVO {} ", noticeFileVO);
		String fileName = noticeFileVO.getFileName();
		
		// 어떤 파일?
		File file = new File(username+filePath+fileName);
		
		// 한글 처리
		response.setCharacterEncoding("UTF-8");
		
		// 파일의 크기 정보
		response.setContentLengthLong(file.length());
		
		// 다운로드 시 파일의 이름을 인코딩
		String downName = URLEncoder.encode(noticeFileVO.getOriginalName(), "UTF-8");
		
		// Header 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+downName+"\"");	// attachment : 첨부하다
		response.setHeader("content-Transfer-Encoding", "binary");
		
		// HDD에서 파일 읽어오는 작업
		FileInputStream fi = new FileInputStream(file);
		
		// Client로 전송
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		// 자원 해제
		os.close();
		fi.close();
		
		log.info("============= File Down View =============");
		log.info("Board:{}", fileName);		
	}
}