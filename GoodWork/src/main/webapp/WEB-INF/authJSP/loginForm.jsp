<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Login</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container-fluid jumbotron"
		style="background-color: #0f2862" align="center">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card rounded shadow shadow-sm">
						<div class="card-body">
							<h5 class="card-title text-center mb-0">Sign In</h5>
							<div class="form-label-group" align="center">
								<form:form action="enter.do" method="GET" modelAttribute="user">
									<div>
										<form:label path="userName"></form:label>
										<form:input path="userName"
											class="form-control form-control-lg rounded-0"
											placeholder="user name" />
										<form:errors path="userName" />
									</div>
									<br>
									<div>
										<form:label path="password"></form:label>
										<form:input path="password"
											class="form-control form-control-lg rounded-0"
											placeholder="password" type="password" />
										<form:errors path="password" />
									</div>
									<br>
									<br>
									<button value="Login"
										class="btn btn-lg btn-primary btn-block text-uppercase"
										type="submit">Sign in</button>
								</form:form>

								<hr class="my-4">

								<!-- Modal Pop-up button below. Model form above -->
								<div class="text-center">
									<a href=""
										class="btn btn-lg btn-primary btn-block text-uppercase"
										data-toggle="modal" data-target="#modalRegisterForm">Register</a>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p>Copyright © FluffyCarnage. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- BootStrap Script Below -->
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
		<script defer
		src="https://use.fontawesome.com/releases/v5.7.2/js/all.js"
		integrity="sha384-0pzryjIRos8mFBWMzSSZApWtPl/5++eIfzYmTgBBmXYdhvxPc+XcFEk+zJwDgWbP"
		crossorigin="anonymous"></script>
</body>
</html>