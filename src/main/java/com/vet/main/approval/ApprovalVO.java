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
public class ApprovalVO {
	private Long apNo;
	private String username;
	private Long apFormatNo;
	private String apTitle;
	private Date apCDate;
	private Date apUDate;
	private String dayoffStartDate;
	private String dayoffEndDate;
	private String apContents;
	private String apState;
	private String apRejection;
	private String dayoffKind;
	private String dayoffTime;
	private Double dayoffSelectDate;
	private String apKind;
	private Long priceSum;
	
	private String positionName;
	private String deptName;
	private String empName;
	
	// sign (도장)
	private String signName;
	private String uploadName;
	private String originalSignName;
	private Date addDate;
	
	private List<EmpVO> getApUserList;
	private List<ApprovalFileVO> fileList;
	private List<ApprovalExpenseVO> expenseList;
	private List<ApprovalLineVO> apLineList;
	private List<EmpVO> printEmpList;
}
