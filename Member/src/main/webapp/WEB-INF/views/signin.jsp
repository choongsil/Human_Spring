<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}

body {
	background-image: #34495e;
}

.joinForm {
	position: absolute;
	width: 400px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.joinForm h2 {
	text-align: center;
	margin: 30px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.id {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.pw {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.name {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.email {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.nickname {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.cellphoneNo {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
	background-position: left;
	background-size: 200%;
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}
</style>
</head>
${alret }
<body align=center>
	<form id=frmSignin method=post action="user_signin" class="joinForm">
		<h2>회원가입</h2>
		<div class="textForm">
			<input name="userid" type="text" class="id" placeholder="아이디"
				id=userid> </input>
		</div>
		<div class="textForm">
			<input name="pwd" type="password" class="pw" placeholder="비밀번호"
				id="pwd" pwd>
		</div>
		<div class="textForm">
			<input name="pwd1" type="password" class="pw" id="pwd1"
				placeholder="비밀번호 확인">
		</div>
		<div class="textForm">
			<input name="name" type="text" class="name" placeholder="이름"
				id="name">
		</div>
		<div class="textForm">
			<input name="mobile" type="number" class="cellphoneNo" id="mobile"
				placeholder="전화번호">
		</div>
		<input type=submit value='회원가입' class="btn"> <input
			type="reset" value="비우기" class="btn">
	</form>
</body>
<script src='https://code.jquery.com/jquery-3.4.1.js'></script>
<script>
	$(document).on(
			'submit',
			'#frmSignin',
			function() {
				if ($('#pwd').val() != $('#pwd1').val()) {
					alert('비밀번호가 일치 하지 않습니다.')
					return false;
				} else if ($('#userid').val() == null
						|| $('#pwd').val() == null || $('#pwd1').val() == null
						|| $('#name').val() == null
						|| $('#mobile').val() == null
						|| $('#userid').val() == '' || $('#pwd').val() == ''
						|| $('#pwd1').val() == '' || $('#name').val() == ''
						|| $('#mobile').val() == '') {
					alert('공백이 있습니다.')
					return false;
				}
				return true;
			})
</script>
</html>