<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${sessionScope.newUser}
	<h5 class="card-title">Delete Your Profile</h5>
	<form:form action="disableUser.do" method="POST" modelAttribute="user">
		<form:label path="id" value="${sessionScope.newUser.id}"></form:label>
		<br>
		<form:hidden path="id" value="${sessionScope.newUser.id}" />
		<form:errors path="id" value="${sessionScope.newUser.id}" />
		<br />
		<form:label path="password" value="Enter Password">Password:</form:label>
		<br>
		<form:input class="input" path="password" value="Enter Password"
			required="required" type="text" placeholder="Enter Password" />
		<form:errors path="password" value="Enter Password" />
		<input type="submit" value="Delete Profile" />
		<br />
	</form:form>

	<form:form action="updateUserForm.do" method="GET"
		modelAttribute="user">
		<form:label path="id" value="${sessionScope.newUser.id}"></form:label>
		<form:hidden path="id" value="${sessionScope.newUser.id}" />
		<form:errors path="id" value="${sessionScope.newUser.id}" />
		<input type="submit" value="Update Profile" style="color: BLUE;" />
	</form:form>
	${sessionScope.newUser.events} ${sessionScope.newUser.orgs}
	<br>
	<a href="http://localhost:8090/">Home</a>
	<br>
	<form action="createEventForm.do" method="GET">
		<input type="submit" value="Create Event" />
	</form>
	<br>
	<form action="createOrgForm.do" method="GET">
		<input class="submit" type="submit" value="Create Organization" />
	</form>
</body>
</html>