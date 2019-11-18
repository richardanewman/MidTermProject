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
  		<input class="btn-lg btn-block btn btn-green" type="submit" value="Search Keyword" />
		</form>
    </div>
  </div>
  <div class="card">
     <span class="feather-card" data-feather="hash"></span>
    <div class="card-body">
      <h5 class="card-title">Search Organizations By Keyword</h5>
      <p class="card-text">Search organization names and descriptions by keyword.</p>
      <form action="searchOrgs.do" method="GET" >
		<input class="form-control" type="text" required="required" name="keyword" placeholder="Enter A Keyword" />
 		 <input class="btn btn-brown btn-lg btn-block" type="submit" value="Create Organization" />
		</form>
    </div>
  </div>
  <div class="card">
    <span class="feather-card" data-feather="search"></span>
    <div class="card-body">
      <h5 class="card-title">Recent Events</h5>
      <p class="card-text">Extra! Extra! Read all about our recent events.</p>
      <form action="recentEvents.do" method="GET" >
		<input class="form-control" type="text" required="required" name="keyword" placeholder="Enter Keyword"/> 
  		<input class="btn btn-dark btn-lg btn-block" type="submit" value="Recent Events" />
		</form>
    </div>
  </div>
</div>

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