<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 날짜포맷 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">반려 사유 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	  <div>
      			<input type="hidden" id="apNo" name="apNo" value="${approvalVO.apNo}">
		          <div class="mb-3">
		            <label for="toApTitle" class="col-form-label">대상 기안서:</label>
		            <input type="text" class="form-control" id="toApTitle" value="${approvalVO.apTitle}" disabled>
		          </div>
		          <div class="mb-3">
		            <label for="apRejection" class="col-form-label">반려 사유</label>
		            <textarea class="form-control" id="apRejection"></textarea>
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-warning" id="rejectSubmitBtn">반려</button>
		      </div>
	      </div>
	    </div>
	  </div>
	 </div>

