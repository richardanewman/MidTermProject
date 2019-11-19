<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
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
			<li class="nav-item active"><a class="nav-link" href="about.do">About
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="login.do">Profile</a></li>
			<li class="nav-item"><a class="nav-link" href="createEventForm.do">Create Event</a></li>
			<li class="nav-item"><a class="nav-link" href="getEventList.do">Events</a></li>
			<li class="nav-item"><a class="nav-link" href="getAllOrgs.do">Organizations</a></li>
			<li class="nav-item"><a class="nav-link" href="contact.do">Contact</a></li>
		</ul>
		<form action="search.do" class="form-inline my-2 my-lg-0" method="GET">
			<input class="form-control mr-sm-2" type="text"
				name="keyword" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="logout.do">Log Out</a></li>
			</ul>
		</form>
	</div>
</nav>
</c:when>
<c:otherwise>
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
			<li class="nav-item active"><a class="nav-link" href="about.do">About
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="getEventList.do">Events</a></li>
			<li class="nav-item"><a class="nav-link" href="getAllOrgs.do">Organizations</a></li>
			<li class="nav-item"><a class="nav-link" href="contact.do">Contact</a></li>
		</ul>
		<form action="search.do" class="form-inline my-2 my-lg-0" method="GET">
			<input class="form-control mr-sm-2" type="text"
				name="keyword" placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="login.do">Log In</a></li>
			<li class="nav-item"><a class="nav-link" href="register.do">Register</a></li>
			</ul></form>
	</div>
</nav>

</c:otherwise>

</c:choose>
</html>