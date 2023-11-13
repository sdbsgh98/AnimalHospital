package com.vet.main.dept;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.DeptPager2;
import com.vet.main.commons.Pager;

@Mapper
public interface DeptDAO {

	public Long getTotal(DeptPager deptPager) throws Exception;
	
	public Long getTotal2(DeptPager2 deptPager2) throws Exception;
	
	public List<DeptVO> getEmpList(DeptPager deptPager)throws Exception;
	
	public List<DeptVO> detailEmp(DeptPager2 deptPager2)throws Exception;
	
	public List<DeptVO> deptList()throws Exception;
	
	public List<DeptVO> deptPosition()throws Exception;
	
	public List<DeptVO> selectDept()throws Exception;
	
	public int deptAdd(DeptVO deptVO)throws Exception;
	
	public int deptUpdate(DeptVO deptVO)throws Exception;
	
	public int deptDelete(DeptVO deptVO)throws Exception;
	
	// 결재선
	public List<DeptVO> getApLineDept() throws Exception;
	
	public List<DeptVO> selectApLineDept() throws Exception;
	
	//public DeptVO deptDetail(DeptVO deptVO)throws Exception;
	
	public DeptVO getDeptDetails(String deptNo);
	
	public DeptVO deptDetail(DeptVO deptVO);
	
	public List<DeptVO> getDeptPosition(DeptVO deptVO)throws Exception;
	
	public int positionAdd(DeptVO deptVO)throws Exception;
}

