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
<div class="newTxForm">
<h1>Create A New Organization</h1>
<form:form action="addNewOrg.do" method="POST" modelAttribute="newOrg">
		<form:label path="orgName">Organization Name:</form:label><br>
		<form:input class="input" path="orgName" required="required" type="text" placeholder="Organization's Name"/>
		<form:errors path="orgName" />
		<br />
		<form:label path="orgDescription">Organization Description:</form:label><br>
		<form:input class="input" path="orgDescription" required="required" type="textarea" placeholder="Organization's Description"/>
		<form:errors path="orgDescription" />
		<br />
		<form:label path="location.address" >Address:</form:label><br>
		<form:input class="input" path="location.address" required="required" type="text" placeholder="Street Address"/>
		<form:errors path="location.address" />
		<br />
		<form:label path="location.address2" >Address 2:</form:label><br>
		<form:input class="input" path="location.address2" required="required" type="text" placeholder="Suite Number"/>
		<form:errors path="location.address2" />
		<br />
		<form:label path="location.city" >City:</form:label><br>
		<form:input class="input" path="location.city" required="required" type="text" placeholder="City"/>
		<form:errors path="location.city" />
		<br />
		<form:label path="location.state" >State:</form:label><br>
		<form:input class="input" path="location.state" required="required" type="text" placeholder="State"/>
		<form:errors path="location.state" />
		<br />
		<form:label path="location.zipCode" >Zip Code:</form:label><br>
		<form:input class="input" path="location.zipCode" required="required" min="0" type="number" placeholder="Zip Code"/>
		<form:errors path="location.zipCode" />
		<br />
		<form:label path="orgType">Organizaton Type:</form:label><br>
		<form:input class="input" path="orgType" type="text" required="required" placeholder="Non-Profit, LLC, Private Group" />
		<form:errors path="orgType" />
		<br />
		<form:label path="orgNum">Organizaton Number:</form:label><br>
		<form:input class="input" path="orgNum" type="text" required="required" placeholder="Non-Profit 503c, TaxID Number" />
		<form:errors path="orgNum" />
		<br />
		<form:label path="logoURL">Logo URL:</form:label><br>
		<form:input class="input" path="logoURL" type="text" required="required" placeholder="Please enter your logo URL" />
		<form:errors path="logoURL" />
		<br />
		<form:label path="website">Website URL:</form:label><br>
		<form:input class="input" path="website" type="text" required="required" placeholder="Please enter your website URL" />
		<form:errors path="website" />
		<br />
	    <input class="submit" type="submit" value="Submit" />
	</form:form>
	</div>
</body>
</html>