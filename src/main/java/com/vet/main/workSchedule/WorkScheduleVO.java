package com.vet.main.workSchedule;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class WorkScheduleVO {
	private Long workNo;
	private String username;
	private LocalDateTime workStart;
	private LocalDateTime workEnd;
	private String deptName;
	private String positionName;
	private String empName;
	private String deptNo;
}
