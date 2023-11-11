package com.vet.main.treatmentchart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;
import com.vet.main.customer.CustomerFileVO;
import com.vet.main.emp.EmpVO;
import com.vet.main.medicine.MedicineVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TreatmentChartService {
	
	@Autowired
	private TreatmentChartDAO treatmentChartDAO;
	
	@Autowired 
	private FileManager fileManager;
	
	@Value("${app.upload}")
	private String uploadPath;
		
	@Value("${app.treatmentchart}")
	private String contents;
	
	//진료차트목록
	public List<TreatmentChartVO> getList(Pager pager) throws Exception {
		pager.setPerPage(10L);
		pager.makeRowNum();
		Long totalCount = treatmentChartDAO.getTotal(pager);
		pager.makePageNum(totalCount);
//		pager.makeNum(totalCount);
//		pager.makeStartRow();
		
		return treatmentChartDAO.getList(pager);
	}
	
	//진료차트추가
	public int setAdd(TreatmentChartVO treatmentChartVO, MultipartFile[] files) throws Exception {
		int result = treatmentChartDAO.setAdd(treatmentChartVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			TreatmentChartFileVO fileVO = new TreatmentChartFileVO();
			String fileName = fileManager.save(this.uploadPath + this.contents, multipartFile);
			fileVO.setChartNo(treatmentChartVO.getChartNo());
			fileVO.setFileName(fileName);
			fileVO.setOriginalFileName(multipartFile.getOriginalFilename());
			result = treatmentChartDAO.setFileAdd(fileVO);
		}
		
		return result;
	}
	
	//진료차트상세
	public TreatmentChartVO getDetail(TreatmentChartVO treatmentChartVO) throws Exception {
		return treatmentChartDAO.getDetail(treatmentChartVO);
	}
	
	//진료차트수정
	public int setUpdate(TreatmentChartVO treatmentChartVO, MultipartFile[] files, HttpSession session) throws Exception {
		int result =  treatmentChartDAO.setUpdate(treatmentChartVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			TreatmentChartFileVO fileVO = new TreatmentChartFileVO();
			String fileName = fileManager.save(this.uploadPath + this.contents, multipartFile);
			fileVO.setChartNo(treatmentChartVO.getChartNo());
			fileVO.setFileName(fileName);
			fileVO.setOriginalFileName(multipartFile.getOriginalFilename());
			result = treatmentChartDAO.setFileAdd(fileVO);
		}
		
		return result;
	}
	
	//약품조회
	public List<MedicineVO> getMedicineList() throws Exception {
		return treatmentChartDAO.getMedicineList();
	}
	
//	//파일삭제
//	public int setFileDelete(TreatmentChartFileVO treatmentChartFileVO) throws Exception {	
//		//폴더파일삭제
//		treatmentChartFileVO = treatmentChartDAO.getFileDetail(treatmentChartFileVO);
//		boolean flag = fileManager.fileDelete(treatmentChartFileVO, this.uploadPath + this.contents);
//		
//		log.info("파일이름 : {} ", treatmentChartFileVO.getFileName());
//		log.info("파일번호 : {} ", treatmentChartFileVO.getFileNo());
//		
//		if(flag) {
//			//DB삭제
//			return treatmentChartDAO.setFileDelete(treatmentChartFileVO);
//		}
//		
//		return 0;
//	}
	
	public int fileUpdateDelete(TreatmentChartFileVO treatmentChartFileVO) throws Exception {
		// 가져올 데이터로 폴더 삭제
		log.info("파일이름 : {} ", treatmentChartFileVO.getFileName());
		log.info("파일번호 : {} ", treatmentChartFileVO.getFileNo());
		fileManager.fileDelete(treatmentChartFileVO, this.uploadPath + this.contents);
		
		int result = treatmentChartDAO.fileUpdateDelete(treatmentChartFileVO);
		
		return result;
	}

}
