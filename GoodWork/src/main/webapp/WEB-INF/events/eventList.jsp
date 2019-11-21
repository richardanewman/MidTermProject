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
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="http://placehold.it/650x450/aaa&text=Item 1" height="300"
						width="300" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://placehold.it/650x450/aaa&text=Item 2" height="300"
						width="300" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="http://placehold.it/650x450/aaa&text=Item 3" height="300"
						width="300" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
	<div>
		<c:choose>
			<c:when test="${not empty eventList}">
				<div class="container jumbotron">
					<h2 align="center">
						<strong><em>List of Events</em></strong>
					</h2>
					<br>
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
									<td><small>${eventList.eventDate}</small></td>

								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
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