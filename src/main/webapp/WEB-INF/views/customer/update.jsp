<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>고객수정페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
					<h3>고객정보수정</h3>
					<div class="card shadow mb-4" style="align-items: center;">
						<form action="./update" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="customerNo" value="${vo.customerNo}">
		
								<div>	
									<div style="width: 550px; margin-top: 50px;">
									
										 <div class="mb-3 row">
										    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">이름</label>
										    	<div class="col-sm-10">
										      		<input type="text" readonly class="form-control-plaintext" id="animalName" value="${vo.animalName}">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">나이</label>
										    	<div class="col-sm-10">
										      		<input type="text" name="age" class="form-control" id="age" value="${vo.age}">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">성별</label>
										    	<div class="col-sm-10">
										      		<input type="text" readonly class="form-control-plaintext" id="gender" value="${vo.gender}">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">중성화</label>
										    	<div class="col-sm-10">
										      		<select class="form-select" aria-label="Default select example" name='neutering'>
														<option value="${vo.neutering}" selected="selected">${vo.neutering}</option>
														<option value="yes">yes</option>
														<option value="no">no</option>
													</select>
										    	</div>
										 </div>
										 <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">몸무게</label>
										    	<div class="col-sm-10">
										      		<input type="text" name="weight" class="form-control" id="weight" value="${vo.weight}">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">종류</label>
										    	<div class="col-sm-10">
										      		<input type="text" readonly class="form-control-plaintext" id="kind" value="${vo.kind}">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										    <label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">보호자</label>
										    	<div class="col-sm-10">
										      		<input type="text" name="name" class="form-control" id="name" value="${vo.name}" placeholder="보호자이름을 입력하세요.">
										    	</div>
										 </div>
										 <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">전화번호</label>
										    	<div class="col-sm-10">
										      		<input type="text" name="phone" class="form-control" id="phone" value="${vo.phone}" placeholder="전화번호를 입력하세요.">
										    	</div>
										 </div>
										 <%-- <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">주소</label>
										    	<div class="col-sm-10">
										      		<div>      			
										                <input type="text" name="address" class="form-control" id="postcode" placeholder="우편번호"
										            	readonly>
										            	<button type="button" class="btn btn-primary" id="addressSearch">우편번호찾기</button>
										            </div>
											        <div class="field">       
											            <div>
											                <input type="text" name="address" class="form-control" id="address" value="${vo.address}" placeholder="주소"
											            readonly>
											            </div>
											            <div>
											            	<input type="text" name="address" class="form-control" id="detailAddress" placeholder="상세주소입력">                
											        	</div>
											        </div>
										    	</div>
										 </div> --%>
										 
										 <div class="mb-3 row">
				                          <label for="address" class="col-md-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">주소</label>
				                          <div class="col-md-10">
				                            <input class="form-control address input" name="address" type="text" id="address"  placeholder="우편번호" value="${vo.address}"/>
				                            <button type="button" id="addressBtn" class="btn btn-primary">우편번호 찾기</button>
				                            <input class="form-control" type="hidden" id="address"  placeholder="주소" />
				                            <input class="form-control" type="hidden" id="address"  placeholder="상세주소" value="" />
				                            <div id="aMsg"></div>
				                          </div>
				                        </div>
										 
										 <div class="mb-3 row">
										 	<label for="label" class="col-sm-2 col-form-label" style="text-align: center; font-weight: bold; font-size: medium;">사진</label>
										    	<div class="col-sm-10">
										      		<div class="mb-3">
														<button type="button" class="btn btn-primary" id="fileAdd">사진추가</button>
													</div>
													<div id="fileList" class="my-5">
											        	<c:forEach items="${vo.fileVO}" var="f">
											            	<div class="file-item mb-2">
											                	<span class="alert alert-primary me-2" role="alert" id="${f.originalFileName}">
											                    	첨부파일: ${f.originalFileName}
											                    </span>
											                 		<button class="delets x2 btn btn-danger" data-file="${f.fileName}" data-num="${f.fileNo}">삭제</button>
											                </div>
											         	</c:forEach>
											         </div>
										    	</div>
										 </div>
										
										<button class="btn btn-primary" style="float: right; margin-top: 20px; margin-bottom: 20px; margin-right: 10px;">수정</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				<!-- Content wrapper -->
				</div>
			<!-- / Layout page -->
			</div>
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>
	
	<!-- 카카오주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- <script src="/js/customer/add.js"></script> -->
    <!-- <script type="/js/customer/file.js"></script> -->
    <script type="text/javascript" src="/js/customer/customerUpdate.js"></script>
    
    <script>
	const fileList = document.getElementById("fileList");
	const fileAdd = document.getElementById("fileAdd");
	const deletes = document.getElementsByClassName("deletes");
	
	$('#fileList').on("click",'.x2',function(){
    	if(confirm("삭제시 복원이 불가능 합니다.")){
	    	let num = $(this).attr("data-num");
	    	let name = $(this).attr("data-file");
	    	
    		fileDelete(num, name);
    		
    		$(this).parent().remove();
	    	count --;
	    	
    	}
    })
    
    function fileDelete(fileNo, fileName){
    	$.ajax({
			type:"post",
			url:"./fileDelete",
			data:{
				"fileNo":fileNo,
				"fileName":fileName
			},
			success:function(response){
				r=response.trim();
				console.log(r);
				if(r>0){
					alert("삭제 성공");
				}else{
					alert("삭제 실패");
				}
				
			},
			error:function(){
				console.log("ajax 실패");
			}
		})
    }

	/* $('.deletes').click(function(){
	    let num = $(this).attr("data-delete-num");
	    let check = confirm("삭제시 복구 불가");
	   
	     if(check){
	     $.ajax({
	          type:'post',
	           url:'./fileDelete?fileNo='+num,
	           success:function(r){
	                if(r.trim()=='1'){
	                   $(this).remove();
	                        count--;
	                    }
	           }
	     })
	     }
	}) */

	let max = 1;
	let count = 0;

	if(deletes != null) {
	    count = deletes.length;
	}
	
	let idx = 0;

	$("#fileList").on("click", ".df", function(){
	    $(this).parent().remove();
	    count--;
	})

 	//jquery로 변경
	$("#fileAdd").click(function(){
	    if(count>=max){
	        alert("첨부파일은 최대 1개까지만 업로드 가능합니다.");
	        return;
	    }
	    count++;

	    let r = '<div class="input-group mb-3" id="file'+idx+'">'
	    r = r+'<input type="file" class="form-control" id="files" name="files">'
	    r = r+ '<button class="delets x2 btn btn-danger" data-id="file'+idx+'">삭제</button>'
	    r= r+"</div>";
	    idx++;

	    $("#fileList").append(r);

	});
	</script>
    
</body>
</html>