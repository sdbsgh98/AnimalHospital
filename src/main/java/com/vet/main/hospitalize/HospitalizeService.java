package com.vet.main.hospitalize;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.customer.CustomerVO;

@Service
public class HospitalizeService {

	@Autowired
	private HospitalizeDAO hospitalizeDAO;
	
	public int setHospitalize(HospitalizeVO hospitalizeVO) throws Exception{
		
		return hospitalizeDAO.setHospitalize(hospitalizeVO);
	}
	
	public List<CustomerVO> getCustomerList(String animalName)throws Exception{
		return hospitalizeDAO.getCustomerList(animalName);
	}
	
	public CustomerVO getCustomer(CustomerVO customerVO)throws Exception{
		return hospitalizeDAO.getCustomer(customerVO);
	}
}
