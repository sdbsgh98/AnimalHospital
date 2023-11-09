package com.vet.main.dept;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;

@Mapper
public interface DeptDAO {

	public Long getTotal(Pager pager) throws Exception;
	
	public List<DeptVO> getEmpList(Pager pager)throws Exception;
	
	public List<DeptVO> deptList()throws Exception;
	
	public DeptVO selectDept(DeptVO deptVO)throws Exception;
	
	public int deptAdd(DeptVO deptVO)throws Exception;
	
	public int deptUpdate(DeptVO deptVO)throws Exception;
	
	public int deptDelete(DeptVO deptVO)throws Exception;
	
	// 결재선
	public List<DeptVO> getApLineDept() throws Exception;
	
	public List<DeptVO> selectApLineDept() throws Exception;
	
	public DeptVO deptDetail(DeptVO deptVO)throws Exception;
	
	public List<DeptVO> getPositionNo(int deptNo)throws Exception;
}
