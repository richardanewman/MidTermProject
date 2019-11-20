<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
</head>
<c:choose>
	<c:when test="${not empty newUser}">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/">goodWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="about.do">About <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="login.do">Profile</a></li>
					<li class="nav-item"><a class="nav-link"
						href="createEventForm.do">Create Event</a></li>
					<li class="nav-item"><a class="nav-link"
						href="getEventList.do">Events</a></li>
					<li class="nav-item"><a class="nav-link" href="getAllOrgs.do">Organizations</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.do">Contact</a></li>
				</ul>
				<form action="search.do" class="form-inline my-2 my-lg-0"
					method="GET">
					<input class="form-control mr-sm-2" type="text" name="keyword"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link" href="logout.do">Log
								Out</a></li>
					</ul>
				</form>
			</div>
		</nav>
	</c:when>
	<c:otherwise>
		<nav class="navbar navbar-expand-lg navbar-light bg-light nav-bottom">
			<a class="navbar-brand" href="/">goodWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="about.do">About <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="getEventList.do">Events</a></li>
					<li class="nav-item"><a class="nav-link" href="getAllOrgs.do">Organizations</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.do">Contact</a></li>
				</ul>
				<form action="search.do" class="form-inline my-2 my-lg-0"
					method="GET">
					<input class="form-control mr-sm-2" type="text" name="keyword"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link" href="login.do">Log
								In</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="modal"
							data-target="#modalRegisterForm">Register</a></li>
					</ul>
				</form>
			</div>
		</nav>

	</c:otherwise>

</c:choose>
<!-- ///////////////////////////REGISTRATION MODAL TOP/////////////////////////// -->

<div class="modal fade" id="modalRegisterForm" tabindex="-1"
	role="dialog" aria-labelledby="Register" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center mb-0">
				<h4 class="modal-title w-100 font-weight-bold">Sign up</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="addNewUser.do" method="POST" modelAttribute="user">

				<div class="modal-body mx-3">
					<!--  -->
					<div class="md-form mb-4">
						<input type="text" name="firstName" required="required"
							class="form-control form-control-lg rounded-0"
							placeholder="First Name"> <label for="firstName"></label>
					</div>
					<!--  -->
					<div class="md-form mb-4">
						<input type="text" name="lastName" required="required"
							class="form-control form-control-lg rounded-0"
							placeholder="Last Name"><label name="lastName"></label>
					</div>
					<!--  -->
					<div class="md-form mb-4">
						<input type="text" name="userName" required="required"
							class="form-control form-control-lg rounded-0"
							placeholder="Desired Username"> <label name="userName"></label>
					</div>
					<!--  -->
					<div class="md-form mb-4">
						<input type="password" name="password" required="required"
							class="form-control form-control-lg rounded-0"
							placeholder="Desired Password"> <label name="password"></label>
					</div>
					<!--  -->
					<div class="md-form mb-4">
						<input type="email" name="email" required="required"
							class="form-control form-control-lg rounded-0"
							placeholder="Email Address"> <label name="email"></label>
					</div>
					<!--  -->
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="submit" value="Register"
						class="btn btn-lg btn-primary btn-block text-uppercase">Sign
						up</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>


<!-- ////////////////////////////REGISTRATION MODAL BOTTOM////////////////////////// -->

</html>