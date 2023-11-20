package com.vet.main.workSchedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.vet.main.approval.ApprovalDAO;
import com.vet.main.dept.DeptVO;
import com.vet.main.reservation.treatment.TreatmentVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class WorkScheduleService {

	@Autowired
	private WorkScheduleDAO workScheduleDAO;
	
	
	public List<WorkScheduleVO> getScheduleList(String deptNo) throws Exception {
		if (deptNo.equals("300")) {
			return workScheduleDAO.getScheduleList();
		} else {
			return workScheduleDAO.getDeptScheduleList(deptNo);
		}
	}
	
	public List<WorkScheduleVO> getDeptScheduleList(String deptNo) throws Exception {
		  if(deptNo.equals("300")) {
			  return workScheduleDAO.getScheduleList(); 
		  }else { 
			  return workScheduleDAO.getDeptScheduleList(deptNo); 
		  }
	}
	
	public int setWorkAdd(WorkScheduleVO scheduleVO) throws Exception {
		return workScheduleDAO.setWorkAdd(scheduleVO);
	}

	public List<DeptVO> getDeptList() throws Exception {
		return workScheduleDAO.getDeptList();
	}
	
	public WorkScheduleVO getDetail(WorkScheduleVO scheduleVO) throws Exception {
		return workScheduleDAO.getDetail(scheduleVO);
	}
	
	public int setDelete(WorkScheduleVO scheduleVO) throws Exception {
		return workScheduleDAO.setDelete(scheduleVO);
	}
	
	public int setUpdate(WorkScheduleVO scheduleVO) throws Exception {
		return workScheduleDAO.setUpdate(scheduleVO);
	}
	
	public int checkSch(WorkScheduleVO scheduleVO) throws Exception {
		return workScheduleDAO.checkSch(scheduleVO);
	}
	
}