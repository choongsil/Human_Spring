<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
</head>
<body>
	<c:if test="${userinfo==''}">
		<input type="hidden" value="${bdto.seqbbs }">
		<table>
			<tr>
				<td>제목 :</td>
				<td><input type="text" name="title" value=${bdto.title }
					readonly></td>
			</tr>
			<tr>
				<td>게시글 :</td>
				<td><textarea name="content" rows="10" cols="70" readonly>${bdto.content }</textarea></td>
			</tr>
			<tr>
				<td>작성자 :</td>
				<td><input type="text" name="writer" value="${bdto.writer }"
					readonly></td>
			</tr>
			<tr>
				<td>작성 시간 :</td>
				<td><input type="text" name="created" value="${bdto.created }"
					readonly></td>
		</table>
		<input type="button" value="목록보기" id="btnList">
	</c:if>
	<c:if test="${userinfo!=''}">
		<input type="hidden" value="${bdto.seqbbs }" id="seqbbs" name="seqbbs">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"
					value=${bdto.title }></td>
			</tr>
			<tr>
				<td>게시글 :</td>
				<td><textarea name="content" rows="10" cols="70" id="content">${bdto.content }</textarea></td>
			</tr>
			<tr>
				<td>작성자 :</td>
				<td><input type="text" name="writer" value="${bdto.writer }"
					readonly></td>
			</tr>
			<tr>
				<td>작성 시간 :</td>
				<td><input type="text" name="created" value="${bdto.created }"
					readonly></td>
			</tr>

		</table>
		<input type="button" value="목록보기" id="btnList">&nbsp;
			<input type="button" value="수정하기" id="btnmody">
	</c:if>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
	$(document).on('click', '#btnList', function() {
		document.location = '/member';
	}).on('click', '#btnmody', function() {
		if (confirm('수정 하시겠습니까?')) {
			$.ajax({
				type : 'post',
				url : 'modify',
				data : {
					'seqbbs' : $('#seqbbs').val(),
					'title' : $('#title').val(),
					'content' : $('#content').val()
				},
				dataType : 'text',
				success : function() {
					document.location = '/member';
				},
				complete : function() {

				}

			});
		} else {
			return false;
		}

	})
</script>
</html>