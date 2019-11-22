<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container jumbotron">
	<h3>Hi ${sessionScope.newUser.firstName}, update or delete your profile...</h3>
		<form:form action="updateUser.do" method="POST"
			modelAttribute="userProfile">
			<form:label path="userName">User Name</form:label>
			<br>
			<form:input class="form-control" path="userName" required="required"
				type="text" value="${sessionScope.newUser.userName}"
				placeholder="${sessionScope.newUser.userName}" />
			<form:errors path="userName" />
			<br />
			<form:label path="password">Password</form:label>
			<br>
			<form:input class="form-control" path="password" required="required"
				type="text" value="${sessionScope.newUser.password}"
				placeholder="${sessionScope.newUser.password}" />
			<form:errors path="password" />
			<br />
			<form:label path="firstName">First Name</form:label>
			<br>
			<form:input class="form-control" path="firstName" required="required"
				type="text" value="${sessionScope.newUser.firstName}"
				placeholder="${sessionScope.newUser.firstName}" />
			<form:errors path="firstName" />
			<br />
			<form:label path="lastName">Last Name</form:label>
			<br>
			<form:input class="form-control" path="lastName" required="required"
				type="text" value="${sessionScope.newUser.lastName}"
				placeholder="${sessionScope.newUser.lastName}" />
			<form:errors path="lastName" />
			<br />
			<form:label path="email">Email</form:label>
			<br>
			<form:input class="form-control" path="email" required="required"
				type="text" value="${sessionScope.newUser.email}"
				placeholder="${sessionScope.newUser.email}" />
			<form:errors path="email" />
			<br />
			<form:label path="bio">Biography</form:label>
			<br>
			<form:input class="form-control" path="bio" required="required"
				type="text" value="${sessionScope.newUser.bio}"
				placeholder="${sessionScope.newUser.bio}" />
			<form:errors path="bio" />
			<br />
			<form:label path="photoURL">Photo URL</form:label>
			<br>
			<form:input class="form-control" path="photoURL" type="text"
				required="required" value="${sessionScope.newUser.photoURL}"
				placeholder="${sessionScope.newUser.photoURL}" />
			<form:errors path="photoURL" />
			<br />
			<form:label path="active" value="${sessionScope.newUser.active}" />
			<form:hidden path="active" value="${sessionScope.newUser.active}" />
			<form:errors path="active" value="${sessionScope.newUser.active}" />
			<form:label path="id" value="${sessionScope.newUser.id}" />
			<form:hidden path="id" value="${sessionScope.newUser.id}" />
			<form:errors path="id" value="${sessionScope.newUser.id}" />
			<input class="btn btn-primary" class="submit" type="submit"
				value="Update Profile" />
		</form:form>
	</div>
	<hr>
	<div class="container jumbotron">
		<h5 class="card-title">Delete Your Profile</h5>
		<form:form action="disableUser.do" method="POST"
			modelAttribute="userProfile">
			<form:label path="id" value="${sessionScope.newUser.id}"></form:label>
			<br>
			<form:hidden path="id" value="${sessionScope.newUser.id}" />
			<form:errors path="id" value="${sessionScope.newUser.id}" />
			<br />
			<form:label path="password" value="Enter Password">Password</form:label>
			<br>
			<form:input class="form-control" path="password"
				value="Enter Password" required="required" type="text"
				placeholder="Enter Password" />
			<form:errors path="password" value="Enter Password" />
			<br>
			<input class="btn btn-primary" type="submit" value="Delete Profile" />
			<br />
		</form:form>
	</div>
</body>
</html>