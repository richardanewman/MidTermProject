<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet" type="text/css">
<title>Home</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<header>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">goodWork</h1>
    <h3 class="motto">Helping people help each other.</h3>
  </div>
</div>
</header>
<body>
<div class="card-deck">
  <div class="card">
    <span class="feather-card" data-feather="search"></span>
    <div class="card-body">
      <h5 class="card-title">Search Events By Keyword</h5>
      <p class="card-text">Search event titles and descriptions by keyword.</p>
      <form action="eventKeyword.do" method="GET" >
		<input class="form-control" type="text" required="required" name="keyword" placeholder="Enter Keyword"/> 
  		<input class="btn btn-dark btn-lg btn-block" type="submit" value="Search Keyword" />
		</form>
    </div>
  </div>
  <div class="card">
     <span class="feather-card" data-feather="hash"></span>
    <div class="card-body">
      <h5 class="card-title">Create An Organization</h5>
      <p class="card-text">Register an existing organization or create a community group.</p>
      <form action="findById.do" method="GET" >
		<input class="form-control" type="number"  min="0" required="required" name="id" placeholder="Enter ID"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Find By ID" />
		</form>
    </div>
  </div>
  <div class="card">
    <span class="feather-card" data-feather="search"></span>
    <div class="card-body">
      <h5 class="card-title">Search By Keyword</h5>
      <p class="card-text">Search transaction descriptions by a single keyword</p>
      <form action="searchKeyword.do" method="GET" >
		<input class="form-control" type="text" required="required" name="keyword" placeholder="Enter Keyword"/> 
  		<input class="btn btn-dark btn-lg btn-block" type="submit" value="Search Keyword" />
		</form>
    </div>
  </div>
</div>


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