package com.vet.main.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vet.main.commons.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("noticeList")
	public String getList(Pager pager, Model model) throws Exception {
		List<NoticeVO> ar = noticeService.getNoticeList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "notice/noticeList";
	}
	
}
