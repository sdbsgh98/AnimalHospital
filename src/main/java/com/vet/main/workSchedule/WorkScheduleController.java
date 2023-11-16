package com.vet.main.workSchedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vet.main.emp.EmpVO;
import com.vet.main.reservation.surgery.SurgeryVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/work/*")
@Slf4j
public class WorkScheduleController {

	@Autowired
	private WorkScheduleService workScheduleService;

	
	
	@GetMapping("workList")
	public String getWorkList(Model model)throws Exception{
		List<WorkScheduleVO> workList = workScheduleService.getWorkList();
		model.addAttribute("workList", workList);
		
		return "workSchedule/workList";
	}
	
	
	//전체 수술 예약일정
	@PostMapping("workList")
	@ResponseBody
	public List<Map<String,Object>> getWorkList() throws Exception {
		List<WorkScheduleVO> list = workScheduleService.getWorkList();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
			
		for(int i=0; i<list.size(); i++) {
			hash.put("title", list.get(i).getEmpName());
			hash.put("start", list.get(i).getWorkDate());
			hash.put("end", list.get(i).getWorkTime());
			hash.put("id", list.get(i).getHomeTime());
				
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		
		log.info("##### work jsonArrCheck #######:{}", jsonArr);
		
		return jsonArr;
	}
	
	@PostMapping("addWork")
	public String addWorkSchedule(@RequestBody WorkScheduleVO scheduleVO) throws Exception {
		workScheduleService.addWorkSchedule(scheduleVO);		
		return "redirect:./workList";
	}
	
	// 일정상세
	@PostMapping("workDetail")
	@ResponseBody
	public WorkScheduleVO getWorkSchedule(@RequestBody WorkScheduleVO scheduleVO) throws Exception {
		scheduleVO = workScheduleService.getWorkSchedule(scheduleVO);
		
		return scheduleVO;
	}
		
	// 일정삭제
	@PostMapping("delWork")
	public String delWorkSchedule(@RequestBody WorkScheduleVO scheduleVO)throws Exception{
		workScheduleService.delWorkSchedule(scheduleVO);
		return "redirect:./workList";
	}
	
	// 일정 수정
	@PostMapping("upWork")
	public String updateWorkSchedule(@RequestBody WorkScheduleVO scheduleVO)throws Exception{
		workScheduleService.updateWorkSchedule(scheduleVO);
		
		return "workSchedule/workList";
	}

}
