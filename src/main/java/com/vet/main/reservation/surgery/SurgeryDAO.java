package com.vet.main.reservation.surgery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.customer.CustomerVO;
import com.vet.main.emp.EmpVO;

@Mapper
public interface SurgeryDAO {
	
	public List<SurgeryVO> getScheduleList();
	public int setSurgeryAdd(SurgeryVO surgeryVO);
	public List<CustomerVO> getCustomerList(String animalName);
	public List<EmpVO> getEmpList();
	public SurgeryVO getDetail(SurgeryVO surgeryVO);
	public int setDelete(SurgeryVO surgeryVO);
	public int setUpdate(SurgeryVO surgeryVO);
}
