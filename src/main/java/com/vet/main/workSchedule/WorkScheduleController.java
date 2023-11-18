package com.vet.main.workSchedule;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vet.main.dept.DeptVO;
import com.vet.main.reservation.treatment.TreatmentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/work/*")
@Slf4j
public class WorkScheduleController {

	@Autowired
	private WorkScheduleService workScheduleService;


	
	@PostMapping("addWork")
	public int addWorkSchedule(@RequestBody WorkScheduleVO scheduleVO) throws Exception {
		int result = workScheduleService.checkSch(scheduleVO);
		int rst = 0;
		
		if(result==0) {
			rst = workScheduleService.setWorkAdd(scheduleVO);	
		}else {
			rst=0;
		}	
		return rst;
	}
	
	@GetMapping("workList")
	public String getScheduleList(Model model) throws Exception {
		List<DeptVO> deptlist = workScheduleService.getDeptList();
		model.addAttribute("deptlist", deptlist);
		
		return "/work/workList";
	}
	
	//전체 예약스케줄
	@PostMapping("workList")
	@ResponseBody
	public List<Map<String,Object>> getScheduleList(String deptNo) throws Exception{
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
		LocalDate date1 = LocalDate.now();
		List<WorkScheduleVO> list = workScheduleService.getScheduleList(deptNo);
	
		for(int i=0; i < list.size(); i++) {
			hash.put("title", list.get(i).getEmpName());
			hash.put("start", list.get(i).getWorkStart());
			hash.put("end", list.get(i).getWorkEnd());
			hash.put("id", list.get(i).getWorkNo());
			
			LocalDateTime date2 = list.get(i).getWorkStart();
			String dept = list.get(i).getDeptNo();
			
			if(date2.toLocalDate().isBefore(date1)){ 
				hash.put("color", "#F7819F"); 
			}
			else { 				
				if(dept.equals("400")) {
					hash.put("color", "#A9F5A9");
				}else if(dept.equals("500")){
					hash.put("color", "#81DAF5");
				}else if(dept.equals("600")) {
					hash.put("color", "#9F81F7");
				}
				
			}

			jsonObj = new JSONObject(hash); 
			jsonArr.add(jsonObj);		
		}
		
		
		log.info("jsonArrCheck:{}", jsonArr);
		
		return jsonArr;	
	}
	
	
	@PostMapping("workDetail")
	@ResponseBody
	public WorkScheduleVO getDetail(Model model, @RequestBody WorkScheduleVO scheduleVO) throws Exception{

		scheduleVO = workScheduleService.getDetail(scheduleVO);
		model.addAttribute("vo", scheduleVO);
				
		return scheduleVO;
	}
	
	//예약삭제
	@PostMapping("workDelete")
	public String setDelete(@RequestBody WorkScheduleVO scheduleVO)throws Exception{
		workScheduleService.setDelete(scheduleVO);
		
		return "redirect:./workList";
	}
	
	//예약수정
	@GetMapping("workUpdate")
	public String setUpdate()throws Exception{
	
		return "/work/workList";
	}
	
	//예약수정
	@PostMapping("workUpdate")
	public String setUpdate(Model model, @RequestBody WorkScheduleVO scheduleVO)throws Exception{	
				
		workScheduleService.setUpdate(scheduleVO);
		
		return "redirect:./workList";
	}	
}