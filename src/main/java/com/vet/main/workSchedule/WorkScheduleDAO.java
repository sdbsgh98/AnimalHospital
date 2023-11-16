package com.vet.main.workSchedule;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpVO;
import com.vet.main.reservation.surgery.SurgeryVO;

@Mapper
public interface WorkScheduleDAO {

	public List<WorkScheduleVO> getWorkList() throws Exception;
	
	public int addWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;
	
	public int updateWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;

	public WorkScheduleVO getWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;

	public int delWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;
}
