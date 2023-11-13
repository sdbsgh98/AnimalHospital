package com.vet.main.approval;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalExpenseVO {
	private Long apNo;
	private String expenseName;
	private Long expensePrice;
	private Long expenseAmount;
	private String expenseBigo;
	private Long expenseNo;
	
	
	public void setExpenseBigo(String string) {
		if(this.expenseBigo == null || this.expenseBigo.isEmpty()) {
			this.expenseBigo = "";
		}
	}
}
