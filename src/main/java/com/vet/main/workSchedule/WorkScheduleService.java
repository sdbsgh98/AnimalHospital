package com.vet.main.workSchedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.vet.main.approval.ApprovalDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WorkScheduleService {

	@Autowired
	private WorkScheduleDAO workScheduleDAO;
	
	
	public int addWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception {
		return workScheduleDAO.addWorkSchedule(workScheduleVO);
	}
	
	public int updateWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception {
		return workScheduleDAO.updateWorkSchedule(workScheduleVO);
	}
	
	public WorkScheduleVO getWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception {
		return workScheduleDAO.getWorkSchedule(workScheduleVO);
	}
	
}