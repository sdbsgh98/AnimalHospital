package com.vet.main.attendance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {

	@Autowired
	private AttendanceDAO attendanceDAO;
	
	
}
