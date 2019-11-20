<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<%@include file="/WEB-INF/nav.jsp"%>
<title>goodWork Dashboard</title>
</head>
<body>
<c:choose>


<c:when test="${not empty newUser}">

	<c:choose>
	
		<c:when test="${newUser.id == userProfile.id}">
		<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${userProfile.photoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                   ${userProfile.firstName} ${userProfile.lastName} <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                    ${userProfile.bio}<br><br>
             <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Command Deck</span>
            </h6>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="displayAll.do">
                  <span data-feather="activity"></span>
                  My Events
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="getNewTxForm.do">
                  <span data-feather="plus-square"></span>
                  Create New Event
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#modify">
                  <span data-feather="edit-2"></span>
                  Edit Event
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#recent-activity">
                  <span data-feather="message-circle"></span>
                  Message Board
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Users Attended
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Reviews
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="updateUserForm.do">
                  <span data-feather="settings"></span>
                    Edit Profile
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">${userProfile.firstName}'s Dashboard</h4>    
          </div>
<div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">My Hosted Events</h5>
			<c:forEach items="${userProfile.hostedEvents}" var="hosted">
			<a href="getEvent.do?id=${hosted.id}">${hosted.eventName}</a><br>
			<p>People Needed: ${hosted.peopleNeeded}</p>
			<strong>Volunteers Signed Up:</strong><br>
			<c:forEach items="${hosted.users}" var="userEvent">
			<a href="findUserById.do?id=${userEvent.user.id}">${userEvent.user.firstName} ${userEvent.user.lastName}</a><br>
			
			</c:forEach>
			<hr>
			</c:forEach>
		</c:if>
		</div>
    </div>
  </div> 
<!-- Begin Card Deck -->
<div class="card-deck">
  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">My Organizations</h5>
			<c:forEach items="${userProfile.orgs}" var="org">
			<c:if test="${org.active == true}">
			<a href="findOrgById.do?id=${org.id}">${org.orgName}</a><br>
			</c:if>
			</c:forEach>
		</c:if>
		</div>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">My Events Joined</h5>
			<c:forEach items="${userProfile.attendedEvents}" var="added">
			<a href="getEvent.do?id=${added.event.id}">${added.event.eventName}</a><br>
			</c:forEach>
		</c:if>
		</div>
 	</div>
</div>
  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">My Events Joined</h5>
			<c:forEach items="${userProfile.attendedEvents}" var="added">
			<a href="getEvent.do?id=${added.event.id}">${added.event.eventName}</a><br>
			</c:forEach>
		</c:if>
		</div>
 	</div>
</div>
</div>
</main>
  </div>
    </div>
	

	
	<h1>Organizations</h1>
	<c:forEach var="org" items="${sessionScope.newUser.orgs}">
		<h3>${org.orgName}</h3><br>
		<p>${org.orgDescription}</p><br>
		<p>${org.orgType}</p><br>
		<br><br><br>
	</c:forEach>
	<h1>Attended events</h1>
	<c:forEach var="attended" items="${sessionScope.newUser.attendedEvents}">
		<h3>${attended.event.eventName}</h3><br>
		<p>${attended.event.description}</p><br>
		<p>${attended.event.eventDate}</p><br>
		<c:choose>
			<c:when test="${attend.attend}">
				<p>Attended Event: Yes! Good Job!</p>
			</c:when>
			<c:otherwise>
				<p>Attended Event: Nope. So Sad!</p>
			</c:otherwise>
		</c:choose>
		<br><br><br>
	</c:forEach>
		<h1>Hosted Events</h1>
	<c:forEach var="hosted" items="${sessionScope.newUser.hostedEvents}">
		<h3>${hosted.eventName}</h3><br>
		<p>${hosted.description}</p><br>
		<p>${hosted.eventDate}</p><br>
	</c:forEach>
	<br>
	<a href="http://localhost:8090/">Home</a>
	<br>
	<form action="createEventForm.do" method="GET">
		<input type="submit" value="Create Event" />
	</form>
	<br>
	<form action="createOrgForm.do" method="GET">
		<input class="submit" type="submit" value="Create Organization" />
	</form>
	<br>
	<form action="logout.do" method="GET">
		<input class="submit" type="submit" value="Logout" />
	</form>
		</c:when>
		


		
		
		
<c:otherwise>
			<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${userProfile.photoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                   ${userProfile.firstName} ${userProfile.lastName} <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                  <span data-feather="activity"></span>
                   ${userProfile.bio}
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">${userProfile.firstName}'s Dashboard</h4>    
          </div>
<div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">${userProfile.firstName}'s Hosted Events</h5>
			<c:forEach items="${userProfile.hostedEvents}" var="hosted">
			<a href="getEvent.do?id=${hosted.id}">${hosted.eventName}</a><br>
			<p>People Needed: ${hosted.peopleNeeded}</p>
			<strong>Volunteers Signed Up:</strong><br>
			<c:forEach items="${hosted.users}" var="userEvent">
			<a href="findUserById.do?id=${userEvent.user.id}">${userEvent.user.firstName} ${userEvent.user.lastName}</a><br>
			
			</c:forEach>
			<hr>
			</c:forEach>
		</c:if>
		</div>
    </div>
  </div> 
<!-- Begin Card Deck -->
<div class="card-deck">

  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">${userProfile.firstName}'s Organizations</h5>
			<c:forEach items="${userProfile.orgs}" var="org">
			<a href="findOrgById.do?id=${org.id}">${org.orgName}</a><br>
			</c:forEach>
		</c:if>
		</div>
    </div>
  </div>
  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">${userProfile.firstName}'s Events Joined</h5>
			<c:forEach items="${userProfile.attendedEvents}" var="added">
			<a href="getEvent.do?id=${added.event.id}">${added.event.eventName}</a><br>
			</c:forEach>
		</c:if>
		</div>
 	</div>
</div>
  <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">Events Joined</h5>
			<c:forEach items="${userProfile.attendedEvents}" var="added">
			<a href="getEvent.do?id=${added.event.id}">${added.event.eventName}</a><br>
			</c:forEach>
		</c:if>
		</div>
 	</div>
</div>
</main>			
			
			</c:otherwise>
	
	</c:choose>
		





</c:when>









<c:otherwise>
<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${userProfile.photoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  ${userProfile.firstName} ${userProfile.lastName} <span class="sr-only">(current)</span>
                </a>
              <li class="nav-item">
                  <span data-feather="activity"></span>
                  ${userProfile.bio}
                </a>
              </li>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty userProfile}">
      <h5 class="card-title">${userProfile.firstName}'s Hosted Events</h5>
			<c:forEach items="${userProfile.hostedEvents}" var="hosted">
			<a href="getEvent.do?id=${hosted.id}">${hosted.eventName}</a><br>
			<p>People Needed: ${hosted.peopleNeeded}</p>
			<strong>Volunteers Signed Up:</strong><br>
			<c:forEach items="${hosted.users}" var="userEvent">
			<a href="findUserById.do?id=${userEvent.user.id}">${userEvent.user.firstName} ${userEvent.user.lastName}</a><br>
			</c:forEach>
			<hr>
			</c:forEach>
		</c:if>
		</div>
    </div>
  </div> 
         
</main>

</c:otherwise>	
</c:choose>
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>