<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
${alert}
<body>
<h1>login</h1>
<form method=GET action="user_chek">
<input type=text name=userid><br>
<input type=password name=pwd><br>
<input type=submit value='로그인'>
</form>
</body>
</html>