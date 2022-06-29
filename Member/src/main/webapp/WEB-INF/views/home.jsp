<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<style>
table {
	border-collapse: collapse;
}

th, td {
	border: 1px solid;
}

/* body {
	padding-top: 70px;
	padding-bottom: 30px;
} */
</style>
<body align=center>
	<h1>게시판</h1>
	<c:if test="${userinfo==''}">
		<p align=right>
			<a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>
		</p>
	</c:if>
	<c:if test="${userinfo!=''}">
		<p align=right>${userinfo}&nbsp;<a href='logout'>Logout</a>
		</p>
	</c:if>
	<table align=center>
		<tr>
			<th>게시물번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
			<c:if test="${userinfo!=''}">
				<th>게시물 수정/삭제</th>
			</c:if>
		</tr>
		<c:forEach var="board" items="${list }">
			<tr>
				<th scope="row"><a href='view?seqbbs=${board.seqbbs }'>${board.seqbbs }</a></th>
				<td>${board.title }</td>
				<td>${board.writer }</td>
				<td>${board.created }</td>
				<c:if test="${userinfo!=''}">
					<td><a href="view?seqbbs=${board.seqbbs }" id="a_mody">수정</a>&nbsp;<a href="delete?seqbbs=${board.seqbbs }" id="a_del" value="${board.seqbbs }">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${userinfo!=''}">
		<a href='newpost'>새글쓰기</a>
	</c:if>

</body>
</html>
