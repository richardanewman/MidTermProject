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

								<!-- ///////////////////////////MODAL TOP/////////////////////////// -->

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
											<form action="addNewUser.do" method="POST"
												modelAttribute="user">

												<div class="modal-body mx-3">
													<!--  -->
													<div class="md-form mb-5">
														<input type="text" name="firstName" required="required"
															class="form-control form-control-lg rounded-0"
															placeholder="First Name"> <label for="firstName"></label>
													</div>
													<!--  -->
													<div class="md-form mb-5">
														<input type="text" name="lastName" required="required"
															class="form-control form-control-lg rounded-0"
															placeholder="Last Name"><label name="lastName"></label>
													</div>
													<!--  -->
													<div class="md-form mb-4">
														<input type="text" name="userName" required="required"
															class="form-control form-control-lg rounded-0"
															placeholder="Desired Username"> <label
															name="userName"></label>
													</div>
													<!--  -->
													<div class="md-form mb-4">
														<input type="password" name="password" required="required"
															class="form-control form-control-lg rounded-0"
															placeholder="Desired Password"> <label
															name="password"></label>
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
							<!-- Modal Pop-up button below. Model form above -->
							<div class="text-center">
								<a href=""
									class="btn btn-lg btn-primary btn-block text-uppercase"
									data-toggle="modal" data-target="#modalRegisterForm">Register</a>
							</div>

							<!-- ////////////////////////////MODAL BOTTOM////////////////////////// -->

							<%-- <form:form action="register.do" method="GET"
								modelAttribute="user">
								<button value="Register"
									class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Register</button>
							</form:form> --%>
							<!-- <button class="btn btn-lg btn-google btn-block text-uppercase"
								type="submit">
								<i class="fab fa-google mr-2"></i> Sign in with Google
							</button>
							<button class="btn btn-lg btn-facebook btn-block text-uppercase"
								type="submit">
								<i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook
							</button> -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Original Below -->
	<!-- <div> -->
	<%-- 		<form:form action="enter.do" method="GET" modelAttribute="user">
			<form:label path="userName" style="color:Blue;">User Name: </form:label>
			<form:input path="userName" />
			<form:errors path="userName" />
			<form:label path="password" style="color:Blue;">Password: </form:label>
			<form:input path="password" />
			<form:errors path="password" />
			<input type="submit" value="Login" class="btn btn-outline-primary"
				role="button" aria-disabled="true" />
			<br>

		</form:form> --%>
	<%-- <form:form action="register.do" method="GET" modelAttribute="user">
			<input type="submit" value="Register" class="btn btn-outline-primary"
				role="button" aria-disabled="true" />
		</form:form> --%>
	<!-- </div> -->
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
</body>
</html>