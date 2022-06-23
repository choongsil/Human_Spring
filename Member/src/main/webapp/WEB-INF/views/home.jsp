<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
table {border-collapse:collapse;}
th,td {border:1px solid blue;}
</style>
<body align=center>
<c:if test="${userinfo==''}">
<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>
</p>
</c:if>
<c:if test="${userinfo!=''}">
<p align=right>${userinfo}&nbsp;<a href='logout'>Logout</a>
</p>
</c:if>
<h1>
	Hello world!  
</h1>
<table align=center>
<tr><th>작성시간</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
<tr><td>6월22일</td><td>aaaa</td><td>피터팬</td><td>100</td></tr>
<tr><td>6월23일</td><td>bbbb</td><td>팅커벨</td><td>200</td></tr>
</table>
<c:if test="${userinfo!=''}">
<a href='newpost'>새글쓰기</a>
</c:if>
</body>
</html>
