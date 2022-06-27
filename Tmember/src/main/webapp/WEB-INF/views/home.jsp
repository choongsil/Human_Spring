<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>list</title>
</head>
<style>
table, th, td {border:1px solid blue}
</style>
<body>
<form id="frmt" method="post" action="addTmember">
user id <input type="text" name="uid"><br>
password <input type="password" name="pwd" id="pwd"><br>
password 확인 <input type="password" name="pwd1" id="pwd1"><br>
이름 <input type="text" name="name"><br>
모바일 <input type="text" name="mobile"><br>
<input type="submit" value="추가">&nbsp;<input type="reset" value="비우기">
</form>
<table style="border-collapse:collapse;">
<tr><th>User Id</th><th>비밀번호</th><th>이름</th><th>모바일</th><th>가입일</th></tr>
<c:forEach var="tmember" items="${tlist}">
<tr><td>${tmember.id}</td><td>${tmember.pwd}</td><td>${tmember.name}</td><td>${tmember.mobile}</td><td>${tmember.joindate}</td></tr>
</c:forEach>
</table>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('submit','#frmt',function() {
	if($('#pwd').val()!=$('#pwd1').val()) {
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	return true;
})
</script>

</html>
