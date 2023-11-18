package com.vet.main.reservation.surgery;

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

import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpVO;
import com.vet.main.reservation.treatment.TreatmentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/surgery/*")
@Slf4j
public class SurgeryController {

	@Autowired
   	private SurgeryService surgeryService;
	
	@GetMapping("schedule")
	public String getScheduleList1(Model model)throws Exception{
		List<EmpVO> emplist = surgeryService.getEmpList();
		model.addAttribute("emplist", emplist);
		
		return "/surgery/schedule";
	}
	
	//전체 수술 예약일정
	@PostMapping("schedule")
	@ResponseBody
	public List<Map<String,Object>> getScheduleList()throws Exception{
		List<SurgeryVO> list = surgeryService.getScheduleList();
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
			
		for(int i=0; i<list.size(); i++) {
			hash.put("title", list.get(i).getSurgeryRoom());
			hash.put("start", list.get(i).getSurgeryStart());
			hash.put("end", list.get(i).getSurgeryEnd());
			hash.put("id", list.get(i).getSurgeryNo());
			
			String surRoom = list.get(i).getSurgeryRoom();
			if(surRoom.equals("수술실1")) {
				hash.put("color", "#FA8258");
			}else {
				hash.put("color", "#BE81F7");
			}
				
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		
		log.info("#####surgery jsonArrCheck#######:{}", jsonArr);
		
		return jsonArr;
	}
	
	//예약추가
	@PostMapping("scheduleAdd")
	public String setSurgeryAdd(@RequestBody SurgeryVO surgeryVO)throws Exception{
			
		surgeryService.setSurgeryAdd(surgeryVO);
			
		return "redirect:./schedule";
	}
	
		
	//고객검색
	@PostMapping("customerList")
	@ResponseBody
	public List<CustomerVO> getCustomerList(String animalName)throws Exception{
		List<CustomerVO> list = surgeryService.getCustomerList(animalName);
		
		log.info("customerlist:{}", list );
			
		return list;	
	}
		
	//직원조회
	@GetMapping("empList")
	public String getEmpList(Model model)throws Exception{
		List<EmpVO> list = surgeryService.getEmpList();
		model.addAttribute("list", list);
			
		return "surgery/empList";	
	}
	

	//예약상세
	@PostMapping("scheduleDetail")
	@ResponseBody
	public SurgeryVO getDetail(@RequestBody SurgeryVO surgeryVO)throws Exception{
	
		surgeryVO = surgeryService.getDetail(surgeryVO);
		log.info("=====VO확인{}=======", surgeryVO);
				
		return surgeryVO;
	}
	
	//예약삭제
	@PostMapping("scheduleDelete")
	public String setDelete(@RequestBody SurgeryVO surgeryVO)throws Exception{
		surgeryService.setDelete(surgeryVO);
		
		return "redirect:./schedule";
	}
	
	@PostMapping("scheduleUpdate")
	public String setUpdate(@RequestBody SurgeryVO surgeryVO)throws Exception{
		 surgeryService.setUpdate(surgeryVO);
		
		return "surgery/schedule";
	}
}