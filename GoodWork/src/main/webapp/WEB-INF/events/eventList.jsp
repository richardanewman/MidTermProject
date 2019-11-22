<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/event.css">
<title>Event List</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
<div class="container">
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="css/eventList1.png" class="d-block w-100" alt="Event Photo">
    </div>
    <div class="carousel-item">
      <img src="css/eventList2.png" class="d-block w-100" alt="Event Photo">
    </div>
    <div class="carousel-item">
      <img src="css/eventList3.png" class="d-block w-100" alt="Event Photo">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
	<br>
	<div>
		<c:choose>
			<c:when test="${not empty eventList}">
				<div class="container jumbotron">
					<h1 align="center" style="padding-top: 25px;">
						List of Events
					</h1>
					<br>
					<table class="table table-responsive table-hover table-bordered table-secondary">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Title</th>
								<th scope="col">Description</th>
								<th scope="col">Event Date</th>

							</tr>
						</thead>
						<c:forEach var="eventList" items="${eventList}">
							<c:if test="${eventList.active == true}">
								<tbody>
									<tr>
										<th scope="row">${eventList.id}</th>
										<td><a href="getEvent.do?id=${eventList.id}">${eventList.eventName}</a></td>
										<td>${eventList.description}</td>
										<td><small>${eventList.eventDate}</small></td>
									</tr>
								</tbody>
							</c:if>
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