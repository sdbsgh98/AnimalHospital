package com.vet.main.reservation.treatment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.vet.main.customer.CustomerVO;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;

@Mapper
public interface TreatmentDAO {

//	public List<Map<String,Object>> getScheduleList();
	public List<TreatmentVO> getScheduleList();
	public List<TreatmentVO> getDeptScheduleList(String deptNo);
	public int setTreatmentAdd(TreatmentVO treatmentVO);
	public List<CustomerVO> getCustomerList(String animalName);
	public List<EmpVO> getEmpList(String deptNo);
	public List<DeptVO> getDeptList();
	public List<EmpVO> getAllEmpList();
	public TreatmentVO getDetail(TreatmentVO treatmentVO);
	public int setDelete(TreatmentVO treatmentVO);
	public int setUpdate(TreatmentVO treatmentVO);
	public List<TreatmentVO> getTreatment();
	public int reservedTreat(TreatmentVO treatmentVO);
	public List<TreatmentVO> getPersonSchedule(String username);
}
