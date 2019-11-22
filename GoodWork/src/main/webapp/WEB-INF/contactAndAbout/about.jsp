<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	 <link rel="stylesheet" type="text/css" href="css/about.css">
<meta charset="UTF-8">
<title>About Us</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>

	<br>
	<!--  -->
	<div class="container media">
		<img class="media-img rounded" src="css/handspic.jpg" alt="">
		<div class="media-body">
			<h5 class="mt-0">At goodWork</h5>
			<p>We believe everyone should have the chance to make a
				difference. Allowing those with the desire to branch out and make a
				impact in their community to easily connect with others of the same
				mind set, and to easily connect those people with the less fortunate
				or those in trouble to get the help they need. We also offer an easy
				way for fellow people to create groups to have a more reliable
				source of help for bigger projects such as building houses, food
				drives, etc.</p>
		</div>
	</div>
	<!--  -->
	<hr>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 mb-4 mt-2 text-center">
					<h1>The Team</h1>
				</div>
			</div>
		</div>
		<div class="container ">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-12 text-center">
					<a href="https://www.linkedin.com/in/david-norris-354697198/"
						target="_blank"></a> <img class="rounded-circle" alt="140x140"
						style="width: 140px; height: 140px;" src="css/img_avatar.png"
						data-holder-rendered="true">
					<h3>David</h3>
					<p>""</p> <!-- Personal quote -->
				</div>
				<div class="col-md-6 col-sm-12 text-center col-lg-4">
					<a href="https://www.linkedin.com/in/richard-n-01730b193/"
						target="_blank"></a><img class="rounded-circle" alt="140x140"
						style="width: 140px; height: 140px;" src="css/img_avatar.png"
						data-holder-rendered="true">
					<h3>Richard</h3>
					<p>""</p> <!-- Personal quote -->
				</div>
				<div class="col-md-6 col-sm-12 text-center col-lg-4">
					<a href="https://www.linkedin.com/in/jerryrogersjr/"
						target="_blank"><img class="rounded-circle" alt="140x140"
						style="width: 140px; height: 140px;" src="css/img_avatar.png"
						data-holder-rendered="true"></a>
					<h3>Jerry</h3>
					<p>""</p> <!-- Personal quote -->
				</div>
			</div>
			<div class="row"></div>
		</div>
	</section>
	<hr>
	<section class="text-center jumbotron" id="contact">
		<ul class="fa-ul mb-4 ml-0" style="list-style-type: none;">
			<li id="mail-address">
				<!--               Replace with your email address --> <i
				class="fas fa-envelope-open mr-2 contact-icons"></i><a
				href="mailto:goodWorkDenver@gmail.com?subject=Hello goodWork Denver">goodWorkDenver@gmail.com</a>
			</li>
			<li><i class="fas fa-mobile-alt mr-2 contact-icons"></i>(303)
				302-5234</li>
			<li><i class="fas fa-map-marker-alt mr-2 contact-icons"></i>Denver,
				CO</li>
		</ul>
	</section>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>