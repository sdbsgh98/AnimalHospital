package com.vet.main.hospitalize;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.customer.CustomerVO;

@Mapper
public interface HospitalizeDAO {
	
	public int setHospitalize(HospitalizeVO hospitalizeVO);
	public List<CustomerVO> getCustomerList(String animalName);
	public CustomerVO getCustomer(CustomerVO customerVO);
	public List<HospitalizeVO> getHospitalize();
	public HospitalizeVO getDetail(Long historyNo);
	public int setUpdate(HospitalizeVO hospitalizeVO);
	public int setDelete(HospitalizeVO hospitalizeVO);
}
