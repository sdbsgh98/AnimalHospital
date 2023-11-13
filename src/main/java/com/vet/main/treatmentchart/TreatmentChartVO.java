package com.vet.main.treatmentchart;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TreatmentChartVO {
	
	private Long chartNo;
	private String contents;
	private String disease;
	private Date date;
	private Long customerNo;
	private Long username;
	private Long medicineNo;
	private Long count;
	
	private String name;
	private String empName;
	
	private List<TreatmentChartFileVO> fileVOs;
	
}
