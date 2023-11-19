package com.vet.main.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalService {
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	@Autowired
	private FileManager fileManager;
	
	// spEl
	// properties 값을 java 사용
	// @Value("${properties의 키}")
	@Value("${app.upload}")	// !!!롬복 어노테이션 아님!!!
	private String uploadPath;
	
	@Value("${app.approval}")
	private String apKind;
	
	
	// 기안작성폼에 기안자 정보 가져오기
	public EmpVO getApUser(EmpVO empVO) throws Exception {
		return approvalDAO.getApUser(empVO);
	}
		
	// 품의서 작성폼
	public int setApPoomAdd(ApprovalVO approvalVO) throws Exception {
		int result = approvalDAO.setApPoomAdd(approvalVO);
		return result;
	}
	
	// 휴가신청서 작성폼
	public int setApDayoffAdd(ApprovalVO approvalVO) throws Exception {
		int result = approvalDAO.setApDayoffAdd(approvalVO);
		return result;
	}
	
	// 휴직신청서 작성폼
	public int setApVacationAdd(ApprovalVO approvalVO) throws Exception {
		int result = approvalDAO.setApVacationAdd(approvalVO);
		return result;
	}
	
	// 퇴직신청서 작성폼
	public int setApRetireAdd(ApprovalVO approvalVO) throws Exception {
		int result = approvalDAO.setApRetireAdd(approvalVO);
		return result;
	}
	
	// 지출결의서 작성폼
	public int setApExpenseAdd(ApprovalVO approvalVO) throws Exception {
    	int result = approvalDAO.setApExpenseAdd(approvalVO);
    	
		/*
		 * for(MultipartFile multipartFile : files) {
		 * 
		 * if(multipartFile.isEmpty()) { continue; }
		 * 
		 * ApprovalFileVO fileVO = new ApprovalFileVO(); String fileName =
		 * fileManager.save(this.uploadPath + this.apKind, multipartFile);
		 * fileVO.setApNo(approvalVO.getApNo()); fileVO.setFileName(fileName);
		 * fileVO.setOriginalFileName(multipartFile.getOriginalFilename());
		 * 
		 * result = approvalDAO.setApFileAdd(fileVO); }
		 */
		return result;
	}
	
	// 지출결의서에서 지출내역 추가
	public int setExpenseAdd(ApprovalExpenseVO expenseVO) throws Exception {	
		return approvalDAO.setExpenseAdd(expenseVO);
	}
	
	// 수정페이지에서 지출항목 삭제
	public int setExpenseDelete(ApprovalExpenseVO expenseVO) throws Exception {
		return approvalDAO.setExpenseDelete(expenseVO);
	}

	// 기안함 리스트
	public List<ApprovalVO> getDraftList(Pager pager) throws Exception {
		pager.setPerPage(10L);
		pager.makeRowNum();
		Long totalCount = approvalDAO.getDraftTotal(pager);
		pager.makePageNum(totalCount);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
		return approvalDAO.getDraftList(pager);
	}
	
	// 결재함 리스트
	public List<ApprovalVO> getApproverList(Pager pager) throws Exception {
		pager.setPerPage(10L);
		pager.makeRowNum();
		Long totalCount = approvalDAO.getApproverTotal(pager);
		pager.makePageNum(totalCount);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
		return approvalDAO.getApproverList(pager);
	}
	
	// 기안 내용 상세
	public ApprovalVO getApDetail(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.getApDetail(approvalVO);
	}
	
	// 지출내역 데이터 가져오기
	public ApprovalVO getApExpenseDetail(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.getApExpenseDetail(approvalVO);
	}
	
	// 결재선 설정에 부서별 직원 리스트 출력
	public List<EmpVO> getEmpSelectList(String deptName) throws Exception {
		return approvalDAO.getEmpSelectList(deptName);
	}
	
	// 결재선 설정에 부서별 직원 리스트 출력 (대표원장)
	public List<EmpVO> getPositionEmp(String deptName) throws Exception {
		return approvalDAO.getPositionEmp(deptName);
	}
	
	// 결재자 설정
	public int setApLine(ApprovalLineVO approvalLineVO) throws Exception {
		return approvalDAO.setApLine(approvalLineVO);
	}
	
	public List<EmpVO> selectDept(String deptName) throws Exception {
		return approvalDAO.selectDept(deptName);
	}
	
	// 상세페이지에 결재자 출력
	public List<ApprovalLineVO> getApLinePerson(Long apNo) throws Exception {
		return approvalDAO.getApLinePerson(apNo);
	}
	
	// 상세페이지에 결재자 도장 출력
	public List<ApprovalLineVO> getApSign(ApprovalLineVO approvalLineVO) throws Exception {
		return approvalDAO.getApSign(approvalLineVO);
	}
	
	// 반려
	public int rejectApprove01(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.rejectApprove01(approvalVO);
	}
	
	// 결재상태 업데이트 01 (결재대기 / 결재진행)
	public int setApState(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.setApState(approvalVO);
	}
	
	// 결재상태 업데이트 02 (결재자 정보)
	public int setApprover(ApprovalLineVO approvalLineVO) throws Exception {
		return approvalDAO.setApprover(approvalLineVO);
	}
	
	// 결재자 수와 결재가 남았는지 확인
	public ApprovalLineVO getApprovalState(Long apNo) throws Exception {
		return approvalDAO.getApprovalState(apNo);
	}
	
	// 기안서 수정
	public int setApUpdate(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.setApUpdate(approvalVO);
	}
	
	// 기안서 삭제
	public int setApDelete(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.setApDelete(approvalVO);
	}
	
	// 결재선 리셋
	public int resetApLine(Long apNo) throws Exception {
		return approvalDAO.resetApLine(apNo);
	}
	
	// 휴가신청서 수정
	public int setDayoffUpdate(ApprovalVO approvalVO) throws Exception {
		return approvalDAO.setDayoffUpdate(approvalVO);
	}
	
	// 지출항목 수정
	public int setApExpenseUpdate(ApprovalVO approvalVO) throws Exception{
		return approvalDAO.setApExpenseUpdate(approvalVO);
	}
	
	// 지출결의서 수정
	public int setExpenseUpdate(ApprovalExpenseVO approvalExpenseVO) throws Exception{
		return approvalDAO.setExpenseUpdate(approvalExpenseVO);
	}
	
	public int setApFileDelete(ApprovalFileVO noticeFileVO) throws Exception {
		return approvalDAO.setApFileDelete(noticeFileVO);
	}
	
	public int updateDayoff(Double dayoff) throws Exception {
		return approvalDAO.updateDayoff(dayoff);
	}
	
	public List<ApprovalVO> getMainApprove(String username) throws Exception {
		return approvalDAO.getMainApprove(username);
	}
	
	public List<ApprovalLineVO> getMainApLineInfo() throws Exception {
		return approvalDAO.getMainApLineInfo();
	}
	
	public Double getDayoffCount(String username) throws Exception {
		return approvalDAO.getDayoffCount(username);
	}

}
