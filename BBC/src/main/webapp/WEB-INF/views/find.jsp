<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원정보</h1>
사번: ${member.employee_id}<br>
이름: ${member.emp_name}<br>
월급: ${member.salary}<br>
매니저 사번: ${member.manager_id}<br>
입사일자: ${member.hire_date}<br>
이메일: ${member.email}<br>
</body>
</html>