package com.vet.main.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vet.main.file.FileVO;
import com.vet.main.commons.FileManager;
import com.vet.main.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerService {

	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private FileManager fileManger;
	
	//spEl
	//properties 값을 java 사용
	//@Value("${properties의 키}")
	@Value("${app.upload}")
	private String uploadPath;
		
	@Value("${app.customer}")
	private String customerNo;
	
	//고객목록
	public List<CustomerVO> getList(Pager pager) throws Exception {
		Long totalCount = customerDAO.getTotal(pager);
		pager.makeNum(totalCount);
		pager.makeStartRow();
		return customerDAO.getList(pager);
	}
	
	//고객추가(이미지포함)
	public int setAdd(CustomerVO customerVO, MultipartFile[] files) throws Exception {
		int result = customerDAO.setAdd(customerVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			CustomerFileVO fileVO = new CustomerFileVO();
			String fileName = fileManger.save(this.uploadPath + this.customerNo, multipartFile);
			fileVO.setCustomerNo(customerVO.getCustomerNo());
			fileVO.setFileName(fileName);
			fileVO.setOriginalFileName(multipartFile.getOriginalFilename());
			result = customerDAO.setFileAdd(fileVO);
		}
		
		return result;
	}
	
	//고객상세
	public CustomerVO getDetail(CustomerVO customerVO) throws Exception {
		return customerDAO.getDetail(customerVO);
	}
	
	//고객수정
	public int setUpdate(CustomerVO customerVO, MultipartFile[] files) throws Exception {
		int result = customerDAO.setUpdate(customerVO);
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			CustomerFileVO fileVO = new CustomerFileVO();
			String fileName = fileManger.save(this.uploadPath + this.customerNo, multipartFile);
			fileVO.setCustomerNo(customerVO.getCustomerNo());
			fileVO.setFileName(fileName);
			fileVO.setOriginalFileName(multipartFile.getOriginalFilename());
			result = customerDAO.setFileAdd(fileVO);
		}
		
		return result;
	}
	
	//고객삭제
	public int setDelete(CustomerVO customerVO) throws Exception {
		//파일 먼저 삭제
		List<CustomerFileVO> list = customerDAO.getFileDelete(customerVO);
		
		for(CustomerFileVO customerFileVO: list) {
			if(customerFileVO == null) {
				continue;
			}
			fileManger.fileDelete(customerFileVO, this.uploadPath + this.customerNo);
		}
		
		//DB삭제
		int result = customerDAO.setDelete(customerVO);
		
		return result;
	}
	
	//파일삭제
	public int fileUpdateDelete(CustomerFileVO customerFileVO) throws Exception {
		// 가져올 데이터로 폴더 삭제
		log.info("파일이름 : {} ", customerFileVO.getFileName());
		log.info("파일번호 : {} ", customerFileVO.getFileNo());
		
		fileManger.fileDelete(customerFileVO, this.uploadPath + this.customerNo);
		
		int result = customerDAO.fileUpdateDelete(customerFileVO);
		
		return result;
	}
	
}
