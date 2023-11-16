package com.vet.main.customer;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerVO {

	private Long customerNo;
	private String animalName;
	private String gender;
	private Long age;
	private Long weight;
	private String kind;
	private String neutering;
	private String name;
	private String phone;
	private String address;

	private String username;
	public List<CustomerFileVO> fileVO;
	
}
