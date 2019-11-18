<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
<title>Update Event</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<br>
	<div>
		<h2 align="center">Update an Event</h2>
		<br>

		<div class=" container form-goup jumbotron">
			<form action="updateEvent.do" method="POST">
				<%-- <label path="id" default="${event.id }">Editing ${event.eventName}</label> --%>
				<div>

					<label for="eventName">Event Title</label> <input type="text"
						class="form-control" name="eventName" value="${event.eventName}" <%-- placeholder="${event.eventName}" --%>  /><br>
					<!--  -->
					<label for="description">Event Description</label> <input
						type="text" class="form-control" name="description"
						value="${event.description}" p<%-- laceholder="${event.description}" --%>  /><br>
					<!--  -->
					<label for="address">Event Address</label> <input type="text"
						class="form-control" name="address"
						value="${event.location.address}" <%-- placeholder="${event.location.address}" --%>  /><br>
					<!--  -->
					<label for="address2">Event Address 2</label> <input type="text"
						class="form-control" name="address2"
						value="${event.location.address2}"
						<%-- placeholder="${event.location.address2}" --%> required="required" /><br>
					<!--  -->
					<label for="city">Event City</label> <input type="text"
						value="${event.location.city}" class="form-control" name="city" <%-- placeholder="${event.location.city}" --%>
						 /><br>
					<!--  -->
					<label for="state">Event State</label> <input type="text"
						class="form-control" name="state" value="${event.location.state}" <%-- placeholder="${event.location.state}" --%>  /><br>
					<!--  -->
					<label for="zipCode">Event Zip Code</label> <input type="text"
						class="form-control" name="zipCode"
						value="${event.location.zipCode}" <%-- placeholder="${event.location.zipCode}" --%>  /><br>
					<!--  -->
					<label for="eventDate">Event Date</label> <input type="text"
						class="form-control" name="eventDate" value="${event.eventDate}" <%-- placeholder="${event.eventDate}" --%>  /><br>
					<!--  -->
					<label for="eventDate">Start Time</label> <input type="text"
						class="form-control" name="startTime" value="${event.startTime}" <%-- placeholder="${event.startTime}" --%>  /><br>
					<!--  -->
					<label for="endTime">End Time</label> <input type="text"
						value="${event.endTime}" class="form-control" name="endTime" <%-- placeholder="${event.endTime}" --%>
						 /><br>
					<!--  -->
					<label for="peopleNeeded">Number of people needed</label> <input
						type="number" class="form-control" name="peopleNeeded"
						value="${event.peopleNeeded}" <%-- placeholder="${event.peopleNeeded}" --%>  /><br>
					<!--  -->
					<label for="pointOfContact">Point of Contact</label> <input
						type="text" class="form-control" name="pointOfContact"
						value="${event.pointOfContact }" <%-- placeholder="${event.pointOfContact }" --%>  /><br>
					<!--  -->
					<label for="pocPhone">POC Phone Number</label> <input type="number"
						class="form-control" name="pocPhone" value="${event.pocPhone}" <%-- placeholder="${event.pocPhone}" --%>  /><br>
					<!--  -->
					<label for="pocEmail">POC Email</label> <input type="text"
						value="${event.pocEmail }" class="form-control" name="pocEmail"
						placeholder="${event.pocEmail }" /><br>
					<!--  -->
					<label for="photoUrl">POC Email</label> <input type="text"
						value="${event.photoUrl }" class="form-control" name="photoUrl" <%-- placeholder="${event.photoUrl }" --%>
						 /><br>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
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
		<div>
			<h2 align="center">Update an Event</h2>
			<br>

			<div class=" container form-goup jumbotron">
				<form action="updateEvent.do" method="POST">
					<%-- <label path="id" default="${event.id }">Editing ${event.eventName}</label> --%>
					<div>

						<label for="eventName">Event Title</label> <input type="text"
							class="form-control" name="eventName" value="${event.eventName}" <%-- placeholder="${event.eventName}" --%>  /><br>
						<!--  -->
						<label for="description">Event Description</label> <input
							type="text" class="form-control" name="description"
							value="${event.description}" p<%-- laceholder="${event.description}" --%>  /><br>
						<!--  -->
						<label for="address">Event Address</label> <input type="text"
							class="form-control" name="address"
							value="${event.location.address}" <%-- placeholder="${event.location.address}" --%>  /><br>
						<!--  -->
						<label for="address2">Event Address 2</label> <input type="text"
							class="form-control" name="address2"
							value="${event.location.address2}"
							<%-- placeholder="${event.location.address2}" --%> required="required" /><br>
						<!--  -->
						<label for="city">Event City</label> <input type="text"
							value="${event.location.city}" class="form-control" name="city" <%-- placeholder="${event.location.city}" --%>
						 /><br>
						<!--  -->
						<label for="state">Event State</label> <input type="text"
							class="form-control" name="state" value="${event.location.state}" <%-- placeholder="${event.location.state}" --%>  /><br>
						<!--  -->
						<label for="zipCode">Event Zip Code</label> <input type="text"
							class="form-control" name="zipCode"
							value="${event.location.zipCode}" <%-- placeholder="${event.location.zipCode}" --%>  /><br>
						<!--  -->
						<label for="eventDate">Event Date</label> <input type="text"
							class="form-control" name="eventDate" value="${event.eventDate}" <%-- placeholder="${event.eventDate}" --%>  /><br>
						<!--  -->
						<label for="eventDate">Start Time</label> <input type="text"
							class="form-control" name="startTime" value="${event.startTime}" <%-- placeholder="${event.startTime}" --%>  /><br>
						<!--  -->
						<label for="endTime">End Time</label> <input type="text"
							value="${event.endTime}" class="form-control" name="endTime" <%-- placeholder="${event.endTime}" --%>
						 /><br>
						<!--  -->
						<label for="peopleNeeded">Number of people needed</label> <input
							type="number" class="form-control" name="peopleNeeded"
							value="${event.peopleNeeded}" <%-- placeholder="${event.peopleNeeded}" --%>  /><br>
						<!--  -->
						<label for="pointOfContact">Point of Contact</label> <input
							type="text" class="form-control" name="pointOfContact"
							value="${event.pointOfContact }" <%-- placeholder="${event.pointOfContact }" --%>  /><br>
						<!--  -->
						<label for="pocPhone">POC Phone Number</label> <input
							type="number" class="form-control" name="pocPhone"
							value="${event.pocPhone}" <%-- placeholder="${event.pocPhone}" --%>  /><br>
						<!--  -->
						<label for="pocEmail">POC Email</label> <input type="text"
							value="${event.pocEmail }" class="form-control" name="pocEmail"
							placeholder="${event.pocEmail }" /><br>
						<!--  -->
						<label for="photoUrl">POC Email</label> <input type="text"
							value="${event.photoUrl }" class="form-control" name="photoUrl" <%-- placeholder="${event.photoUrl }" --%>
						 /><br>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
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
			<!--  -->
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