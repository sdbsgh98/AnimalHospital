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
<c:import url="/WEB-INF/views/layout/headCSS.jsp"></c:import>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			<!-- Layout container -->
			<div class="layout-page">
				<c:import url="/WEB-INF/views/layout/topbar.jsp"></c:import>
				<!-- Content wrapper -->
				<div class="content-wrapper">	
					<sec:authentication property="Principal" var="user"/>
					<!-- Content -->
					<!-- 내용부분-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card shadow mb-4" style="align-items: center;">
							<div style="width:75%; margin-bottom: 30px; margin-top: 30px;">
								<form action="noticeUpdate" method="post" enctype="multipart/form-data">
									<input type="hidden" name="noticeNo" value="${vo.noticeNo}">
									  <div class="mb-3">
									  	<input type="radio" name="important" id="important" value="1"><span>중요</span>
									  	<input type="radio" name="important" id="important" value="0" checked="checked"><span>일반</span>
									  </div>
			        				  <div class="mb-3">
									    <label for="title" class="form-label">Title</label>
									    <input type="text" class="form-control" name="title" id="title" value="${vo.title}">
									  </div>
			        				  <div class="mb-3">
									    <label for="username" class="form-label">Writer</label>
									    <input type="hidden" class="form-control" name="username" id="username" value="${user.username}">
									    <input type="text" class="form-control" id="empName" value="${vo.empName}" readonly="readonly">
									  </div>
									 <div class="mb-3">
									    <label for="contents" class="form-label">Contents</label>
									    <textarea class="form-control" name="contents" id="contents" style="height: 200px;">${vo.contents}</textarea>
									  </div>
									<div id="fileList">
									 <c:forEach items="${vo.fileVO}" var="f">
									 	<img alt="" src="../files/notice/${f.fileName}" style="width: 300px; height: 300px;"><!-- files 까지가 upload라는 폴더까지 -->
										<a href="./fileDown?fileNo=${f.fileNo}">${f.originalName}</a>
										<button type="button" data-file="${f.fileName}" data-num="${f.fileNo}">X</button>
									</c:forEach>
									</div>  
									<br><br>
									  <div class="mb-3" id="fileAdd">
									    <input type="file" class="form-control" name="files">
									    <button type="button" class="btn btn-primary" id="fileAdd">파일추가</button>
									  </div>
									  <button class="btn btn-primary">작성완료</button>
		        				</form>
	        				</div>
						</div>
					</div>
					<!-- / Content -->
					<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<c:import url="/WEB-INF/views/layout/footjs.jsp"></c:import>

<script type="text/javascript">
const fileList = document.getElementById("fileList");
const fileAdd = document.getElementById("fileAdd");
/* let fileNo = $('#fileNo');
let fileName = $('#fileName'); */

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
				alert("삭제되었습니다.");
			}else{
				alert("삭제 실패");
			}
			
		},
		error:function(){
			console.log("ajax 실패");
		}
	})
}

</script>

</body>
</html>