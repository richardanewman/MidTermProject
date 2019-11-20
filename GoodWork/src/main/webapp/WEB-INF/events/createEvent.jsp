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
<title>Create Event</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<br>
	<header>
		<h2 align="center">Create an Event</h2>
	</header>
	<br>
	<div>
		<div class=" container form-goup jumbotron">
			<form action="createEvent.do" method="POST" modelAttribute="newEvent">
				<%-- <label for="id" value="${event.id }"></label> --%>
				<div>
					<label for="eventName">Event Title</label> <input type="text"
						class="form-control" name="eventName"
						placeholder="enter event Title" required="required" /><br>
					<!--  -->
					<label for="description">Event Description</label> <input
						type="text" class="form-control" name="description"
						placeholder="enter description of event" required="required" /><br>
					<!--  -->
					<label>Catagory</label> <select
						class="form-control" name="name">
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
					<label for="event.location.address">Event Address</label> <input
						type="text" class="form-control" name="location.address"
						<%-- value="${event.location.address }"  --%>
						placeholder="enter address of event" /><br>
					<!--  -->
					<label for="event.location.address2">Event Address 2</label> <input
						type="text" class="form-control" name="location.address2"
						<%-- value="${event.location.address2 }" --%>
						placeholder="enter address 2 of event" /><br>
					<!--  -->
					<label for="event.location.city">Event City</label> <input
						type="text" class="form-control" name="location.city"
						<%-- value="${event.location.city }" --%> placeholder="enter city of event" /><br>
					<!--  -->
					<!-- <label for="event.location.state">Event State</label> -->
					<!-- <div class="form-group"> -->
					<label for="event.location.state" class="col-sm-2 control-label">Event
						State</label> <select class="form-control" name="event.location.state">
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
					</select>

					<%-- <input
						type="text" class="form-control" name="location.state"
						value="${event.location.state }"
						placeholder="enter state of event" /> --%>
					<br>
					<!--  -->
					<label for="event.location.zipCode">Event Zip Code</label> <input
						type="text" class="form-control" name="location.zipCode"
						value="${event.location.zipCode }"
						placeholder="enter zip code of event" /><br>
					<!--  -->
					<label for="eventDate">Event Date</label> <input type="text"
						class="form-control" name="eventDate"
						placeholder="enter event date" /><br>
					<!--  -->
					<label for="eventDate">Start Time</label> <input type="text"
						class="form-control" name="startTime"
						placeholder="enter start time" /><br>
					<!--  -->
					<label for="endTime">End Time</label> <input type="text"
						class="form-control" name="endTime" placeholder="enter end time" /><br>
					<!--  -->
					<label for="peopleNeeded">Number of people needed</label> <input
						type="number" class="form-control" name="peopleNeeded"
						placeholder="enter number of people needed" /><br>
					<!--  -->
					<label for="pointOfContact">Point of Contact</label> <input
						type="text" class="form-control" name="pointOfContact"
						placeholder="enter point of contact" /><br>
					<!--  -->
					<label for="pocPhone">POC Phone Number</label> <input type="number"
						class="form-control" name="pocPhone"
						placeholder="enter phone number" /><br>
					<!--  -->
					<label for="pocEmail">POC Email</label> <input type="text"
						class="form-control" name="pocEmail" placeholder="enter email" /><br>
					<!--  -->
					<label for="photoUrl">Photo URL</label> <input type="text"
						class="form-control" name="photoUrl" placeholder="enter photo url" /><br>
				</div>
				<button type="submit" class="btn btn-primary">Create Event</button>
			</form>
		</div>
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