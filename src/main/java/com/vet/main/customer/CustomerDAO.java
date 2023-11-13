package com.vet.main.customer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vet.main.file.FileVO;
import com.vet.main.commons.Pager;

@Mapper
public interface CustomerDAO {
	
	//고객 총합
	public Long getTotal(Pager pager) throws Exception;
	
	//고객 목록
	public List<CustomerVO> getList(Pager pager) throws Exception;
		
	//고객 등록
	public int setAdd(CustomerVO customerVO) throws Exception;
	
	//사진 추가
	public int setFileAdd(FileVO fileVO) throws Exception;
	
	//고객 상세
	public CustomerVO getDetail(CustomerVO customerVO) throws Exception;
	
	//고객 수정
	public int setUpdate(CustomerVO customerVO) throws Exception;

	//고객 삭제
	public int setDelete(CustomerVO customerVO) throws Exception;
	
	//파일 삭제
	public int fileUpdateDelete(CustomerFileVO customerFileVO) throws Exception;
	
	public List<CustomerFileVO> getFileDelete(CustomerVO customerVO) throws Exception;
}
