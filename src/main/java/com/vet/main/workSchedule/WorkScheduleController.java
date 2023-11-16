package com.vet.main.workSchedule;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/work/*")
@Slf4j
public class WorkScheduleController {

	@Autowired
	private WorkScheduleService workScheduleService;

	
	@GetMapping("workList")
	public String workScheduleList() throws Exception {
		return "workSchedule/workList";
	}
	
	@PostMapping("addWork")
	public String addWorkSchedule(@RequestBody WorkScheduleVO scheduleVO) throws Exception {
		workScheduleService.addWorkSchedule(scheduleVO);		
		return "redirect:./workList";
	}
	
	@PostMapping("workDetail")
	@ResponseBody
	public WorkScheduleVO getWorkSchedule(WorkScheduleVO scheduleVO, Model model) throws Exception {
		scheduleVO = workScheduleService.getWorkSchedule(scheduleVO);
		model.addAttribute("scheduleVO", scheduleVO);
		
		return scheduleVO;
	}
	
	@GetMapping("updateWork")
	public String updateWorkSchedule() throws Exception {
		return "workSchedule/workList";
	}
}