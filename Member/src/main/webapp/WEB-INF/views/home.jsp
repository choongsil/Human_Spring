<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<c:if test="${userinfo==''}">
<p align=right><a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>
</p>
</c:if>
<c:if test="${userinfo!=''}">
<p align=right>${userinfo}&nbsp;<a href='logout'>Logout</a>&nbsp;<a href='signin'>Signin</a>
</p>
</c:if>
<h1>
	Hello world!  
</h1>

</body>
</html>
