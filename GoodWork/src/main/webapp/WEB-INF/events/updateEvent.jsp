<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<div class="form-group">
<form:form action="updateEvent.do" method="POST" modelAttribute="event">
<form:label path="id" default="${event.id}" ><h1><strong>Editing ${event.eventName} | ID: ${event.id} </strong></h1> </form:label><br>
		<form:label path="eventName">Event Name: </form:label><br>
		<form:input class="form-control" path="eventName" default="${event.eventName}" placeholder="${event.eventName}"/>
		<form:errors path="event" />
		<br />
		<form:label path="description">Event Description: </form:label><br>
		<form:input class="form-control" path="description" default="${event.description}" placeholder="${event.description}"/>
		<form:errors path="orgDescription" />
		<br />
		<form:label path="location.address">Street Address: </form:label><br>
		<form:input class="form-control" path="location.address" default="${event.location.address}" placeholder="${event.location.address}"/>
		<form:errors path="location.address" />
		<br />
		<form:label path="location.address2">Address line 2: </form:label><br>
		<form:input class="form-control" path="location.address2" default="${event.location.address2}" placeholder="${event.location.address2}"/>
		<form:errors path="location.address2" />
		<br />
		<form:label path="location.city">City: </form:label><br>
		<form:input class="form-control" path="location.city" default="${event.location.city}" placeholder="${event.location.city}"/>
		<form:errors path="location.city" />
		<br />
		<form:label path="location.state">State: </form:label><br>
		<form:input class="form-control" path="location.state" default="${event.location.state}" placeholder="${event.location.state}"/>
		<form:errors path="location.state" />
		<br />
		<form:label path="location.zipCode">Zip Code: </form:label><br>
		<form:input class="form-control" path="location.zipCode" default="${event.location.zipCode}" placeholder="${event.location.zipCode}"/>
		<form:errors path="location.zipCode" />
		<br />
		<form:label path="photoUrl">Photo URL: </form:label><br>
		<form:input class="form-control" path="logoURL" default="${event.photoUrl}" placeholder="${event.photoUrl}"/>
		<form:errors path="photoUrl" />
		<br />
	    <input class="btn btn-dark btn-lg btn-block" type="submit" value="Submit" />
	</form:form>
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
</html> --%>