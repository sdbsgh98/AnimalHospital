package com.vet.main.approval;

import java.sql.Date;
import java.util.List;

import com.vet.main.emp.EmpVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
public class ApprovalLineVO {
	private Long apNo;
	private String userName;
	private String empName;
	private String apContfimeState;
	private String apContfimeDate;
	
	private String positionName;
}