<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">
<meta charset="UTF-8">
<title>로그인</title>
<style>
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

.input-group mb-3 {
	display: flex;
	justify-content: center;
}

#sform {
	display: inline-block;
	text-align: center;
}
</style>
<link href="signin.css" rel="stylesheet">
</head>
${alert }
<body class="text-center">
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
						<button type="button" class="btn btn-primary"
							onClick="location.href='signin'">SignUp</button>
				</div>
			</header>
		</div>
	</main>
	<p align=right>
		<main class="form-signin" id="sform">
			<form method=post action="user_chek">
				<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

				<div class="input-group mb-3" style='width: 150px; height: 50px;'>
					<input type="text" name=userid class="form-control"
						id="floatingInput" placeholder="ID">
				</div>
				<div class="input-group mb-3" style='width: 150px; height: 50px;'>
					<input type="password" name=pwd class="form-control"
						id="floatingPassword" placeholder="Password">
				</div>

				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="w-30 btn btn-lg btn-primary" type="submit">Sign
					in</button>
			</form>
		</main>
</body>
</html>