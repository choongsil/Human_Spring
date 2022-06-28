<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
${alert }
<body align=center>
<p align=right><a href='signin'>Signin</a>
<h1 >login</h1>
<form method=post action="user_chek">
아이디: <input type=text name=userid ><br>
비밀번호: <input type=password name=pwd ><br>
<input type=submit value='로그인'>
</form>
</body>
</html>