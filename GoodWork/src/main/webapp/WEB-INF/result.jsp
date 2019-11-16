<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
<div class="displayResults">
<c:if test="${! empty displayAll}">
<h1>All Organizations:</h1>
<c:forEach items="${displayAll}" var="org">
${org.orgName}<br><br>
${org.location.address}<br><br>
${org.location.city}<br><br>
${org.location.state}<br><br>
${org.orgType}<br><br>
${org.orgNum}<br><br>
${org.logoURL}<br><br>
${org.website}<br><br>
</c:forEach>
</c:if>


<c:if test="${! empty org}">
<h1>Found it!</h1>
${org.orgName}<br><br>
${org.location.address}<br><br>
${org.location.city}<br><br>
${org.location.state}<br><br>
${org.orgType}<br><br>
${org.orgNum}<br><br>
${org.logoURL}<br><br>
${org.website}<br><br>
</c:if>
<br>

<c:if test="${! empty successfulDelete}">
<h1>Success!</h1>
${successfulDelete}
</c:if>

<br>

	<c:choose>
		<c:when test="${not empty event }">

			<h3>
				<strong>Event</strong>
			</h3>
			<ul style="list-style: none">
			<li>Event Id: ${event.id}</li>
			<li>Event Name: ${event.eventName}</li>
			<li>Host: ${event.hostId}</li>
			<li>${event.location.address}</li>
			<li>${event.location.address2}</li>
			<li>${event.location.city}</li>
			<li>${event.location.state}</li>
			<li>${event.location.zipCode}</li>
			<li>Event Date: ${event.eventDate}</li>
			<li>Start Time: ${event.startTime}</li>
			<li>End Time: ${event.endTime}</li>
			<li>People Needed: ${event.peopleNeeded}</li>
			<li>Date Created: ${event.dateCreated}</li>
			<li>POC Phone: ${event.pocPhone}
			<li>POC Email: ${event.pocEmail }
			<li>Description: ${event.description }
			<li>${event.photoUrl}</li>
			</ul>
</c:when>
		<c:otherwise>
			<h4 align="center">Event Not Found</h4>
		</c:otherwise>
		</c:choose>
</body>
</html>