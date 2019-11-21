<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
<title>Event List</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div>
		<c:choose>
			<c:when test="${not empty eventList}">
				<h2 align="center">
					<strong><em>List of Events</em></strong>
				</h2>
				<table class="table table-hover table-bordered table-secondary">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Title</th>
							<th scope="col">Description</th>
							<th scope="col">Event Date</th>

						</tr>
					</thead>
					<c:forEach var="eventList" items="${eventList}">
						<tbody>
							<tr>
								<th scope="row">${eventList.id}</th>
								<td><a href="getEvent.do?id=${eventList.id}">${eventList.eventName}</a></td>
								<td>${eventList.description}</td>
								<td>${eventList.eventDate}</td>

							</tr>
						</tbody>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div class="container-fluid jumbotron" align="center">
					<h3>No event found</h3>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<hr>
	<footer class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p>Copyright © FluffyCarnage. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- js files for bootstap -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>