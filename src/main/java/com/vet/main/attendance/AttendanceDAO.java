package com.vet.main.attendance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpVO;

@Mapper
public interface AttendanceDAO {
	
	public List<AttendanceVO> getAttList(Pager pager) throws Exception;
	
	public Long getAttTotal(Pager pager) throws Exception;
	
	public int setAttIn(AttendanceVO attendanceVO) throws Exception;
	
	public int setAttOut(AttendanceVO attendanceVO) throws Exception;
	
	public AttendanceVO checkDate(AttendanceVO attendanceVO) throws Exception;
	
	public String getHireDate(String username) throws Exception;
	
	public String getCurDate() throws Exception;
	
	public int setDayoffCount(EmpVO empVO) throws Exception;
	
	public Double getDayoffCount(String username) throws Exception;
	
	public List<EmpVO> getEmpList() throws Exception;

}