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
	<br>
	<!-- ///// ORG LIST ///// Working -->

	<br>
	<div class="displayResults">
		<c:if test="${! empty displayAll}">

			<div class="container jumbotron">
				<h1>
					Organizations Currently Helping Others with <strong>goodWork</strong>
				</h1>
				<c:forEach items="${displayAll}" var="org">
					<div>
						<hr>
						<h4 class="mb-1">
							<a href="findOrgById.do?id=${org.id}">${org.orgName}</a>
						</h4>
						<br>
						<p>
							<small class="text-muted">${org.orgDescription}</small>
						</p>
						<br> <small class="text-muted">${org.location.city},
							${org.location.state}</small> <br> <small class="text-muted">${org.orgType}</small>
						<br> <small class="text-muted"><a
							href="${org.website}" target="_blank">${org.website}</a></small>
					</div>
				</c:forEach>
			</div>

		</c:if>
	</div>
	<br>

	<!-- /////Single Org///// -->

	<br>
	<div>
		<c:if test="${! empty org}">
			<div class="container">
				<table
					class="table table-responsive table-responsive table-hover table-bordered table-light">
					<tr>
						<th scope="col">Org Information</th>
						<th scope="col"></th>
					</tr>
					<tr>
						<td>ORG</td>
						<td>${org.orgName}</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>${org.location.address}</td>
					</tr>
					<tr>
						<td>Address</td>
						<td>${org.location.address2}</td>
					</tr>
					<tr>
						<td>City</td>
						<td>${org.location.city}</td>
					</tr>
					<tr>
						<td>State</td>
						<td>${org.location.state}</td>
					</tr>
					<tr>
						<td>Zip Code</td>
						<td>${org.location.zipCode}</td>
					</tr>
					<tr>
						<td>Org Type</td>
						<td>${org.orgType}</td>
					</tr>
					<tr>
						<td>Org Number</td>
						<td>${org.orgNum}</td>
					</tr>
					<tr>
						<td>Org Website</td>
						<td>${org.website}</td>
					</tr>
					<tr>
						<td>Org Logo</td>
						<td>${org.orgURL}</td>
					</tr>

				</table>
			</div>
		</c:if>
	</div>

	<!-- /////List of Users///// working -->

	<div>
		<c:if test="${! empty users}">
			<div class="container">
				<h1>
					Users Currently Helping Others with <strong>goodWork</strong>
				</h1>
				<hr>
				<table
					class="table table-responsive table-hover table-bordered table-secondary">
					<thead>
						<tr>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">User Name</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="user">
						<tbody>
							<tr>
								<td>${user.firstName}</td>
								<td>${user.lastName}</td>
								<td>${user.userName}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</c:if>
	</div>

	<!-- EVENT BY CAT -->

	<div>
		<c:if test="${! empty eventsByCat}">
			<div class="container">
				<h1>
					Events by Category with <strong>goodWork</strong>
				</h1>
				<table
					class="table table-responsive table-hover table-bordered table-secondary">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Title</th>
							<th scope="col">Description</th>
							<th scope="col">Event Date</th>
						</tr>
					</thead>
					<c:forEach var="eventCat" items="${eventsByCat}">
						<c:if test="${eventCat.active == true}">
							<tbody>
								<tr>
									<th scope="row">${eventCat.id}</th>
									<td><a href="getEvent.do?id=${eventCat.id}">${eventCat.eventName}</a></td>
									<td>${eventCat.description}</td>
									<td>${eventCat.eventDate}</td>
								</tr>
							</tbody>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</c:if>
	</div>
	<br>
	<%-- 	<div>
		<c:if test="${! empty eventsByCat}">
			<div class="container">
				<h1>
					Events by Category with <strong>goodWork</strong>
				</h1>
				<c:forEach items="${eventsByCat}" var="eventCat">
				<c:if test="${eventCat.active == true}">
					<hr>
					<h4 class="mb-1">
						<a href="findEventByCategory.do?id=${eventCat.id}">${eventCat.eventName}</a>
					</h4>
					<br>
					<p>
						<small class="text-muted">${eventCat.description}</small>
					</p>
					<br>
					<small class="text-muted">${eventCat.eventDate}</small>
					<br>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</div>

	<br> --%>

	<!-- /////Org Delete///// working -->

	<div class="container">
		<c:if test="${! empty successfulDelete}">
			<h1>Success!</h1>
			<h3>${successfulDelete}</h3>
		</c:if>

	</div>

	<!-- /////Footer///// -->

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