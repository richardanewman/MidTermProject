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
<title>Result</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container jumbotron" align="center">
		<%-- 		<div class="displayResults">
			<c:if test="${! empty displayAll}">
				<h1>All Organizations:</h1>
				<c:forEach items="${displayAll}" var="org">
					<a href="findOrgById.do?id=${org.id}">${org.orgName}</a>
					<br>

					<br>
${org.orgDescription}<br>
					<br>
${org.location.address}<br>
					<br>
${org.location.city}<br>
					<br>
${org.location.state}<br>
					<br>
${org.orgType}<br>
					<br>
${org.orgNum}<br>
					<br>
${org.logoURL}<br>
					<br>
${org.website}<br>
					<br>
				</c:forEach>
			</c:if>
		</div>
	</div> --%>
		<!-- ////////// -->
		<h1>
			Organizations Currently Helping Others with <strong>goodWork</strong>
		</h1>

		<br>

		<div class="list-group">
			<div class="d-flex w-100 justify-content-between">
				<div class="displayResults">
					<c:if test="${! empty displayAll}">
						<c:forEach items="${displayAll}" var="org">
							<div class="card-deck">
								<div class="card">
									<span class="feather-card" data-feather="search"></span>
									<div class="card-body">
										<%-- <a href="findOrgById.do?id=${org.id}">${org.orgName}</a> --%>
										<h5 class="mb-1">
											<a href="findOrgById.do?id=${org.id}">${org.orgName}</a>
										</h5>
										<br> <small class="text-muted">${org.orgDescription}</small>
										<br> <small class="text-muted">${org.location.city},
											${org.location.state}</small> <br> <small class="text-muted">${org.orgType}</small>
										<br> <small class="text-muted"><a
											href="${org.website}" target="_blank">${org.website}</a></small>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>







			<!-- ////////// -->

			<c:if test="${! empty org}">
				<h1>Found it!</h1>
${org.orgName}<br>
				<br>
${org.location.address}<br>
				<br>
${org.location.city}<br>
				<br>
${org.location.state}<br>
				<br>
${org.orgType}<br>
				<br>
${org.orgNum}<br>
				<br>
${org.logoURL}<br>
				<br>
${org.website}<br>
				<br>
			</c:if>
			<br>

			<!-- ////////// -->

			<c:if test="${! empty users}">
				<h1>All Users:</h1>
				<c:forEach items="${users}" var="user">
${user.firstName}<br>
					<br>
${user.lastName}<br>
					<br>
${user.userName}<br>
					<br>
				</c:forEach>
			</c:if>

			<!-- ////////// -->

			<c:if test="${! empty user}">
				<h1>Found it!</h1>
${user.firstName}<br>
				<br>
${user.lastName}<br>
				<br>
${user.userName}<br>
				<br>
			</c:if>
			<br>

			<!-- ////////// -->


			<c:if test="${! empty events}">
				<h1>All Events:</h1>
				<c:forEach items="${events}" var="event">
${event.eventName}<br>
					<br>
${event.description}<br>
					<br>
${event.eventDate}<br>
					<br>
${event.startTime}<br>
					<br>
${event.endTime}<br>
					<br>
${event.peopleNeeded}<br>
					<br>
				</c:forEach>
			</c:if>


			<!-- ////////// -->

			<c:if test="${! empty event}">
				<h1>Found it!</h1>
${event.eventName}<br>
				<br>
${event.description}<br>
				<br>
${event.eventDate}<br>
				<br>
${event.startTime}<br>
				<br>
${event.endTime}<br>
				<br>
${event.peopleNeeded}<br>
				<br>
			</c:if>
			<br>


			<!-- ////////// -->


			<c:if test="${! empty eventByCat}">
				<h1>All Events By Category:</h1>
				<c:forEach items="${eventByCat}" var="event">
${event.eventName}<br>
					<br>
${event.description}<br>
					<br>
${event.eventDate}<br>
					<br>
${event.startTime}<br>
					<br>
${event.endTime}<br>
					<br>
${event.peopleNeeded}<br>
					<br>
				</c:forEach>
			</c:if>


			<!-- ////////// -->


			<c:if test="${! empty eventByCat}">
				<h1>Found it!</h1>
${event.eventName}<br>
				<br>
${event.description}<br>
				<br>
${event.eventDate}<br>
				<br>
${event.startTime}<br>
				<br>
${event.endTime}<br>
				<br>
${event.peopleNeeded}<br>
				<br>
			</c:if>
			<br>


			<!-- /////Org Delete///// -->


			<c:if test="${! empty successfulDelete}">
				<h1>Success!</h1>
				<h3>${successfulDelete}</h3>
			</c:if>


			<!-- ////////// -->
		</div>
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
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>