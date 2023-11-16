<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jsp에서 properties 메세지를 사용할 수 있도록 하는 API -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="/assets/"
	data-template="vertical-menu-template-free">
<head>

<!-- include summernote -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">	  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- include summernote css/js-->
<link href="summernote.css">
<script src="summernote.js"></script>

<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>진료차트수정페이지</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page" style="align-items:center;">
			<sec:authentication property="Principal" var="user"/>
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card shadow mb-4" style="align-items: center;">
							<form action="./update" method="POST" id="frm" enctype="multipart/form-data">
								<input type="hidden" name="customerNo" value="${cus.customerNo}">
								<input type="hidden" name="chartNo" value="${vo.chartNo}">
								<div>
									<div style="width: 700px; margin-top: 20px;">
										<div>
											<table class="table">
												<tr>
													<td rowspan="2" style="font-size: xx-large; font-weight: bolder;">진료차트수정</td>
													<!-- <td></td> -->
													<td>작성자</td>
													<td>${user.empName}</td>
												</tr>
												<tr>
													<!-- <td></td> -->
													<!-- <td></td> -->
													<td>작성일</td>
													<td>${vo.date}</td>
												</tr>
											</table>
											<div>
												<br><h3>반려동물</h3>
												<table class="table">
													<tr>
														<td>이름</td>
														<td>${cus.animalName}</td>
													</tr>
													<tr>
														<td>성별</td>
														<td>${cus.gender}</td>
													</tr>
													<tr>
														<td>나이</td>
														<td>${cus.age}</td>
													</tr>
													<tr>
														<td>병명</td>
														<td><input type="text" name="disease" class="form-control" id="disease" value="${vo.disease}"></td>
													</tr>
												</table>
											</div>

											<div class="mb-3">
												<label for="contents" class="form-label">내용</label>
												<textarea class="form-control" id="contents" name="contents" rows="3" placeholder="내용을 입력하세요">${vo.contents}</textarea>
											</div>
											
											<!-- 사진첨부 -->
											<div class="mb-3">
												<button type="button" class="btn btn-primary" id="fileAdd">File추가</button>
											</div>
								
											<div id="fileList" class="mb-3">
								
											</div>
								
											<div>
												<c:forEach items="${vo.fileVOs}" var="f">
													<div class="alert alert-warning delets df" data-num="${f.fileNo}">
														첨부파일: ${f.originalFileName}
													</div>
													<%-- <div>
													<button class="delets df btn btn-danger" data-num="${f.fileNo}">삭제</button>
													
													</div> --%>
												</c:forEach>
											</div>

										</div>
										<button type="button" id="updateBtn" class="btn btn-primary" style="float: right; margin-bottom: 20px; margin-right: 20px;">진료차트수정</button>
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

	<!-- summernote -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	<!-- language pack -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	
	<script>
	$('#contents').summernote({
	  tabsize: 2,
	  height: 300,
	  codemirror: { // codemirror options
		    theme: 'monokai'
		  },
	  lang: 'ko-KR', // default: 'en-US'

	});
	
	$("#contents").summernote('code'); 
	</script>
	
	<script>
	const fileAdd = document.getElementById("fileAdd");
	const fileList = document.getElementById("fileList");
	const delets = document.getElementsByClassName("delets");

	//-------------------------------
	for(del of delets){
	    del.addEventListener("click", function(){
	        let num = this.getAttribute("data-num");
	        let check = confirm("삭제시 복구 불가");

	        if(check){
	            fetch("./fileDelete?fileNum="+num, {method:"get"})
	                .then((result)=>{return result.text()})
	                .then((r)=>{ 
	                    if(r.trim()=='1'){
	                        
	                        this.remove();
	                        count--;
	                    }

	                 })
	        }
	        
	    });
	}

	let max=5;
	let count=0;


	if(delets != null){
	    count=delets.length;
	    
	}

	let idx=0;
	$("#fileList").on("click", ".df", function(){
	    $(this).parent().remove();
	    count--;
	})

	//jquery로 변경
	$("#fileAdd").click(function(){
	    if(count>=max){
	    	alert("최대 5개만 가능합니다");
	        return;
	    }
	    count++;

	    let r = '<div class="input-group mb-3" id="file'+idx+'">'
	    r = r+'<input type="file" class="form-control" id="files" name="files">'
	    r = r+ '<button class="df btn-danger" data-id="file'+idx+'">삭제</button>'
	    r= r+"</div>";
	    idx++;

	    $("#fileList").append(r);

	});
	
	</script>
	
	<script>
		document.getElementById('updateBtn').addEventListener('click', function(event){
			let notDisease = document.querySelector('input[name="disease"]');	
			let notContents = document.querySelector('textarea[name="contents"]');

			if(notDisease.value.trim() === ''){
				event.preventDefault();
				alert("병명은 필수입니다.");
				notDisease.focus();
			}else{
				if(notContents.value.trim() === '') {
					event.preventDefault();
					alert("내용은 필수입니다.");
				}else{
					document.getElementById('frm').submit();
				}
			}
		});
	</script>


</body>
</html>