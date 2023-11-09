package com.vet.main.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;
import com.vet.main.file.FileVO;

@Mapper
public interface ApprovalDAO {

	// 기안작성폼에 기안자 정보 가져오기
	public EmpVO getApUser(EmpVO empVO) throws Exception;

	// 품의서 작성폼
	public int setApPoomAdd(ApprovalVO approvalVO) throws Exception;
	
	// 휴가신청서 작성폼
	public int setApDayoffAdd(ApprovalVO approvalVO) throws Exception;
	
	// 휴직신청서 작성폼
	public int setApVacationAdd(ApprovalVO approvalVO) throws Exception;
	
	// 퇴직신청서 작성폼
	public int setApRetireAdd(ApprovalVO approvalVO) throws Exception;
	
	// 지출결의서 작성폼
	public int setApExpenseAdd(ApprovalVO approvalVO) throws Exception;
	
	// 지출항목 추가
	public int setExpenseAdd(ApprovalExpenseVO expenseVO) throws Exception;
	
	// 기안서 상세
	public ApprovalVO getApDetail(ApprovalVO approvalVO) throws Exception;
	
	// 기안서(지출결의서) 상세
	public ApprovalVO getApExpenseDetail(ApprovalVO approvalVO) throws Exception;
	
	// 기안서 수정
	public int setApUpdate(ApprovalVO approvalVO) throws Exception;
	
	
	// 기안함 리스트
	public List<ApprovalVO> getDraftList(Pager pager) throws Exception;
	
	// 결재함 리스트
	public List<ApprovalVO> getApproverList(Pager pager) throws Exception;
	
	// pager 관련 (해당 유저 기안함의 총 게시글 수를 구하기 위함)
	public Long getDraftTotal(Pager pager) throws Exception;
	
	// pager 관련 (해당 유저에게 전달된 결재의 총 수를 구하기 위함)
	public Long getApproverTotal(Pager pager) throws Exception;
	
	
	// file
	public int setApFileAdd(FileVO fileVO) throws Exception;
	
	// 결재선 설정에 부서 클릭시 파라미터를 받기위함
	public List<EmpVO> selectDept(String deptName) throws Exception;
	
	// 결재선 설정에 부서별 직원 리스트 출력
	public List<EmpVO> getEmpSelectList(String deptName) throws Exception;
	
	public List<EmpVO> getPositionEmp(String deptName) throws Exception;
	
	// 상세페이지에 결재자 출력
	public List<ApprovalLineVO> getApLinePerson(Long apNo) throws Exception;
	
	// 반려
	public int rejectApprove(ApprovalVO approvalVO) throws Exception;

	
}
