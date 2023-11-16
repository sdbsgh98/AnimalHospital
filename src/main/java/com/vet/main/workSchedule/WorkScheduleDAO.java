package com.vet.main.workSchedule;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WorkScheduleDAO {

	
	public int addWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;
	
	public int updateWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;

	public WorkScheduleVO getWorkSchedule(WorkScheduleVO workScheduleVO) throws Exception;
	
}