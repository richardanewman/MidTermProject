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
		<c:choose>
			<c:when test="${not empty event}">

				<h3>
					<strong>Event</strong>
				</h3>
				<ul style="list-style: none">
					<li>Event Id: ${event.id}</li>
					<li>Event Name: ${event.eventName}</li>
					<%-- <li>Host: ${event.user}</li> --%>
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
					<li>POC Phone: ${event.pocPhone}
					<li>POC Email: ${event.pocEmail }
					<li>Description: ${event.description }
					<li>${event.photoUrl}</li>
				</ul>
				<hr>
				<br>
				<!-- <form action="updateEvent.do" method="POST">
					<input type="submit" class="btn btn-primary" value="Update Event" />
				</form> -->
				<br>
				<div>
					<h2 align="center">Update an Event</h2>
					<br>

					<div class=" container form-goup jumbotron">
						<form action="updateEvent.do" method="POST" ><!-- modelAttribute="event" -->
							<!--  -->
							<label for="eventId" value="${event.id }">Editing ${event.eventName}</label>
								<input type="hidden" value="${event.id }" name="id"/>
								<!--  -->
								<label for="eventId">Event Id</label> <input type="text" value="${event.id }" name="eventID"
								disabled="disabled" /> <label for="eventName">Event Title</label> <input type="text"
									class="form-control" name="eventName"
									value="${event.eventName}"  /><br>
								<!--  -->
								<label for="description">Event Description</label> <input
									type="text" class="form-control" name="description"
									value="${event.description}"  /><br>
								<!--  -->
								<label for="address">Event Address</label> <input type="text"
									class="form-control" name="address"
									value="${event.location.address}"
									 /><br>
								<!--  -->
								<label for="address2">Event Address 2</label> <input type="text"
									class="form-control" name="address2"
									value="${event.location.address2}"
									  /><br>
								<!--  -->
								<label for="city">Event City</label> <input type="text"
									value="${event.location.city}" class="form-control" name="city"
									 /><br>
								<!--  -->
								<label for="state">Event State</label> <input type="text"
									class="form-control" name="state"
									value="${event.location.state}"
									 /><br>
								<!--  -->
								<label for="zipCode">Event Zip Code</label> <input type="text"
									class="form-control" name="zipCode"
									value="${event.location.zipCode}"
									 /><br>
								<!--  -->
								<label for="eventDate">Event Date</label> <input type="text"
									class="form-control" name="eventDate"
									value="${event.eventDate}"  /><br>
								<!--  -->
								<label for="eventDate">Start Time</label> <input type="text"
									class="form-control" name="startTime"
									value="${event.startTime}"  /><br>
								<!--  -->
								<label for="endTime">End Time</label> <input type="text"
									value="${event.endTime}" class="form-control" name="endTime"
									 /><br>
								<!--  -->
								<label for="peopleNeeded">Number of people needed</label> <input
									type="number" class="form-control" name="peopleNeeded"
									value="${event.peopleNeeded}"
									 /><br>
								<!--  -->
								<label for="pointOfContact">Point of Contact</label> <input
									type="text" class="form-control" name="pointOfContact"
									value="${event.pointOfContact }"
									 /><br>
								<!--  -->
								<label for="pocPhone">POC Phone Number</label> <input
									type="number" class="form-control" name="pocPhone"
									value="${event.pocPhone}"  /><br>
								<!--  -->
								<label for="pocEmail">POC Email</label> <input type="text"
									value="${event.pocEmail }" class="form-control" name="pocEmail"
									 /><br>
								<!--  -->
								<label for="photoUrl">POC Email</label> <input type="text"
									value="${event.photoUrl }" class="form-control" name="photoUrl"
									 /><br><br>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
				<!-- <div></div> -->
				<!-- Modal Testing Begin -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#deleteEvent">Delete Event</button>

				<!-- Modal -->
				<div class="modal fade" id="deleteEvent" tabindex="-1" role="dialog"
					aria-labelledby="deleteEventLabel" aria-hidden="true">
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
				<h4 align="center">Event Not Found</h4>
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

	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>