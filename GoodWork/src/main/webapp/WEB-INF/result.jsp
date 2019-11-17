<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/css/bootstrap.css"
	rel="stylesheet">
<title>Result</title>
</head>
<body>
	<div class="displayResults">
		<c:if test="${! empty displayAll}">
			<h1>All Organizations:</h1>
			<c:forEach items="${displayAll}" var="org">
${org.orgName}<br>
				<br>
${org.orgDescription}<br>
				<br>
${org.location.address}<br>
				<br>
${org.location.city}<br>
				<br>
${org.location.state}<br>
				<br>
${org.orgType}<br>
				<br>
${org.orgNum}<br>
				<br>
${org.logoURL}<br>
				<br>
${org.website}<br>
				<br>
			</c:forEach>
		</c:if>


		<c:if test="${! empty org}">
			<h1>Found it!</h1>
${org.orgName}<br>
			<br>
${org.location.address}<br>
			<br>
${org.location.city}<br>
			<br>
${org.location.state}<br>
			<br>
${org.orgType}<br>
			<br>
${org.orgNum}<br>
			<br>
${org.logoURL}<br>
			<br>
${org.website}<br>
			<br>
		</c:if>
		<br>

		<c:if test="${! empty successfulDelete}">
			<h1>Success!</h1>
${successfulDelete}
</c:if>

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
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://cdn.jsdelivr.net/webjars/org.webjars.bower/jquery/3.3.1/dist/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script
			src="https://cdn.jsdelivr.net/webjars/org.webjars/popper.js/1.15.0/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/webjars/org.webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
</body>
</html>