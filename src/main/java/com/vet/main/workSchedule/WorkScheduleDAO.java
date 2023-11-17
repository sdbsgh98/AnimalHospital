package com.vet.main.workSchedule;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.dept.DeptVO;

@Mapper
public interface WorkScheduleDAO {

	public List<WorkScheduleVO> getScheduleList() throws Exception;
	
	public List<WorkScheduleVO> getDeptScheduleList(String deptNo) throws Exception;
	
	public int setWorkAdd(WorkScheduleVO scheduleVO) throws Exception;
	
	public List<DeptVO> getDeptList() throws Exception;
	
	public WorkScheduleVO getDetail(WorkScheduleVO scheduleVO) throws Exception;
	
	public int setDelete(WorkScheduleVO scheduleVO) throws Exception;
	
	public int setUpdate(WorkScheduleVO scheduleVO) throws Exception;
	
	public int checkSch(WorkScheduleVO scheduleVO) throws Exception;
	
}