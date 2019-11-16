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
<form:form action="updateUser.do" method="POST" modelAttribute="newUser">
		<form:label path="userName">User Name:</form:label><br>
		<form:input class="input" path="userName" required="required" type="text" default="${newUser.userName}" placeholder="${newUser.userName}"/>
		<form:errors path="userName" />
		<br />
		<form:label path="password" >Password:</form:label><br>
		<form:input class="input" path="password" required="required" type="text" default="${newUser.password}" placeholder="${newUser.password}"/>
		<form:errors path="password" />
		<br />
		<form:label path="firstName" >First Name:</form:label><br>
		<form:input class="input" path="firstName" required="required" type="text" default="${newUser.firstName}" placeholder="${newUser.firstName}"/>
		<form:errors path="firstName" />
		<br />
		<form:label path="lastName" >Last Name:</form:label><br>
		<form:input class="input" path="lastName" required="required" type="text" default="${newUser.lastName}" placeholder="${newUser.lastName}"/>
		<form:errors path="lastName" />
		<br />
		<form:label path="email" >Email:</form:label><br>
		<form:input class="input" path="email" required="required" type="text" default="${newUser.email}" placeholder="${newUser.email}"/>
		<form:errors path="email" />
		<br />
		<form:label path="bio" >Biography:</form:label><br>
		<form:input class="input" path="bio" required="required" type="text" default="${newUser.bio}" placeholder="${newUser.bio}"/>
		<form:errors path="bio" />
		<br />
		<form:label path="photoURL">Photo URL:</form:label><br>
		<form:input class="input" path="photoURL" type="text" required="required" default="${newUser.photoURL}" placeholder="${newUser.photoURL}" />
		<form:errors path="photoURL" />
		<br />
		<form:label path="active" value="${newUser.active}"/>
		<form:hidden path="active" value="${newUser.active}"/>
		<form:errors path="active" value="${newUser.active}"/>
		<form:label path="id" value="${newUser.id}"/>
		<form:hidden path="id" value="${newUser.id}"/>
		<form:errors path="id" value="${newUser.id}"/>
	    <input class="submit" type="submit" value="Submit" />
	</form:form>
</body>
</html>