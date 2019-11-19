<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
<title>Login</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<form:form action="enter.do" method="GET" modelAttribute="user">
		<form:label path="userName" style="color:Blue;">User Name: </form:label>
		<form:input path="userName" />
		<form:errors path="userName" />
		<form:label path="password" style="color:Blue;">Password: </form:label>
		<form:input path="password" />
		<form:errors path="password" />
		<input type="submit" value="Login" class="btn btn-outline-primary"
			role="button" aria-disabled="true" />
		<br>

	</form:form>
	<form:form action="register.do" method="GET" modelAttribute="user">
		<input type="submit" value="Register" class="btn btn-outline-primary"
			role="button" aria-disabled="true" />
	</form:form>

	<!-- BootStrap Script Below -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>