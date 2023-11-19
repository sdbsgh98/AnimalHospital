package com.vet.main.notice;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("noticeList2")
	public String getList(DeptPager deptPager, Model model) throws Exception {
		List<NoticeVO> ar = noticeService.getNoticeList2(deptPager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", deptPager);
		
		return "notice/noticeList2";
	}
	
	@GetMapping("noticeList")
	public String getList(Pager pager, Model model) throws Exception {
		List<NoticeVO> ar = noticeService.getNoticeList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "notice/noticeList";
	}
	
	@GetMapping("noticeAdd")
	public String noticeAdd() throws Exception{
		return "notice/noticeAdd";
	}
	
	@PostMapping("noticeAdd")
	public String noticeAdd(NoticeVO noticeVO, MultipartFile[] files)throws Exception{
		int result = noticeService.noticeAdd(noticeVO, files);
		
		return "redirect:./noticeList";
	}
	
	@GetMapping("noticeDetail")
	public String noticeDetail(NoticeVO noticeVO, Model model)throws Exception{
		noticeVO = noticeService.noticeDetail(noticeVO);
		noticeService.hitUpdate(noticeVO);
		
		model.addAttribute("vo", noticeVO);
		
		return "notice/noticeDetail";
	}
	
	@GetMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO, Model model)throws Exception{
		noticeVO = noticeService.noticeDetail(noticeVO);
		model.addAttribute("vo", noticeVO);
		
		return "notice/noticeUpdate";
	}
	
	@PostMapping("noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO, MultipartFile[] files, HttpSession session, Model model)throws Exception{
		int result = noticeService.noticeUpdate(noticeVO, files, session);
		
		return "redirect:./noticeDetail?noticeNo="+noticeVO.getNoticeNo();
	}
	
	@GetMapping("noticeDelete")
	public String noticeDelete(NoticeVO noticeVO)throws Exception{
		int result = noticeService.noticeDelete(noticeVO);
		
		return "redirect:./noticeList";
	}
	
	@GetMapping("fileDelete")
	public String fileUpdateDelete(NoticeFileVO noticeFileVO, Model model, NoticeVO noticeVO)throws Exception{
		int result = noticeService.fileUpdateDelete(noticeFileVO);

		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
//		return "redirect:./noticeUpdate?noticeNo="+noticeVO.getNoticeNo();
	}
	
	@GetMapping("fileDown")
	public String noticeFileDown(NoticeFileVO noticeFileVO, Model model)throws Exception{
		noticeFileVO = noticeService.noticeFileDown(noticeFileVO);
		model.addAttribute("file", noticeFileVO);
		
		return "FileManager";
		
	}
	
}


