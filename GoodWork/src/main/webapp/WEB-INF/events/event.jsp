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
<title>Event</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>

	<br>
	<div class=" container form-goup jumbotron">
		<h3>
			<strong>Event</strong>
		</h3>
		<ul style="list-style: none">
			<li>Event Id: ${event.id}</li>
			<li>Date Created: ${event.dateCreated }</li>
			<li>Event Name: ${event.eventName}</li>
			<li>Address: ${event.location.address}</li>
			<li>Address: ${event.location.address2}</li>
			<li>City: ${event.location.city}</li>
			<li>State: ${event.location.state}</li>
			<li>Zip Code: ${event.location.zipCode}</li>
			<li>Event Date: ${event.eventDate}</li>
			<li>Start Time: ${event.startTime}</li>
			<li>End Time: ${event.endTime}</li>
			<li>People Needed: ${event.peopleNeeded}</li>
			<li>Date Created: ${event.dateCreated}</li>
			<li>Point of Contact: ${event.pointOfContact }</li>
			<li>POC Phone: ${event.pocPhone}</li>
			<li>POC Email: ${event.pocEmail }</li>
			<li>Description: ${event.description }</li>
			<c:forEach var="cat" items="${event.categories}">
				<li>Category: ${cat.name}</li>
			</c:forEach>
			<li>${event.photoUrl}</li>
		</ul>
		<hr>
		<br>
		<c:choose>
			<c:when test="${not empty newUser}">
				<c:choose>
					<c:when test="${newUser.id == event.host.id}">
						<form:form action="goToUpdateEvent.do" method="GET"
							modelAttribute="event">
							<form:label path="id" value="${event.id}"></form:label>
							<form:hidden path="id" value="${event.id}" />
							<form:errors path="id" value="${event.id}" />
							<input type="submit" value="Update" />
							<br />
						</form:form>
						<!-- <div></div> -->
						<!-- Modal Testing Begin -->
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#deleteEvent">Delete Event</button>

						<!-- Modal -->
						<div class="modal fade" id="deleteEvent" tabindex="-1"
							role="dialog" aria-labelledby="deleteEventLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="deleteEventLabel">Delete
											Confirmation</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<strong>Are you sure that you'd like to delete the
											selected Event?</strong>
									</div>

									<div class="modal-footer">
										<form action="deleteEvent.do" method="POST">
											<input type="hidden" value="${event.id}" name="id">
											<button class="btn btn-danger" type="submit">Delete
												Event</button>
										</form>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<!-- <button type="button" class="btn btn-primary">Save
									changes</button>  -->
									</div>
								</div>
							</div>
						</div>

						<!-- Modal Testing End -->
					</c:when>
					<c:otherwise>
						<c:set var="isSignedUp" value="false" />
						<c:forEach var="vol" items="${event.users}">
							<c:if test="${vol.user.id == newUser.id}">
								<c:set var="isSignedUp" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test="${isSignedUp == true}">
								<a href="http://localhost:8090/">Already signed up</a>
							</c:when>
							<c:otherwise>
								<form:form action="signUpForEvent.do" method="GET"
									modelAttribute="event">
									<form:label path="id" value="${event.id}"></form:label>
									<form:hidden path="id" value="${event.id}" />
									<form:errors path="id" value="${event.id}" />
									<input type="submit" value="Sign Up" />
									<br />
								</form:form>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<h2>Must be a registered user to sign up for events, just do it
					its Free.</h2>
			</c:otherwise>
		</c:choose>
	</div>
	<!--  -->
	<!-- <form action="updateEvent.do" method="POST">
					<input type="submit" class="btn btn-primary" value="Update Event" />
				</form> -->
	<br>

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

	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>