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
<tr><th>게시물번호</th><th>제목</th><th>작성자</th><th>작성날짜</th></tr>
<c:forEach var="board" items="${list }">
<tr><td><a href='view/${board.seqbbs }'>${board.seqbbs }</a></td><td>${board.title }</td><td>${board.writer }</td><td>${board.created }</td></tr>
</c:forEach>
</table>
<c:if test="${userinfo!=''}">
<a href='newpost'>새글쓰기</a>
</c:if>
</body>
</html>
