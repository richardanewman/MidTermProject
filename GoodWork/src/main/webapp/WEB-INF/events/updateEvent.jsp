
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<h2 align="center">Update ${event.eventName}</h2>
		<br>

		<div class=" container form-goup jumbotron">
			<form action="updateEvent.do" method="POST">
				<!-- modelAttribute="event" -->
				<label for="eventId" value="${event.id }"></label> <input type="hidden" value="${event.id }"
					name="id" />
				<!--  -->
				<label for="eventId">Event Id</label> <input type="text"
					value="${event.id }" name="eventID" disabled="disabled" class="form-control"/><br>
				<!--  -->
				<label for="eventName">Event Title</label> <input type="text"
					class="form-control" name="eventName" value="${event.eventName}" /><br>
				<!--  -->
				<label for="description">Event Description</label> <input
					type="text" class="form-control" name="description"
					value="${event.description}" /><br>
				<!--  -->
				<c:set var="cat" value="nothing" />
				<c:forEach var="category" items="${event.categories}">
					<c:set var="cat" value="${category.name}"></c:set>
				</c:forEach>
				<select name="name" class="form-control">
					<option value="${cat}">${cat}</option>
					<option value="Clean-Up">Clean-Up</option>
					<option value="Technology">Technology</option>
					<option value="Children & Youth">Children & Youth</option>
					<option value="Animals">Animals</option>
					<option value="Arts & Culture">Arts & Culture</option>
					<option value="Community">Community</option>
					<option value="Education">Education</option>
					<option value="Health & Medicine">Health & Medicine</option>
					<option value="Seniors">Seniors</option>
					<option value="Disaster Relief">Disaster Relief</option>
					<option value="Hunger">Hunger</option>
					<option value="Veterans & Military Families">Veterans &
						Military Families</option>
					<option value="Disabilities">Disabilities</option>
					<option value="Other">Other</option>
				</select><br>
				<!--  -->
				<label for="location.address">Event Address</label> <input
					type="text" class="form-control" name="location.address"
					value="${event.location.address}" /><br>
				<!--  -->
				<label for="location.address2">Event Address 2</label> <input
					type="text" class="form-control" name="location.address2"
					value="${event.location.address2}" /><br>
				<!--  -->
				<label for="location.city">Event City</label> <input type="text"
					value="${event.location.city}" class="form-control"
					name="location.city" /><br>
				<!--  -->
				<label for="location.state">Event State</label>
				<%-- <input type="text"
					class="form-control" name="location.state"
					value="${event.location.state}" /> --%>
				<select class="form-control" name="location.state">
					<option value="">NA</option>
					<option value="AK">Alaska</option>
					<option value="AL">Alabama</option>
					<option value="AR">Arkansas</option>
					<option value="AZ">Arizona</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DC">District of Columbia</option>
					<option value="DE">Delaware</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="IA">Iowa</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="MA">Massachusetts</option>
					<option value="MD">Maryland</option>
					<option value="ME">Maine</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MO">Missouri</option>
					<option value="MS">Mississippi</option>
					<option value="MT">Montana</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="NE">Nebraska</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NV">Nevada</option>
					<option value="NY">New York</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="PR">Puerto Rico</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VA">Virginia</option>
					<option value="VT">Vermont</option>
					<option value="WA">Washington</option>
					<option value="WI">Wisconsin</option>
					<option value="WV">West Virginia</option>
					<option value="WY">Wyoming</option>
				</select> <br>
				<!--  -->
				<label for="location.zipCode">Event Zip Code</label> <input
					type="text" class="form-control" name="location.zipCode"
					value="${event.location.zipCode}" /><br>
				<!--  -->
				<label for="eventDate">Event Date</label> <input type="date"
					class="form-control" name="eventDate" value="${event.eventDate}" /><br>
				<!--  -->
				<label for="eventDate">Start Time</label> <input type="time"
					class="form-control" name="startTime" value="${event.startTime}" /><br>
				<!--  -->
				<label for="endTime">End Time</label> <input type="time"
					value="${event.endTime}" class="form-control" name="endTime" /><br>
				<!--  -->
				<label for="peopleNeeded">Number of people needed</label> <input
					type="number" class="form-control" name="peopleNeeded"
					value="${event.peopleNeeded}" /><br>
				<!--  -->
				<label for="pointOfContact">Point of Contact</label> <input
					type="text" class="form-control" name="pointOfContact"
					value="${event.pointOfContact }" /><br>
				<!--  -->
				<label for="pocPhone">POC Phone Number</label> <input type="phone"
					class="form-control" name="pocPhone" value="${event.pocPhone}" /><br>
				<!--  -->
				<label for="pocEmail">POC Email</label> <input type="email"
					value="${event.pocEmail }" class="form-control" name="pocEmail" /><br>
				<!--  -->
				<label for="photoUrl">Photo Url</label> <input type="text"
					value="${event.photoUrl }" class="form-control" name="photoUrl" /><br>
				<br>

				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
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
</html>