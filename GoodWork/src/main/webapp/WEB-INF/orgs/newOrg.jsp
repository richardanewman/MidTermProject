<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<title>Create New Organization</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<div class="container form-goup jumbotron">
		<h1>Create A New Organization</h1>
		<form:form action="addNewOrg.do" method="POST" modelAttribute="newOrg">
			<form:label path="orgName">Organization Name</form:label>
			<br>
			<form:input class="form-control" path="orgName" required="required"
				type="text" placeholder="Organization's Name" />
			<form:errors path="orgName" />
			<br />
			<form:label path="orgDescription">Organization Description</form:label>
			<br>
			<form:input class="form-control" path="orgDescription"
				required="required" type="textarea"
				placeholder="Organization's Description" />
			<form:errors path="orgDescription" />
			<br />
			<form:label path="location.address">Address</form:label>
			<br>
			<form:input class="form-control" path="location.address" type="text"
				placeholder="Street Address" />
			<form:errors path="location.address" />
			<br />
			<form:label path="location.address2">Address</form:label>
			<br>
			<form:input class="form-control" path="location.address2" type="text"
				placeholder="Suite Number" />
			<form:errors path="location.address2" />
			<br />
			<form:label path="location.city">City</form:label>
			<br>
			<form:input class="form-control" path="location.city"
				required="required" type="text" placeholder="City" />
			<form:errors path="location.city" />
			<br />
			<form:label path="location.state">State</form:label>
			<br>
			<%-- <form:input class="form-control" path="location.state" required="required" type="text" placeholder="State"/> --%>
			<form:select class="form-control" path="location.state" required="required">
				<form:option value="" label="  " />
				<form:option value="AK" label="Alaska" />
				<form:option value="AL" label="Alabama" />
				<form:option value="AR" label="Arkansas" />
				<form:option value="AZ" label="Arizona" />
				<form:option value="CA" label="California" />
				<form:option value="CO" label="Colorado" />
				<form:option value="CT" label="Connecticut" />
				<form:option value="DC" label="District of Columbia" />
				<form:option value="DE" label="Delaware" />
				<form:option value="FL" label="Florida" />
				<form:option value="GA" label="Georgia" />
				<form:option value="HI" label="Hawaii" />
				<form:option value="IA" label="Iowa" />
				<form:option value="ID" label="Idaho" />
				<form:option value="IL" label="Illinois" />
				<form:option value="IN" label="Indiana" />
				<form:option value="KS" label="Kansas" />
				<form:option value="KY" label="Kentucky" />
				<form:option value="LA" label="Louisiana" />
				<form:option value="MA" label="Massachusetts" />
				<form:option value="MD" label="Maryland" />
				<form:option value="ME" label="Maine" />
				<form:option value="MI" label="Michigan" />
				<form:option value="MN" label="Minnesota" />
				<form:option value="MO" label="Missouri" />
				<form:option value="MS" label="Mississippi" />
				<form:option value="MT" label="Montana" />
				<form:option value="NC" label="North Carolina" />
				<form:option value="ND" label="North Dakota" />
				<form:option value="NE" label="Nebraska" />
				<form:option value="NH" label="New Hampshire" />
				<form:option value="NJ" label="New Jersey" />
				<form:option value="NM" label="New Mexico" />
				<form:option value="NV" label="Nevada" />
				<form:option value="NY" label="New York" />
				<form:option value="OH" label="Ohio" />
				<form:option value="OK" label="Oklahoma" />
				<form:option value="OR" label="Oregon" />
				<form:option value="PA" label="Pennsylvania" />
				<form:option value="PR" label="Puerto Rico" />
				<form:option value="RI" label="Rhode Island" />
				<form:option value="SC" label="South Carolina" />
				<form:option value="SD" label="South Dakota" />
				<form:option value="TN" label="Tennessee" />
				<form:option value="TX" label="Texas" />
				<form:option value="UT" label="Utah" />
				<form:option value="VA" label="Virginia" />
				<form:option value="VT" label="Vermont" />
				<form:option value="WA" label="Washington" />
				<form:option value="WI" label="Wisconsin" />
				<form:option value="WV" label="West Virginia" />
				<form:option value="WY" label="Wyoming" />
			</form:select>
			<form:errors path="location.state" />
			<br />
			<form:label path="location.zipCode">Zip Code</form:label>
			<br>
			<form:input class="form-control" path="location.zipCode" min="0"
				type="text" placeholder="Zip Code" />
			<form:errors path="location.zipCode" />
			<br />
			<form:label path="orgType">Organizaton Type</form:label>
			<br>
			<%-- <form:input class="form-control" path="orgType" type="text" required="required" placeholder="Non-Profit, For-Profit, Private Group" /> --%>
			<form:select class="form-control" path="orgType" required="required">
				<form:option value="" label="select type"/>
				<form:option value="non-profit" label="Non-Profit" />
				<form:option value="for-profit" label="For-Profit" />
				<form:option value="private-group" label="Private Group" />
			</form:select>
			<form:errors path="orgType" />
			<br />
			<form:label path="orgNum">Organizaton Number</form:label>
			<br>
			<form:input class="form-control" path="orgNum" type="text"
				placeholder="Non-Profit 503c, TaxID Number" />
			<form:errors path="orgNum" />
			<br />
			<form:label path="logoURL">Logo URL</form:label>
			<br>
			<form:input class="form-control" path="logoURL" type="website"
				placeholder="Please enter your logo URL" />
			<form:errors path="logoURL" />
			<br />
			<form:label path="website">Website URL</form:label>
			<br>
			<form:input class="form-control" path="website" type="website"
				placeholder="Please enter your website URL" />
			<form:errors path="website" />
			<br />
			<input class="submit" type="submit" value="Submit" />
			<!-- <input type="submit" value="Submit" class="btn btn-primary" /> -->
		</form:form>
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