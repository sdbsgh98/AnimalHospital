package com.vet.main.attendance;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {

	@Autowired
	private AttendanceDAO attendanceDAO;
	
	// 리스트
	public List<AttendanceVO> getAttList(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.getAttList(attendanceVO);
	}
	
	// 출근시간
	public int setAttIn(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.setAttIn(attendanceVO);
	}
	
	// 퇴근시간
	public int setAttOut(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.setAttOut(attendanceVO);
	}
	
	// 한사람의 근태정보 조회
	public AttendanceVO checkDate(AttendanceVO attendanceVO) throws Exception {
		return attendanceDAO.checkDate(attendanceVO);
	}
	
	// 연차 갯수 구하기
	// 입사연도 구하기
	public String getHireDate(String username) throws Exception {
		return attendanceDAO.getHireDate(username);
	}
	
	// 현재 연도 구하기
	public String getCurDate() throws Exception {
		return attendanceDAO.getCurDate();
	}
	
	
	@Scheduled (cron="0 0 0 1 1 ?")
	public void setDayoffCount() throws Exception {
		List<EmpVO> list = attendanceDAO.getEmpList();
		
		for (int i = 0; i < list.size(); i++) {	
			
			String username = list.get(i).getUsername();
		
			// 현재 연도
			String currentYear = attendanceDAO.getCurDate();
			
			// 입사 연도
			String hireYear = attendanceDAO.getHireDate(username);
			
			Double dayoffCount = Double.parseDouble(currentYear) - Double.parseDouble(hireYear);
			
			if (dayoffCount <= 5) {
				dayoffCount = 10.0 + dayoffCount;
			} else if (dayoffCount <= 10) {
				dayoffCount = 17.0 + Math.floor((dayoffCount - 5) / 5.0);
			} else {
				dayoffCount = 20.0;
			}
			
			log.info("============== dayoffCount : {} =============", dayoffCount);
			
			EmpVO empVO = new EmpVO();
			empVO.setUsername(username);
			empVO.setDayoffCount(dayoffCount);
			
			attendanceDAO.setDayoffCount(empVO);
		}
	}
	
	public Double getDayoffCount(String username) throws Exception {
		return attendanceDAO.getDayoffCount(username);
	}

}
