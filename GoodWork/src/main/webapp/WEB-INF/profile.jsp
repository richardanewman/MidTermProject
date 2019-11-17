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
${newUser}
<h5 class="card-title">Delete Your Profile</h5>
	<form:form action="disableUser.do" method="POST" modelAttribute="newUser">
		<form:label path="id" value="${newUser.id}"></form:label><br>
		<form:hidden path="id" value="${newUser.id}"/>
		<form:errors path="id" value="${newUser.id}"/>
		<br />
		<form:label path="password" value="Enter Password">Password:</form:label><br>
		<form:input class="input" path="password" value="Enter Password" required="required" type="text" placeholder="Enter Password"/>
		<form:errors path="password" value="Enter Password"/>
		<input type="submit" value="Delete Profile"/> 
		<br />
</form:form>

<form:form action="updateUserForm.do" method="GET" modelAttribute="newUser">
					<form:label path="id" value="${newUser.id}"></form:label>
					<form:hidden path="id" value="${newUser.id}" />
					<form:errors path="id" value="${newUser.id}" />
					<input type="submit" value="Update Profile" style="color:BLUE;"/>
				</form:form>
${newUser.events}
${newUser.orgs}
</body>
</html>