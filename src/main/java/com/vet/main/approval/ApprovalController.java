package com.vet.main.approval;

import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptService;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/approval/*")
@Slf4j
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	@Autowired
	private DeptService deptService;

	@GetMapping("add/{apKind}")
	public String setApAdd(@PathVariable String apKind, ApprovalVO approvalVO, Model model, EmpVO empVO)
			throws Exception {
		approvalService.getApUser(empVO);

		log.info("====== empVO : {} ======", empVO);

		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String date = now.format(formatter);

		List<DeptVO> ar = deptService.getApLineDept();
		List<DeptVO> dept = deptService.selectApLineDept();

		// 모달창에서 결재선 선택 리스트 뿌려줌
		model.addAttribute("dept", dept);
		model.addAttribute("list", ar);
		
		// 작성화면에서 로그인 직원의 정보와 현재 날짜를 뿌려줌
		model.addAttribute("emp", empVO);
		model.addAttribute("date", date);

		log.info("================= empVO : {} ====================", empVO);

		if (apKind.equals("poomAdd")) {
			return "approval/poomAdd";
		} else if (apKind.equals("expenseAdd")) {
			return "approval/expenseAdd";
		} else if (apKind.equals("dayoffAdd")) {
			return "approval/dayoffAdd";
		} else if (apKind.equals("vacationAdd")) {
			return "approval/vacationAdd";
		} else if (apKind.equals("retireAdd")) {
			return "approval/retireAdd";
		}

		return null;
	}

	// 기안 작성 데이터 전송 (지출결의서 제외)
	@PostMapping("add/{apKind}")
	public String setApAdd(@PathVariable String apKind, ApprovalVO approvalVO, @RequestParam("lineUsername") String[] lineUsername
							, @RequestParam("lineEmpName") String[] lineEmpName) throws Exception {

		log.info("==================== Poom Insert ======================");
		log.info("====== Poom : {} ======", approvalVO);

		if (apKind.equals("poomAdd")) {
			int result = approvalService.setApPoomAdd(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("dayoffAdd")) {
			int result = approvalService.setApDayoffAdd(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("vacationAdd")) {
			int result = approvalService.setApVacationAdd(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("retireAdd")) {
			int result = approvalService.setApRetireAdd(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}
		}

		return "redirect:../draftList/" + approvalVO.getUsername();
	}

	// 기안(지출결의서) 작성 데이터 전송
	@PostMapping("add/expenseAdd")
	public String setApAdd(@RequestParam("username") String username, @RequestParam("positionName") String positionName,
			@RequestParam("deptName") String deptName, @RequestParam("empName") String empName,
			@RequestParam("apTitle") String apTitle, @RequestParam("expenseName") String[] expenseName,
			@RequestParam("expenseAmount") Long[] expenseAmount, @RequestParam("expensePrice") Long[] expensePrice,
			@RequestParam("expenseBigo") String[] expenseBigo, @RequestParam("lineUsername") String[] lineUsername
			, @RequestParam("lineEmpName") String[] lineEmpName) throws Exception {

		ApprovalVO approvalVO = new ApprovalVO();

		approvalVO.setUsername(username);
		approvalVO.setPositionName(positionName);
		approvalVO.setDeptName(deptName);
		approvalVO.setEmpName(empName);
		approvalVO.setApTitle(apTitle);

		approvalService.setApExpenseAdd(approvalVO);

		log.info("============= approvalVO : {} ==============", approvalVO);
			
		// 지출내역을 insert
		for (int i = 0; i < expenseName.length; i++) {
			ApprovalExpenseVO expenseVO = new ApprovalExpenseVO();
			expenseVO.setApNo(approvalVO.getApNo());
			expenseVO.setExpenseName(expenseName[i]);
			expenseVO.setExpenseAmount(expenseAmount[i]);
			expenseVO.setExpensePrice(expensePrice[i]);
			expenseVO.setExpenseBigo(expenseBigo[i]);

			approvalService.setExpenseAdd(expenseVO);

			log.info("============= expenseVO : {} ==============", expenseVO);
		}
		
		// 결재자를 insert
		for(int i=0; i<lineUsername.length; i++) {
			// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
			if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
				break;
			}
			
			ApprovalLineVO approvalLineVO = new ApprovalLineVO();
			approvalLineVO.setApNo(approvalVO.getApNo());
			approvalLineVO.setUsername(lineUsername[i]);
			approvalLineVO.setEmpName(lineEmpName[i]);
			approvalLineVO.setAplStep(String.valueOf(i+1));
			
			approvalService.setApLine(approvalLineVO);
		}

		return "redirect:../draftList/" + username;
	}

	// 작성버튼 클릭 시 나오는 양식 선택 리스트
	@GetMapping("formatList")
	public String getFormatList() throws Exception {
		return "approval/formatList";
	}

	// 기안함 리스트
	@GetMapping("draftList/{username}")
	public String getDraftList(@PathVariable String username, Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getDraftList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);

		log.info("=========== getDraftList : {} ===========", ar);

		return "approval/draftList";
	}

	// 결재함 리스트
	@GetMapping("approverList/{username}")
	public String getApproverList(@PathVariable String username, Pager pager, Model model) throws Exception {
		List<ApprovalVO> ar = approvalService.getApproverList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);

		log.info("=========== getApproverList : {} ===========", ar);

		return "approval/approverList";
	}

	@GetMapping("detail")
	public String getApDetail(ApprovalVO approvalVO, Model model) throws Exception {
		
		approvalVO = approvalService.getApDetail(approvalVO);
		
		log.info("=============== 기안서 번호 가져오는지 확인 approvalVO : {} ===============", approvalVO);
		
		Long apNo = approvalVO.getApNo();
		
		// 결재자 조회
		List<ApprovalLineVO> line = approvalService.getApLinePerson(apNo);
		model.addAttribute("line", line);
		
		// 결재자 도장 조회
//		for(int i=0; i<line.size(); i++) {
//			line.get(i);
//		}
//		List<ApprovalLineVO> lineSign = approvalService.getApSign(null);
		

		log.info("=============== detail 정보 : {} ================", approvalVO);

		if (approvalVO.getApKind().equals("품의서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/poomDetail";
		} else if (approvalVO.getApKind().equals("지출결의서")) {
			ApprovalVO approvalVOs = new ApprovalVO();
			approvalVOs = approvalService.getApExpenseDetail(approvalVO);
			model.addAttribute("approvalVO", approvalVOs);

			log.info("==================== expenseList : {} ========================", approvalVOs);
			return "approval/expenseDetail";
		} else if (approvalVO.getApKind().equals("휴가신청서")) {

			if (approvalVO.getDayoffEndDate() != null) {
				String date1 = approvalVO.getDayoffEndDate();
				String date2 = approvalVO.getDayoffStartDate();

				Date format1 = new SimpleDateFormat("yyyy/MM/dd").parse(date1);
				Date format2 = new SimpleDateFormat("yyyy/MM/dd").parse(date2);

				long diffSec = (format1.getTime() - format2.getTime()) / 1000; // 초 차이
				long diffMin = (format1.getTime() - format2.getTime()) / 60000; // 분 차이
				long diffHor = (format1.getTime() - format2.getTime()) / 3600000; // 시 차이
				long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

				model.addAttribute("day", diffDays);
			}

			model.addAttribute("approvalVO", approvalVO);
			return "approval/dayoffDetail";
		} else if (approvalVO.getApKind().equals("휴직신청서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/vacationDetail";
		} else if (approvalVO.getApKind().equals("퇴직신청서")) {
			model.addAttribute("approvalVO", approvalVO);
			return "approval/retireDetail";
		}

		return null;
	}

	@PostMapping("apLineSelect") // 결재선에서 부서클릭시 맞는 부서들 출력
	@ResponseBody
	public List<EmpVO> getEmpSelectList(String deptName) throws Exception { // 선택한 부서에 맞는 사원들 리스트로 반환
		
		List<EmpVO> selectList = new ArrayList<EmpVO>();
		selectList = approvalService.getEmpSelectList(deptName);
		
		log.info("############### 결재선 직원 목록 : {} ################", selectList);
		return selectList;
	}
	
	
	@PostMapping("empList")
	@ResponseBody
	public List<EmpVO> printEmpList(@RequestParam(value = "emps[]") String[] empData) throws Exception {
		List<EmpVO> empList = new ArrayList<EmpVO>();
		
		for (int i = 0; i < empData.length; i++) {
			empList.addAll(approvalService.getEmpSelectList(empData[i]));
		}
		return empList;
	}
	
	
	// 결재자 수에 따른 처리과정 추가수정필요
	// 반려
	@PostMapping("reject")
	public String rejectApprove(ApprovalVO approvalVO, Model model) throws Exception {
		
		String username = approvalVO.getUsername();
		Long apNo = approvalVO.getApNo();
		
		// 전자결재 테이블에 업데이트
		approvalVO.setApState("반려");

		log.info("===================== 반려 : {} ======================", approvalVO);

		approvalService.rejectApprove01(approvalVO);
		
		// 결재자 테이블에 업데이트
		ApprovalLineVO approvalLineVO = new ApprovalLineVO();
		approvalLineVO.setApNo(apNo);
		approvalLineVO.setUsername(username);
		approvalLineVO.setApConfirmState("2");
		
		approvalService.setApprover(approvalLineVO);
		
		return "redirect:./approverList/" + username;
	}
	
	// 결재
	@PostMapping("approve")
	public String setApprove(@RequestParam("apNo") Long apNo, @RequestParam("username") String username) throws Exception {
		// 업데이트 데이터들 담을 객체 생성
		ApprovalVO approvalVO = new ApprovalVO();
		ApprovalLineVO approvalLineVO = new ApprovalLineVO();
		
		// 전자결재 테이블에 결재상태 업데이트 (ajax로 받은 파라미터 넣어주기)
		approvalVO.setApNo(apNo);
		
		// 결재자 수와 결재가 남았는지 확인 (ajax로 받은 파라미터 넣어주기)
		ApprovalLineVO lineVO = approvalService.getApprovalState(apNo);
		
		// 결재라인 테이블에 결재상태 업데이트 (ajax로 받은 파라미터 넣어주기)
		approvalLineVO.setApNo(apNo);
		approvalLineVO.setUsername(username);
		
		if(lineVO.getAplCount() == 1) {
			// 결재자가 1명일 경우
			approvalVO.setApState("결재완료");
			
			// 결재자 테이블에 해당 결재자의 결재상태 업데이트
			approvalLineVO.setApConfirmState("1");
			
		} else if(lineVO.getAplCount() == 2 && lineVO.getNotSign() == 2) {
			// 결재자가 2명이고, 현재 결재되지 않은 기안이 2개일때
			approvalVO.setApState("결재진행중");
			
			// 결재자 테이블에 해당 결재자의 결재상태 업데이트
			approvalLineVO.setApConfirmState("1");
			
		} else if (lineVO.getAplCount() == 2 && lineVO.getNotSign() == 1) {
			// 결재자가 2명이고, 현재 결재되지 않은 기안이 1개일때
			approvalVO.setApState("결재완료");
			
			// 결재자 테이블에 해당 결재자의 결재상태 업데이트
			approvalLineVO.setApConfirmState("1");
	
		}
			
		approvalService.setApState(approvalVO);
		approvalService.setApprover(approvalLineVO);
		
		return "redirect:./approverList/" + username;
	}
	
	@PostMapping("delete")
	public String setApDelete(ApprovalVO approvalVO) throws Exception {
		int result = approvalService.setApDelete(approvalVO);
		String username = approvalVO.getUsername();
		
		return "redirect:./draftList/" + username;
	}
	
	@GetMapping("update")
	public String setApUpdate(ApprovalVO approvalVO, Model model) throws Exception {
		approvalVO = approvalService.getApDetail(approvalVO);
		String apKind = approvalVO.getApKind();
		Long apNo = approvalVO.getApNo();
		model.addAttribute("approvalVO", approvalVO);
		
		List<DeptVO> ar = deptService.getApLineDept();
		List<DeptVO> dept = deptService.selectApLineDept();
		
		// 모달창에서 결재선 선택 리스트 뿌려줌
		model.addAttribute("dept", dept);
		model.addAttribute("list", ar);
		
		// 결재자 조회
		List<ApprovalLineVO> line = approvalService.getApLinePerson(apNo);
		model.addAttribute("line", line);

		if (apKind.equals("품의서") || apKind.equals("휴직신청서") || apKind.equals("퇴직신청서")) {
			return "approval/update";
		} else if (apKind.equals("지출결의서")) {
			ApprovalVO approvalVO2 = new ApprovalVO();
			approvalVO2 = approvalService.getApExpenseDetail(approvalVO);
			model.addAttribute("approvalVO", approvalVO2);

			return "approval/expenseUpdate";
			
		} else if (apKind.equals("휴가신청서")) {
			String dayoffKind = approvalVO.getDayoffKind();
			
			if (dayoffKind.equals("반차")) {
				String dayoffStartDate = approvalVO.getDayoffStartDate();
				model.addAttribute("dayoffStartDate", dayoffStartDate);
			} else {
				String dayoffStartDate = approvalVO.getDayoffStartDate();
				String dayoffEndDate = approvalVO.getDayoffEndDate();
				
				model.addAttribute("dayoffStartDate", dayoffStartDate);
				model.addAttribute("dayoffEndDate", dayoffEndDate);
			}

			return "approval/dayoffUpdate";
		}
		
		return null;
	}
	
	@PostMapping("update")
	public String setApUpdate(ApprovalVO approvalVO, @RequestParam("lineUsername") String[] lineUsername
							, @RequestParam("lineEmpName") String[] lineEmpName) throws Exception {
		Long apNo = approvalVO.getApNo();
		String apKind = approvalVO.getApKind();
		String username = approvalVO.getUsername();
		
		approvalService.resetApLine(apNo);
		
		if (apKind.equals("품의서")) {
			int result = approvalService.setApUpdate(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("휴가신청서")) {
			
			if(approvalVO.getDayoffKind().equals("반차")) {
				approvalVO.setDayoffEndDate(null);
				int result = approvalService.setDayoffUpdate(approvalVO);
			} else {
				approvalVO.setDayoffTime(null);
				int result = approvalService.setDayoffUpdate(approvalVO);
			}
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				int result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("휴직신청서")) {
			int result = approvalService.setApUpdate(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}

		} else if (apKind.equals("퇴직신청서")) {
			int result = approvalService.setApUpdate(approvalVO);
			
			for(int i=0; i<lineUsername.length; i++) {
				// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
				if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
					break;
				}
				
				ApprovalLineVO approvalLineVO = new ApprovalLineVO();
				approvalLineVO.setApNo(approvalVO.getApNo());
				approvalLineVO.setUsername(lineUsername[i]);
				approvalLineVO.setEmpName(lineEmpName[i]);
				approvalLineVO.setAplStep(String.valueOf(i+1));
				
				result = approvalService.setApLine(approvalLineVO);
			}
		}

		return "redirect:./draftList/" + username;
	}
	
	
	@PostMapping("update/expenseUpdate")
	public String setApUpdate(@RequestParam("apNo") Long apNo, @RequestParam("username") String username, @RequestParam("apTitle") String apTitle, @RequestParam("expenseName") String[] expenseName,
			@RequestParam("expenseAmount") Long[] expenseAmount, @RequestParam("expensePrice") Long[] expensePrice,
			@RequestParam("expenseBigo") String[] expenseBigo, @RequestParam("lineUsername") String[] lineUsername
			, @RequestParam("lineEmpName") String[] lineEmpName) throws Exception {

		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setApNo(apNo);
		approvalVO.setApTitle(apTitle);
		
		approvalService.setApExpenseUpdate(approvalVO);
		
		approvalService.resetApLine(apNo);

		log.info("============= approvalVO : {} ==============", approvalVO);
			
		// 지출내역을 update
		for (int i = 0; i < expenseName.length; i++) {
			ApprovalExpenseVO expenseVO = new ApprovalExpenseVO();
			expenseVO.setApNo(apNo);
			expenseVO.setExpenseName(expenseName[i]);
			expenseVO.setExpenseAmount(expenseAmount[i]);
			expenseVO.setExpensePrice(expensePrice[i]);
			expenseVO.setExpenseBigo(expenseBigo[i]);

			approvalService.setExpenseAdd(expenseVO);

			log.info("============= expenseVO : {} ==============", expenseVO);
		}
		
		// 결재자를 insert
		for(int i=0; i<lineUsername.length; i++) {
			// 2차 결재자가 없을 경우엔 반복문에서 나와지도록
			if(lineUsername[i].equals("") || lineEmpName[i].equals("")) {
				break;
			}
			
			ApprovalLineVO approvalLineVO = new ApprovalLineVO();
			approvalLineVO.setApNo(approvalVO.getApNo());
			approvalLineVO.setUsername(lineUsername[i]);
			approvalLineVO.setEmpName(lineEmpName[i]);
			approvalLineVO.setAplStep(String.valueOf(i+1));
			
			approvalService.setApLine(approvalLineVO);
		}

		return "redirect:../draftList/" + username;
	}
	
	@GetMapping("expenseDel")
	public int setExpenseDelete(@RequestParam(value = "apNo") Long apNo, @RequestParam(value = "expenseName") String expenseName) throws Exception {
		ApprovalExpenseVO expenseVO = new ApprovalExpenseVO();
		expenseVO.setApNo(apNo);
		expenseVO.setExpenseName(expenseName);
		int result = approvalService.setExpenseDelete(expenseVO);
		return result;
	}
	
}
