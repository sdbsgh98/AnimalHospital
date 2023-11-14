package com.vet.main.attendance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/attendance/*")
@Slf4j
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
}
