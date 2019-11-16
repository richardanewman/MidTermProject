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
<title>TX</title>
</head>
<body>
<div class="form-group">
<form:form action="updateOrg.do" method="POST" modelAttribute="orgData">
<form:label path="id" default="${orgData.id}" ><h1><strong>Editing ${orgData.orgName} | ID: ${orgData.id} </strong></h1> </form:label><br>
		<form:label path="orgName">Organization Name: </form:label><br>
		<form:input class="form-control" path="orgName" default="${orgData.orgName}" placeholder="${orgData.orgName}"/>
		<form:errors path="orgName" />
		<br />
	    <input class="btn btn-dark btn-lg btn-block" type="submit" value="Submit" />
	</form:form>
	</div>
</body>
</html>