package com.vet.main.reservation.surgery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SurgeryService {
	
	@Autowired
	private SurgeryDAO surgeryDAO;
	
	public List<SurgeryVO> getScheduleList()throws Exception{
		return surgeryDAO.getScheduleList();
	}
	
	public int setSurgeryAdd(SurgeryVO surgeryVO)throws Exception{
		return surgeryDAO.setSurgeryAdd(surgeryVO);
	}
	
	public List<CustomerVO> getCustomerList(String animalName) throws Exception{
		return surgeryDAO.getCustomerList(animalName);
	}
	
	public List<EmpVO> getEmpList() throws Exception{
		return surgeryDAO.getEmpList();
	}
	
	public SurgeryVO getDetail(SurgeryVO surgeryVO) throws Exception{
		return surgeryDAO.getDetail(surgeryVO);
	}
	
	public int setDelete(SurgeryVO surgeryVO)throws Exception{
		return surgeryDAO.setDelete(surgeryVO);
	}
	
	public int setUpdate(SurgeryVO surgeryVO)throws Exception{
		return surgeryDAO.setUpdate(surgeryVO);
	}
}
