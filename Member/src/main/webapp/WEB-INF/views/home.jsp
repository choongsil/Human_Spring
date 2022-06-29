<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>Home</title>
</head>
<style>
table {
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border: 1px solid;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<body align=center>
	<main>
		<h1 class="visually-hidden">Headers examples</h1>
		<div class="b-example-divider"></div>
		<div class="container">
			<header
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
				<a href="/"
					class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
            <use xlink:href="#bootstrap" />
          </svg>
				</a>

				<div class="col-md-3 text-end">
					<c:if test="${userinfo==''}">
						<button type="button" class="btn btn-outline-primary me-2"
							onClick="location.href='login'">Sign-in</button>
						<button type="button" class="btn btn-primary"
							onClick="location.href='signin'">Sign-up</button>
					</c:if>
					<c:if test="${userinfo!=''}">
						<input type="text" value='작성자:${userinfo}' style="border:none; text-align:right;" readonly>
						<button type="button" class="btn btn-primary"
							onClick="location.href='logout'">Logout</button>
					</c:if>
				</div>
			</header>
		</div>
	</main>
	<h1 align="center">게시판</h1>

	<table align=center class="table table-striped table-hover"
		style="width: 900px">
		<thead>
			<tr>
				<th>게시물번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<c:if test="${userinfo!=''}">
					<th>게시물 수정/삭제</th>
				</c:if>
			</tr>
		</thead>
		<c:forEach var="board" items="${list }">
			<tbody>
				<tr>
					<th scope="row"><a href='view?seqbbs=${board.seqbbs }'>${board.seqbbs }</a></th>
					<td>${board.title }</td>
					<td>${board.writer }</td>
					<td>${board.created }</td>
					<c:if test="${userinfo!=''}">
						<td><a href="view?seqbbs=${board.seqbbs }" id="a_mody">수정</a>&nbsp;<a
							href="delete?seqbbs=${board.seqbbs }" id="a_del">삭제</a></td>
					</c:if>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<div style="text-align: center">
		<c:if test="${userinfo!=''}">
			<a href='newpost'>새글쓰기</a>
		</c:if>
	</div>
</body>
</html>
