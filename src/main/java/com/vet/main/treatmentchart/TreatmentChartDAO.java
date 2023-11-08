package com.vet.main.treatmentchart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.commons.Pager;
import com.vet.main.emp.EmpVO;
import com.vet.main.file.FileVO;
import com.vet.main.medicine.MedicineDAO;
import com.vet.main.medicine.MedicineVO;

@Mapper
public interface TreatmentChartDAO {
	
	//진료차트총합
	public Long getTotal(Pager pager) throws Exception;
	
	//진료차트목록
	public List<TreatmentChartVO> getList(Pager pager) throws Exception;
	
	//진료차트추가
	public int setAdd(TreatmentChartVO treatmentChartVO) throws Exception;

	//진료차트상세
	public TreatmentChartVO getDetail(TreatmentChartVO treatmentChartVO) throws Exception;
	
	//진료차트수정
	public int setUpdate(TreatmentChartVO treatmentChartVO) throws Exception;
	
	//사진첨부
	public int setFileAdd(FileVO fileVO) throws Exception;
	
	//파일상세
	public TreatmentChartFileVO getFileDetail(TreatmentChartFileVO treatmentChartFileVO) throws Exception;
	
	//파일삭제
	public int setFileDelete(TreatmentChartFileVO treatmentChartFileVO) throws Exception;
	
	//약품조회
	public List<MedicineVO> getMedicineList() throws Exception;
}
