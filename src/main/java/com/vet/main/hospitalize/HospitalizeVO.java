package com.vet.main.hospitalize;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
public class HospitalizeVO {
	private Long historyNo;
	private Date startDate;
	private Date lastDate;
	private Long cageNo;
	private Character state;	
	
	private String username;
	private Long customerNo;	
}
