package com.vet.main.attendance;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AttendanceVO {
	private String username;
	private LocalDateTime attIn;
	private LocalDateTime attOut;
	private Integer attState;
	private Double atDayoffCount;
	private Long attNo;
	
	private String positionName;
	private String deptNo;
	private String empName;
}
