<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>

	<section class="resume-section p-4 p-lg-5 text-center jumbotron"
		id="contact">
		<div class="my-auto">
			<h2 class="mb-4">Hey You...</h2>
			<h4 class="mb-4">
				<strong><a
					href="mailto:goodWorkDenver@gmail.com?subject=Hello goodWork Denver">goodWork</a></strong>
				looks forward to hearing from you!
			</h4>

			<ul class="fa-ul mb-4 ml-0">
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

			<p>...or leave your message below and a member of our team will
				be back to you as soon as possible.</p>

			<form class="contact-form d-flex flex-column align-items-center"
				action="https://formspree.io/goodWorkDenver@gmail.com" method="POST">
				<div class="form-group w-75">
					<input type="name" class="form-control" placeholder="Name"
						name="name" required />
				</div>
				<div class="form-group w-75">
					<input type="email" class="form-control" placeholder="Email"
						name="name" required />
				</div>

				<div class="form-group w-75">
					<textarea class="form-control" type="text" placeholder="Message"
						rows="7" name="name" required></textarea>
				</div>

				<button type="submit" class="btn btn-submit btn-info w-75">Submit</button>
			</form>
		</div>
	</section>

	<footer class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p>Copyright © FluffyCarnage. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- bootstrap script -->
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
	<!-- contact script -->
	<script defer
		src="https://use.fontawesome.com/releases/v5.7.2/js/all.js"
		integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP"
		crossorigin="anonymous"></script>
</body>
</html>