<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
${alret }
<body align=center>
<h1>회원가입</h1>
	<form id=frmSignin method=post action="user_signin">
		사용자 아이디 : <input type=text name=userid id=userid><br>
		비밀번호 : <input type=password name=pwd id=pwd><br> 
		비밀번호 확인 : <input type=password name=pwd1 id=pwd1><br>
		이름 : <input type="text" name="name" id="name"><br>
		모바일 번호 : <input type="text" name="mobile" id="mobile"><br><br>
		 <input type=submit value='회원가입'>&nbsp;<input type="reset" value="비우기">
	</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
	$(document).on('submit', '#frmSignin', function() {
		if ($('#pwd').val() != $('#pwd1').val()) {
			alert('비밀번호가 일치 하지 않습니다.')
			return false;
		}else if($('#userid').val()==null||$('#pwd').val()==null||$('#pwd1').val()==null||$('#name').val()==null||$('#mobile').val()==null
				||$('#userid').val()==''||$('#pwd').val()==''||$('#pwd1').val()==''||$('#name').val()==''||$('#mobile').val()==''){
			alert('공백이 있습니다.')
			return false;
		}
		return true;
	})
</script>
</html>