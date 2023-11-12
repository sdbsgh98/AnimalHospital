<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Department Details</title>
</head>
<body>
    <div>
        <h2>부서 상세 정보</h2>
        <p th:text="'부서번호: ' + ${dept.deptNo}"></p>
        <p th:text="'부서명: ' + ${dept.deptName}"></p>
        <p th:text="'상위부서번호: ' + ${dept.parentNo}"></p>
        <p th:text="'직급: ' + ${dept.positionName}"></p>
    </div>
</body>
</html>