<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello, ${sessionScope.newUser.firstName}</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
${userData.firstName}
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
	<h1>Organizations</h1>
	<c:forEach var="org" items="${sessionScope.newUser.orgs}">
		<h3>${org.orgName}</h3><br>
		<p>${org.orgDescription}</p><br>
		<p>${org.orgType}</p><br>
		<br><br><br>
	</c:forEach>
	<h1>Attended events</h1>
	<c:forEach var="attended" items="${sessionScope.newUser.attendedEvents}">
		<h3>${attended.event.eventName}</h3><br>
		<p>${attended.event.description}</p><br>
		<p>${attended.event.eventDate}</p><br>
		<c:choose>
			<c:when test="${attend.attend}">
				<p>Attended Event: Yes! Good Job!</p>
			</c:when>
			<c:otherwise>
				<p>Attended Event: Nope. So Sad!</p>
			</c:otherwise>
		</c:choose>
		<br><br><br>
	</c:forEach>
		<h1>Hosted Events</h1>
	<c:forEach var="hosted" items="${sessionScope.newUser.hostedEvents}">
		<h3>${hosted.eventName}</h3><br>
		<p>${hosted.description}</p><br>
		<p>${hosted.eventDate}</p><br>
	</c:forEach>
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
	<br>
	<form action="logout.do" method="GET">
		<input class="submit" type="submit" value="Logout" />
	</form>
</body>
</html>