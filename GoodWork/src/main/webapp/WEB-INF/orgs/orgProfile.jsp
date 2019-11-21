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


<c:when test="${not empty sessionScope.newUser}">

	<c:set var="isMember" value="false" />
						<c:forEach var="user" items="${org.users}">
							<c:if test="${user.id == sessionScope.newUser.id}">
								<c:set var="isMember" value="true" />
							</c:if>
						</c:forEach>
	<c:choose>
	
		<c:when test="${isMember == true}">
	
		<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${org.logoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item user-name">
                  <strong>${org.orgName}</strong>  <span class="sr-only">(current)</span>
              </li>
              <br>
              <li class="nav-item">
                    ${org.orgDescription}<br><br>
              <li class="nav-item user-name">
                  <strong>Website:<br> ${org.website}</strong>  <span class="sr-only">(current)</span>
              </li>
              <li class="nav-item user-name">
                  <strong>Established As:<br>${org.orgType}</strong>  <span class="sr-only">(current)</span>
              </li>
              <li class="nav-item user-name">
                  <strong>TAX ID:<br>${org.orgNum}</strong>  <span class="sr-only">(current)</span>
              </li>
             <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Command Deck</span>
            </h6>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="createEventForm.do">
                  <span data-feather="plus-square"></span>
                  Create New Event
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="createOrgForm.do">
                  <span data-feather="plus-circle"></span>
                  Create Organization
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="updateOrgForm.do?id=${org.id}">
                  <span data-feather="settings"></span>
                    Edit Organization
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">${org.orgName}'s Dashboard</h4>    
          </div>
<div class="card-deck">
<div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty org}">
      <h5 class="card-title">Organization Members</h5>
			<c:forEach items="${org.users}" var="user">
			<a href="findUserById.do?id=${user.id}">${user.firstName} ${user.lastName}</a><br>

			</c:forEach>
		</c:if>
		</div>
    </div>
  </div> 
</div>
		

</main>
  </div>
    </div>
		</c:when>


		
<c:otherwise>
			<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${org.logoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item user-name">
                  <strong>${org.orgName}</strong>  <span class="sr-only">(current)</span>
              </li>
              <li class="nav-item">
                  <span data-feather="activity"></span>
                    ${org.orgDescription}<br><br>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h4 class="h2">${org.orgName}'s Activity</h4>    
          </div>
<div class="card-deck">
<div class="card">
    <div class="card-body">
      <div class="displayResults">
		<c:if test="${! empty org}">
      <h5 class="card-title">Organization Members</h5>
			<c:forEach items="${org.users}" var="user">
			<a href="findUserById.do?id=${user.id}">${user.firstName} ${user.lastName}</a><br>

			</c:forEach>
		</c:if>
		</div>
    </div>
  </div> 
 </main>			
</div>
</div>
			</c:otherwise>
	
	</c:choose>
		





</c:when>









<c:otherwise>
<div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
          <img src="${org.logoURL}" alt="Avatar" class="avatar">
            <ul class="nav flex-column">
              <li class="nav-item">
                  <strong>${org.orgName}</strong>  <span class="sr-only">(current)</span>
               
              <li class="nav-item">
                  <span data-feather="activity"></span>
                    ${org.orgDescription}<br><br>
           
              </li>
           
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
        
  <div class="card mb-3 card-pad">
		<div class="row no-gutters">
			<div class="col-md-4">
				<img src="css/crosswalk.png" class="card-img"
					alt="Helping people help each other.">
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h1 class="card-title">Hello!</h1>
					<p class="card-text">I see you're having a look around. 
					${userProfile.firstName} could use some help. Sign up for your free goodWork 
					account today and join ${userProfile.firstName}'s group. 
					We do not bill for any of our services, and we will never
					sell your information.</p><br>
					<p class="card-text">Our goal is simple: we want to help you
						help others. Find a volunteer event to join or create your own.</p>
					<!-- <a class="btn btn-blue btn-lg" href="register.do" role="button">Sign Up!</a> -->
					<a class="btn btn-blue2 btn-lg" data-toggle="modal"
						data-target="#modalRegisterForm">Sign Up</a>

				</div>
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