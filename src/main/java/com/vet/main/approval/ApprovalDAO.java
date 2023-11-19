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
	
	// 수정페이지에서 지출항목 삭제
	public int setExpenseDelete(ApprovalExpenseVO expenseVO) throws Exception;
	
	// 기안서 상세
	public ApprovalVO getApDetail(ApprovalVO approvalVO) throws Exception;
	
	// 기안서(지출결의서) 상세
	public ApprovalVO getApExpenseDetail(ApprovalVO approvalVO) throws Exception;
	
	// 기안서 수정
	public int setApUpdate(ApprovalVO approvalVO) throws Exception;
	
	// 기안서 삭제
	public int setApDelete(ApprovalVO approvalVO) throws Exception;
	
	
	// 기안함 리스트
	public List<ApprovalVO> getDraftList(Pager pager) throws Exception;
	
	// 결재함 리스트
	public List<ApprovalVO> getApproverList(Pager pager) throws Exception;
	
	// pager 관련 (해당 유저 기안함의 총 게시글 수를 구하기 위함)
	public Long getDraftTotal(Pager pager) throws Exception;
	
	// pager 관련 (해당 유저에게 전달된 결재의 총 수를 구하기 위함)
	public Long getApproverTotal(Pager pager) throws Exception;
	
	// 결재선 설정에 부서 클릭시 파라미터를 받기위함
	public List<EmpVO> selectDept(String deptName) throws Exception;
	
	// 결재선 설정에 부서별 직원 리스트 출력
	public List<EmpVO> getEmpSelectList(String deptName) throws Exception;
	
	// 결재선 설정에 부서별 직원 리스트 출력 (대표원장)
	public List<EmpVO> getPositionEmp(String deptName) throws Exception;
	
	// 결재자 설정
	public int setApLine(ApprovalLineVO approvalLineVO) throws Exception;

	// 상세페이지에 결재자 출력
	public List<ApprovalLineVO> getApLinePerson(Long apNo) throws Exception;
	
	// 상세페이지에 결재자 도장 출력
	public List<ApprovalLineVO> getApSign(ApprovalLineVO approvalLineVO) throws Exception; 
	
	// 반려
	public int rejectApprove01(ApprovalVO approvalVO) throws Exception;
	
	// 결재상태 업데이트 01 (결재대기 / 결재진행)
	public int setApState(ApprovalVO approvalVO) throws Exception;
	
	// 결재상태 업데이트 02 (결재자 정보)
	public int setApprover(ApprovalLineVO approvalLineVO) throws Exception;
	
	// 결재자 수와 결재가 남았는지 확인
	public ApprovalLineVO getApprovalState(Long apNo) throws Exception;
	
	// 결재선 리셋
	public int resetApLine(Long apNo) throws Exception;
	
	// 휴가신청서 수정
	public int setDayoffUpdate(ApprovalVO approvalVO) throws Exception;
	
	// 지출항목 수정
	public int setApExpenseUpdate(ApprovalVO approvalVO) throws Exception;
	
	// 지출결의서 수정
	public int setExpenseUpdate(ApprovalExpenseVO approvalExpenseVO) throws Exception;
	
	// file
	public int setApFileAdd(FileVO fileVO) throws Exception;
	
	public List<ApprovalFileVO> getApFileList(FileVO fileVO) throws Exception;
	
	public int setApFileDelete(FileVO fileVO) throws Exception;
	
	public ApprovalFileVO getApFileDetail(FileVO fileVO) throws Exception;
	
	public int updateDayoff(EmpVO empVO) throws Exception;
	
	public List<ApprovalVO> getMainApprove(String username) throws Exception;

	public List<ApprovalLineVO> getMainApLineInfo() throws Exception;
}
