package com.vet.main.attendance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	
	public List<AttendanceVO> getAttList(AttendanceVO attendanceVO) throws Exception;
	
	public int setAttIn(AttendanceVO attendanceVO) throws Exception;
	
	public int setAttOut(AttendanceVO attendanceVO) throws Exception;
	
	public AttendanceVO checkDate(AttendanceVO attendanceVO) throws Exception;
	
	public String getHireDate(String username) throws Exception;
	
	public String getCurDate() throws Exception;

}