package com.vet.main.reservation.surgery;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@Slf4j
public class SurgeryVO {
	private Long surgeryNo;
	private LocalDateTime surgeryStart;
	private LocalDateTime surgeryEnd;
	private String surgeryRoom;
	private String surgeryName;
	
	private Long customerNo;
	private String animalName;
	private String name;
	
	private String userName;
	private String deptNo;
	private String empName;
}
