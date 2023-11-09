package com.vet.main.emp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptVO;


@Mapper
public interface EmpDAO {

	public Long getTotal(Pager pager) throws Exception;
	
	public EmpVO getEmp (EmpVO empVO)throws Exception; 
	
	public EmpVO getLogin(String empNo)throws Exception;
	
	public EmpVO mypage(EmpVO empVO)throws Exception;
	
	public int mypageUpdate(EmpVO empVO)throws Exception;
	
	public List<EmpVO> empList(Pager pager)throws Exception;
	
	public int empAdd(EmpVO empVO) throws Exception;
	
	public EmpVO empDetail(EmpVO empVO)throws Exception;
	
	public int empUpdate(EmpVO empVO)throws Exception;
	
	public int pwdCheck(EmpVO empVO)throws Exception;
	
	public int pwUpdate(EmpVO empVO)throws Exception;

//	public void save(EmpVO empVO);
	
	public int empRole(Map<String, Object> map)throws Exception; //회원가입시 권한 부여하는 것
	
	public List<DeptVO> getPositionNo(String deptNo)throws Exception; //positionNo 선택창
	
	public List<DeptVO> getDeptNo()throws Exception; //deptNo 선택창
	
	public EmpVO findUser(EmpVO empVO)throws Exception;
	
	// sign
	public EmpVO signList(EmpVO empVO)throws Exception;
	
	public int signAdd(EmpVO empVO) throws Exception;
	
}
