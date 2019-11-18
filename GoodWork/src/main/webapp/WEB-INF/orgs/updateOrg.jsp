<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Update Organization</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
<div class="form-group">
<form:form action="updateOrg.do" method="POST" modelAttribute="orgData">
<form:label path="id" default="${orgData.id}" ><h1><strong>Editing ${orgData.orgName} | ID: ${orgData.id} </strong></h1> </form:label><br>
		<form:label path="orgName">Organization Name: </form:label><br>
		<form:input class="form-control" path="orgName" value="${orgData.orgName}" placeholder="${orgData.orgName}"/>
		<form:errors path="orgName" />
		<br />
		<form:label path="orgDescription">Organization Description: </form:label><br>
		<form:input class="form-control" path="orgDescription" value="${orgData.orgDescription}" placeholder="${orgData.orgDescription}"/>
		<form:errors path="orgDescription" />
		<br />
		<form:label path="location.address">Street Address: </form:label><br>
		<form:input class="form-control" path="location.address" value="${orgData.location.address}" placeholder="${orgData.location.address}"/>
		<form:errors path="location.address" />
		<br />
		<form:label path="location.address2">Address line 2: </form:label><br>
		<form:input class="form-control" path="location.address2" value="${orgData.location.address2}" placeholder="${orgData.location.address2}"/>
		<form:errors path="location.address2" />
		<br />
		<form:label path="location.city">City: </form:label><br>
		<form:input class="form-control" path="location.city" value="${orgData.location.city}" placeholder="${orgData.location.city}"/>
		<form:errors path="location.city" />
		<br />
		<form:label path="location.state">State: </form:label><br>
		<form:input class="form-control" path="location.state" value="${orgData.location.state}" placeholder="${orgData.location.state}"/>
		<form:errors path="location.state" />
		<br />
		<form:label path="location.zipCode">Zip Code: </form:label><br>
		<form:input class="form-control" path="location.zipCode" default="${orgData.location.zipCode}" placeholder="${orgData.location.zipCode}"/>
		<form:errors path="location.zipCode" />
		<br />
		<form:label path="orgType">Organization Type: </form:label><br>
		<form:input class="form-control" path="orgType" value="${orgData.orgType}" placeholder="${orgData.orgType}"/>
		<form:errors path="orgType" />
		<br />
		<form:label path="orgNum">Organization Number: </form:label><br>
		<form:input class="form-control" path="orgNum" value="${orgData.orgNum}" placeholder="${orgData.orgNum}"/>
		<form:errors path="orgNum" />
		<br />
		<form:label path="logoURL">Organization's Logo URL: </form:label><br>
		<form:input class="form-control" path="logoURL" value="${orgData.logoURL}" placeholder="${orgData.logoURL}"/>
		<form:errors path="logoURL" />
		<br />
		<form:label path="website">Organization's Website URL: </form:label><br>
		<form:input class="form-control" path="website" value="${orgData.website}" placeholder="${orgData.website}"/>
		<form:errors path="website" />
		<br />
	    <input class="btn btn-dark btn-lg btn-block" type="submit" value="Submit" />
	</form:form>
	</div>
</body>
</html>