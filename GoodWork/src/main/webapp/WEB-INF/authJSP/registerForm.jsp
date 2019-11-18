<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
<form:form action="addNewUser.do" method="POST" modelAttribute="user">
		<form:label path="userName">User Name:</form:label><br>${username }
		<form:input class="input" path="userName" required="required" type="text" placeholder="User name"/>
		<form:errors path="userName" />
		<br />
		<form:label path="password" >Password:</form:label><br>
		<form:input class="input" path="password" required="required" type="text" placeholder="Password"/>
		<form:errors path="password" />
		<br />
		<form:label path="firstName" >First Name:</form:label><br>
		<form:input class="input" path="firstName" required="required" type="text" placeholder="First Name"/>
		<form:errors path="firstName" />
		<br />
		<form:label path="lastName" >Last Name:</form:label><br>
		<form:input class="input" path="lastName" required="required" type="text" placeholder="Last Name"/>
		<form:errors path="lastName" />
		<br />
		<form:label path="email" >Email:</form:label><br>
		<form:input class="input" path="email" required="required" type="text" placeholder="Email"/>
		<form:errors path="email" />
		<br />
		<form:label path="bio" >Biography:</form:label><br>
		<form:input class="input" path="bio" required="required" type="text" placeholder="About yourself"/>
		<form:errors path="bio" />
		<br />
		<form:label path="photoURL">Photo URL:</form:label><br>
		<form:input class="input" path="photoURL" type="text" required="required" placeholder="Photo Here" />
		<form:errors path="photoURL" />
		<br />
	    <input class="submit" type="submit" value="Submit" />
	</form:form>
</body>
</html>