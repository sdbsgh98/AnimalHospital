package com.vet.main.dept;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.Pager;

@Service
public class DeptService {

	@Autowired
	private DeptDAO deptDAO;
	
	
	public List<DeptVO> getEmpList(DeptPager deptPager)throws Exception{
		Long totalCount = deptDAO.getTotal(deptPager);
		deptPager.makeNum(totalCount);
		deptPager.makeStartRow();
		
		return deptDAO.getEmpList(deptPager);
	}
	
	public List<DeptVO> deptList()throws Exception{
		return deptDAO.deptList();
	}
	
	public List<DeptVO> selectDept()throws Exception{
		return deptDAO.selectDept();
	}
	
	public int deptAdd(DeptVO deptVO)throws Exception{
		
		int result = deptDAO.deptAdd(deptVO);
		
		return result;
	}
	
	public int deptUpdate(DeptVO deptVO)throws Exception{
		int result = deptDAO.deptUpdate(deptVO);
		return result;
	}
	
	public int deptDelete(DeptVO deptVO)throws Exception{
		int result = deptDAO.deptDelete(deptVO);
		
		return result;
	}
	
	// 결재선
	public List<DeptVO> getApLineDept() throws Exception {
		return deptDAO.getApLineDept();
	}
	
	public List<DeptVO> selectApLineDept() throws Exception{
		return deptDAO.selectApLineDept();
	}
	
	public DeptVO deptDetail(DeptVO deptVO)throws Exception{
		return deptDAO.deptDetail(deptVO);
	}
	
	
}
