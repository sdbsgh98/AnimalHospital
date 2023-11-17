package com.vet.main.dept;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vet.main.commons.DeptPager;
import com.vet.main.commons.DeptPager2;

@Service
public class DeptService {

	@Autowired
	private DeptDAO deptDAO;
	
	
	public List<DeptVO> getEmpList(DeptPager deptPager)throws Exception{
		deptPager.setPerPage(5L);
		deptPager.makeRowNum();
		Long totalCount = deptDAO.getTotal(deptPager);
		deptPager.makePageNum(totalCount);

/*	public List<DeptVO> getEmpList(Pager pager)throws Exception{
		pager.setPerPage(10L);
		pager.makeRowNum();
		Long totalCount = deptDAO.getTotal(pager);
		pager.makePageNum(totalCount);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
*/
		
		return deptDAO.getEmpList(deptPager);
	}
	
	public List<DeptVO> detailEmp(DeptPager2 deptPager2)throws Exception{
		Long totalCount = deptDAO.getTotal2(deptPager2);
		deptPager2.makePageNum(totalCount);
		deptPager2.setPerPage(5L);
		deptPager2.makeRowNum();
		
		return deptDAO.detailEmp(deptPager2);
	}
	
	public List<DeptVO> deptList()throws Exception{
		return deptDAO.deptList();
	}
	
	public List<DeptVO> selectDept()throws Exception{
		return deptDAO.selectDept();
	}
	
	public List<DeptVO> deptPosition()throws Exception{
		return deptDAO.deptPosition();
	}
	
	public int deptAdd(DeptVO deptVO)throws Exception{
		
		int result = deptDAO.deptAdd(deptVO);
		
		return result;
	}
	
	public int deptUpdate(DeptVO deptVO)throws Exception{
		int result = deptDAO.deptUpdate(deptVO);
		return result;
	}
	
	public int positionUpdate(DeptVO deptVO)throws Exception{
		int result = deptDAO.positionUpdate(deptVO);
		return result;
	}
	
	public int deptDelete(DeptVO deptVO)throws Exception{
		int result = deptDAO.deptDelete(deptVO);
		
		return result;
	}
	
	public int positionDelete(DeptVO deptVO)throws Exception{
		int result = deptDAO.positionDelete(deptVO);
		
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
	
	public List<DeptVO> getDeptPosition(DeptVO deptVO) throws Exception{
		return deptDAO.getDeptPosition(deptVO);
	}
	
    public DeptVO getDeptDetails(String deptNo) throws Exception{
        return deptDAO.getDeptDetails(deptNo);
    }
    
    public int positionAdd(DeptVO deptVO)throws Exception{
    	
    	int result = deptDAO.positionAdd(deptVO);
    	return result;
    }
    
    public int positionDeleteSelect(DeptVO deptVO)throws Exception{
    	return deptDAO.positionDeleteSelect(deptVO);
    }
}
