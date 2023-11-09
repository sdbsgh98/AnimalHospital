package com.vet.main.reservation.treatment;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vet.main.customer.CustomerVO;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/treatment/*")
@Slf4j
public class TreatmentController {
	
	@Autowired
	private TreatmentService treatmentService;

	
	@GetMapping("schedule")
	public String getScheduleList1(Model model, EmpVO empVO)throws Exception{
		List<EmpVO> emplist = treatmentService.getEmpList();
		List<DeptVO> deptlist = treatmentService.getDeptList();

		model.addAttribute("emplist", emplist);
		model.addAttribute("deptlist", deptlist);
		
		
		return "/treatment/schedule";
	}	

	//전체 예약스케줄
	@PostMapping("schedule")
	@ResponseBody
	public List<Map<String,Object>> getScheduleList()throws Exception{
		List<TreatmentVO> list = treatmentService.getScheduleList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i=0; i < list.size(); i++) {
			hash.put("title", list.get(i).getAnimalName());		
			hash.put("start", list.get(i).getTreatmentDate());			
			hash.put("id", list.get(i).getTreatmentNo());
		
			jsonObj = new JSONObject(hash); 
			jsonArr.add(jsonObj);		
		}
		
		log.info("jsonArrCheck:{}", jsonArr);
		
		return jsonArr;		
	}
	
	//부서별스케줄
	@PostMapping("scheduledept")
	@ResponseBody
	public List<Map<String,Object>> getDeptScheduleList(@RequestBody TreatmentVO treatmentVO)throws Exception{
		List<TreatmentVO> list = treatmentService.getDeptScheduleList(treatmentVO);
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i=0; i < list.size(); i++) {
			hash.put("title", list.get(i).getAnimalName());		
			hash.put("start", list.get(i).getTreatmentDate());			
			hash.put("id", list.get(i).getTreatmentNo());
		
			jsonObj = new JSONObject(hash); 
			jsonArr.add(jsonObj);		
		}
		
		log.info("jsonArrCheck:{}", jsonArr);
		
		return jsonArr;		
	}
	
	//예약추가
	@PostMapping("scheduleAdd")
	public String setTreatmentAdd(@RequestBody TreatmentVO treatmentVO)throws Exception{
		
		treatmentService.setTreatmentAdd(treatmentVO);
		
		return "redirect:./schedule";
	}
	
	@GetMapping("customerList")
	public List<CustomerVO> customerList(Model model,CustomerVO customerVO)throws Exception{
		List<CustomerVO> list = treatmentService.getCustomerList(customerVO);
		
		model.addAttribute("list", list);


		log.info("customerlist:{}", list );
		
		return list;	
	}
	
	
	
	
	
	//고객리스트조회
	/*
	 * @PostMapping("customerList") public ModelAndView getCustomerList(ModelAndView
	 * mv,@RequestBody CustomerVO customerVO)throws Exception{ List<CustomerVO>
	 * cuslist = treatmentService.getCustomerList(customerVO);
	 * 
	 * mv.addObject("cuslist", cuslist); mv.setViewName("/treatment/schedule");
	 * log.info("customerlist:{}", cuslist );
	 * 
	 * return mv; }
	 */
	
	//직원조회
	@GetMapping("empList")
	public String getEmpList(Model model)throws Exception{
		List<EmpVO> list = treatmentService.getEmpList();
		model.addAttribute("list", list);
		
		return "treatment/empList";	
	}
	
	/*
	 * @GetMapping("scheduleDetail") public String getDetail()throws Exception{
	 * return "treatment/scheduleDetail"; }
	 */
	
	//예약상세
	@PostMapping("scheduleDetail")
	@ResponseBody
	public TreatmentVO getDetail(Model model, @RequestBody TreatmentVO treatmentVO)throws Exception{
	
		log.info("=======동물이름확인======={}",treatmentVO.getAnimalName());
		log.info("=======진료날짜확인======={}",treatmentVO.getTreatmentDate());
		treatmentVO = treatmentService.getDetail(treatmentVO);
		log.info("=====VO확인{}=======", treatmentVO);
		model.addAttribute("vo", treatmentVO);
				
		return treatmentVO;
	}

	//예약삭제
	@PostMapping("scheduleDelete")
	public String setDelete(@RequestBody TreatmentVO treatmentVO)throws Exception{
		treatmentService.setDelete(treatmentVO);
		
		return "redirect:./schedule";
	}
	
	//예약수정
	@GetMapping("scheduleUpdate")
	public String setUpdate()throws Exception{
	
		return "/treatment/schedule";
	}
	
	//예약수정
	@PostMapping("scheduleUpdate")
	public String setUpdate(Model model, @RequestBody TreatmentVO treatmentVO)throws Exception{	
				
		treatmentService.setUpdate(treatmentVO);
		
		return "redirect:./schedule";
	}
	
	
	
	
}