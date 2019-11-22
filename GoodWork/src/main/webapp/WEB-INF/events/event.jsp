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
<title>Event</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>

<body>


	<br>
	<div class="container rounded" align="center">
			<h1>${event.eventName}</h1>
			<h5>${event.eventDate}</h5>
	</div>
	<div class="container form-goup jumbotron" align="center">
		<div class="card-deck">
			<div class="card">
				<span class="feather-card" data-feather="search"></span>
				<div class="card-body">
					<img alt="" src="${event.photoUrl}"  class="d-block w-100">
					<c:if test="${empty event.photoUrl}">
					<img alt="" src="css/bg.png" class="d-block w-100">
					</c:if>
					<table class="container rounded">
			
			
			
		</table>
					<table class="table table-responsive table-hover table-bordered table-light"
						style="background-color: #EBE8F1">
						<thread>
						<tr>
							<th scope="col">Event Information</th>
							<th scope="col">${event.description }</th>
						</tr>
						<tr>
							<td>ID</td>
							<td>${event.id}</td>
						</tr>
						<tr>
							<td>Address</td>
							<td>${event.location.address}</td>
						</tr>
						<tr>
							<td>Address</td>
							<td>${event.location.address2}</td>
						</tr>
						<tr>
							<td>City</td>
							<td>${event.location.city}</td>
						</tr>
						<tr>
							<td>State</td>
							<td>${event.location.state}</td>
						</tr>
						<tr>
							<td>Zip Code</td>
							<td>${event.location.zipCode}</td>
						</tr>
						<tr>
							<td>Start Time</td>
							<td>${event.startTime}</td>
						</tr>
						<tr>
							<td>End Time</td>
							<td>${event.endTime}</td>
						</tr>
						<tr>
							<td>Number of People Need</td>
							<td>${event.peopleNeeded}</td>
						</tr>
						<tr>
							<td>Date Created</td>
							<td>${event.dateCreated}</td>
						</tr>
						<tr>
							<td>Point of Contact (POC)</td>
							<td>${event.pointOfContact}</td>
						</tr>
						<tr>
							<td>POC Phone</td>
							<td>${event.pocPhone}</td>
						</tr>
						<tr>
							<td>POC Email</td>
							<td>${event.pocEmail}</td>
						</tr>
						<tr>
							<td>Category</td>
							<c:forEach var="cat" items="${event.categories}">
								<td>${cat.name}</td>
							</c:forEach>
						</tr>
						<tr>
							<td>Photo Url</td>
							<td>${event.photoUrl}</td>
						</tr>

						</thread>
					</table>

				</div>

			</div>
		</div>

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
							<input type="submit" value="Update" class="btn btn-primary" />
							<br />
						</form:form>
						<!--  -->
						<!-- Button trigger modal -->
						<hr>
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
								<a href="index.do">Already signed up</a>
								<form:form action="goToUnRegisterEvent.do" method="GET" modelAttribute="event">
									<form:label path="id" value="${event.id}"></form:label>
									<form:hidden path="id" value="${event.id}" />
									<form:errors path="id" value="${event.id}" />
									<input type="submit" value="Un-Register" class="btn btn-primary" />
									<br />
								</form:form>
							</c:when>
							<c:otherwise>
								<form:form action="signUpForEvent.do" method="GET"
									modelAttribute="event">
									<form:label path="id" value="${event.id}"></form:label>
									<form:hidden path="id" value="${event.id}" />
									<form:errors path="id" value="${event.id}" />
									<input type="submit" value="Sign Up" class="btn btn-primary" />
									<br />
								</form:form>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<h5 class="finePrint">Must be a registered user to sign up for events. Just do it!
					It's Free.</h5>
			</c:otherwise>
		</c:choose>
	</div>
	<!--  -->
	<!-- <form action="updateEvent.do" method="POST">
					<input type="submit" class="btn btn-primary" value="Update Event" />

            // Set refresh, autoload time as 5 seconds
            			</form> -->

<div class="container form-goup jumbotron message">
<h1 style="text-align: center;">${event.eventName} Message Board</h1>
	<c:if test="${not empty messages}">
 <c:forEach items="${messages}" var="message">
  <div class="card mb-3 message">
   <div class="row no-gutters">
    <div class="col-md-1 align-self-center">
     <img src="${message.user.photoURL}" class="avatar" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${message.user.firstName} ${message.user.lastName}</h5>
        <p class="card-text">${message.content}</p>
        <p class="card-text"><small class="text-muted">${message.datePosted}</small></p>
      </div>
    </div>
   </div>
  </div>
 </c:forEach>
</c:if>
<hr>
<c:if test="${not empty newUser }">
<form:form action="reply.do?eId=${event.id}" method="POST" modelAttribute="userMessage">
		<form:label path="user.id" value="${sessionScope.newUser.id}"></form:label>
		<form:hidden path="user.id" value="${sessionScope.newUser.id}" />
		<form:errors path="user.id" value="${sessionScope.newUser.id}" />
		<form:label path="content" value="Reply">Reply</form:label>
		<form:input class="form-control" path="content" 
			required="required" type="text" placeholder="Enter Reply" />
		<form:errors path="content" value="Enter Reply" /><br>
		<input class="btn btn-primary" type="submit" value="Reply" />
	</form:form>
</c:if>
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