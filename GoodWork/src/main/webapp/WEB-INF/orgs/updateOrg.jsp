<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Update Organization</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
	<br>

	<h2 align="center">Update ${orgData.orgName}</h2>
	<br>
	<div class="container form-goup jumbotron">
		<form:form action="updateOrg.do" method="POST"
			modelAttribute="orgData">
			<form:label path="id" default="${orgData.id}">
				<h3>Editing Org ID ${orgData.id}</h3>
			</form:label>
			<br>
			<form:label path="orgName">Organization Name: </form:label>
			<br>
			<form:input class="form-control" path="orgName"
				value="${orgData.orgName}" placeholder="${orgData.orgName}" />
			<form:errors path="orgName" />
			<br />
			<form:label path="orgDescription">Organization Description: </form:label>
			<br>
			<form:input class="form-control" path="orgDescription"
				value="${orgData.orgDescription}"
				placeholder="${orgData.orgDescription}" />
			<form:errors path="orgDescription" />
			<br />
			<form:label path="location.address">Street Address: </form:label>
			<br>
			<form:input class="form-control" path="location.address"
				value="${orgData.location.address}"
				placeholder="${orgData.location.address}" />
			<form:errors path="location.address" />
			<br />
			<form:label path="location.address2">Address line 2: </form:label>
			<br>
			<form:input class="form-control" path="location.address2"
				value="${orgData.location.address2}"
				placeholder="${orgData.location.address2}" />
			<form:errors path="location.address2" />
			<br />
			<form:label path="location.city">City: </form:label>
			<br>
			<form:input class="form-control" path="location.city"
				value="${orgData.location.city}"
				placeholder="${orgData.location.city}" />
			<form:errors path="location.city" />
			<br />
			<form:label path="location.state">State: </form:label>
			<%-- <br>
			<form:input class="form-control" path="location.state"
				value="${orgData.location.state}"
				placeholder="${orgData.location.state}" />
				<form :label path="location.state">State</form:label> --%>
			<br>
			<form:select class="form-control" path="location.state"
				required="required">
				<form:option value="${orgData.location.state}"
					label="${orgData.location.state}" />
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
			<form:label path="location.zipCode">Zip Code: </form:label>
			<br>
			<form:input class="form-control"
				pattern="^\s*?\d{5}(?:[-\s]\d{4})?\s*?$"
				title="Zip Code format 12345 or 12345-1234" path="location.zipCode"
				value="${orgData.location.zipCode}"
				placeholder="${orgData.location.zipCode}" />
			<form:errors path="location.zipCode" />
			<br />
			<form:label path="orgType">Organization Type: </form:label>
			<br>
			<%-- <form:input class="form-control" path="orgType"
				value="${orgData.orgType}" placeholder="${orgData.orgType}" /> --%>
			<form:select class="form-control" path="orgType" required="required">
				<form:option value="${orgData.orgType}" label="${orgData.orgType}" />
				<form:option value="non-profit" label="Non-Profit" />
				<form:option value="for-profit" label="For-Profit" />
				<form:option value="private-group" label="Private Group" />
			</form:select>
			<form:errors path="orgType" />
			<br />
			<form:label path="orgNum">Organization Number: </form:label>
			<br>
			<form:input class="form-control" path="orgNum"
				value="${orgData.orgNum}" placeholder="${orgData.orgNum}" />
			<form:errors path="orgNum" />
			<br />
			<form:label path="logoURL">Organization's Logo URL: </form:label>
			<br>
			<form:input class="form-control" path="logoURL"
				value="${orgData.logoURL}" placeholder="${orgData.logoURL}" />
			<form:errors path="logoURL" />
			<br />
			<form:label path="website">Organization's Website URL: </form:label>
			<br>
			<form:input class="form-control" path="website"
				value="${orgData.website}" placeholder="${orgData.website}" />
			<form:errors path="website" />
			<br />
			<input class="btn btn-dark btn-lg btn-block" type="submit"
				value="Submit" />
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