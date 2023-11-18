package com.vet.main;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vet.main.attendance.AttendanceService;
import com.vet.main.attendance.AttendanceVO;
import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpVO;
import com.vet.main.notice.NoticeService;
import com.vet.main.notice.NoticeVO;
import com.vet.main.reservation.treatment.TreatmentService;
import com.vet.main.reservation.treatment.TreatmentVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/*")
@Slf4j
public class HomeController {

	@Autowired
	private AttendanceService attendanceService;

	@Autowired
	private TreatmentService treatmentService;
	
	@Autowired 
	private NoticeService noticeService;
	

	@GetMapping("/")
	public String index(AttendanceVO attendanceVO, Model model, NoticeVO noticeVO, Pager pager) throws Exception {
		// 현재 로그인한 사람의 username 정보 가져오기
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		// 메인페이지 갈 때마다 해당 일자의 출퇴근 여부 체크
		String username = authentication.getName();
		attendanceVO.setUsername(username);	// 로그인한 사람 아이디(username)
		
		AttendanceVO attendanceVO2 = new AttendanceVO();
		attendanceVO2 = attendanceService.checkDate(attendanceVO);
		model.addAttribute("att", attendanceVO2);
		
		Double dayoffCount = attendanceService.getDayoffCount(username);
		model.addAttribute("dayoff", dayoffCount);
		
		//게시판내용가져오기
		List<NoticeVO> ar = noticeService.getNoticeList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "index";
	}
	

	
	@PostMapping("/")
	@ResponseBody
	public List<Map<String,Object>> getSchedule(String username)throws Exception{
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
		
		List<TreatmentVO> list = treatmentService.getPersonSchedule(username);
	
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
	
	
	
	

	@PostMapping("attIn")
	public String setAttIn(@RequestBody AttendanceVO attendanceVO) throws Exception {
		attendanceService.setAttIn(attendanceVO);
		return "redirect:/";
	}
	
	// 퇴근
	@PostMapping("attOut")
	public String setAttOut(@RequestBody AttendanceVO attendanceVO) throws Exception {
		AttendanceVO username = new AttendanceVO();
		username.setUsername(attendanceVO.getUsername());
		
		if(attendanceService.checkDate(username) == null) {
			String error = "에러가 발생했습니다.\n관리자에게 문의해주세요.";
			return error;
		} else if (attendanceService.checkDate(username).getAttOut() != null) {
			String error = "에러가 발생했습니다.\n관리자에게 문의해주세요.";
			return error;
		} else if (attendanceService.checkDate(username).getAttOut() == null) {
			Long attNo = attendanceService.checkDate(username).getAttNo();
			attendanceVO.setAttNo(attNo);
			attendanceService.setAttOut(attendanceVO);
			return "redirect:/";	
		} else {
			String error = "에러가 발생했습니다.\n관리자에게 문의해주세요.";
			return error;
		}
		
	}

	
}
