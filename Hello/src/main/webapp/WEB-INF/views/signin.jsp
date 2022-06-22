<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form id=frmSignin method=GET action="user_siginin">
사용자 아이디:<input type=text name=userid value="${userid}"><br>
비밀번호:<input type=password name=pwd id=pwd><br>
비밀번호 확인: <input type=password name=pwd1 id=pwd1><br>
<input type=submit value='회원가입'>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
$(document)
.on('submit', '#frmSignin', function(){
	if($('#pwd').val()!=$('#pwd1').val()){
		alert('비밀번호가 일치 하지 않습니다.')
		return false;
	}
	return true;
})
</script>
</html>