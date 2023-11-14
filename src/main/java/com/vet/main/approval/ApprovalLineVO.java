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
	private String username;
	private String empName;
	private String apConfirmState;
	private Date apConfirmDate;
	private String aplStep;
	
	private String positionName;
	
	//sign
	private String signName;
	private String uploadName;
	private String originalSignName;
	private Date addDate;
	
	// 결재자 수, 미결기안 수
	private Long aplCount;
	private Long notSign;
	
	
}