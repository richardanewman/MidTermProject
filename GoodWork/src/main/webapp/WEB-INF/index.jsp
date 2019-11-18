<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
<title>Home</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<header>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Fluid jumbotron</h1>
    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  </div>
</div>
</header>
<body>
	<form action="login.do" method="GET">
		<input class="submit" type="submit" value="Login" />
	</form>

	<form action="getAllOrgs.do" method="GET">
		<input class="submit" type="submit" value="List All Organizations" />
	</form>
	<form action="createOrgForm.do" method="GET">
		<input class="submit" type="submit" value="Create Organization" />
	</form>

	<!-- Event By Id -->
	<br>
	<form action="getEvent.do" method="GET">
		<input type="number" name="id" placeholder="enter event ID"
			required="required" /> <input type="submit" value="Show Event" />
	</form>
	<!-- Create New Event -->
	<br>
	<form action="createEventForm.do" method="GET">
		<input type="submit" value="Create Event" />
	</form>
	<br>
	<!-- List of Events -->
	<form action="getEventList.do" method="GET">
		<input type="submit" class="btn btn-primary" value="List Events" />
	</form>
	<br>


	<form action="findOrgById.do" method="GET">
		<input class="form-control" type="number" min="0" required="required"
			name="id" placeholder="Enter ID" /> <input
			class="btn btn-dark btn-lg btn-block" type="submit"
			value="Find Organization By ID" />
	</form>
	<form action="searchOrgs.do" method="GET">
		<input class="form-control" type="text" required="required"
			name="keyword" placeholder="Enter A Keyword" /> <input
			class="btn btn-dark btn-lg btn-block" type="submit"
			value="Search Organizations By Keyword" />
	</form>

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
	<!-- js files for bootstap -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>