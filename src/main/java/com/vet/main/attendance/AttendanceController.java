package com.vet.main.attendance;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attendance/*")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	
	@GetMapping("list")
	public String getAttList (AttendanceVO attendanceVO, Model model) throws Exception {
		List<AttendanceVO> attendanceVOs = attendanceService.getAttList(attendanceVO);
		model.addAttribute("list", attendanceVOs);
		return "attendance/attList";
	}
	
	@PostMapping("attIn")
	public String setAttIn(@RequestBody AttendanceVO attendanceVO) throws Exception {
		attendanceService.setAttIn(attendanceVO);
		return "redirect:./list";
	}
}
