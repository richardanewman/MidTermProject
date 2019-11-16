<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
<div class="displayResults">
<c:if test="${! empty displayAll}">
<h1>All Organizations:</h1>
<c:forEach items="${displayAll}" var="org">
${org.orgName}<br><br>
${org.location.address}<br><br>
${org.location.city}<br><br>
${org.location.state}<br><br>
${org.orgType}<br><br>
${org.orgNum}<br><br>
${org.logoURL}<br><br>
${org.website}<br><br>
</c:forEach>
</c:if>


<c:if test="${! empty org}">
<h1>Found it!</h1>
${org.orgName}<br><br>
${org.location.address}<br><br>
${org.location.city}<br><br>
${org.location.state}<br><br>
${org.orgType}<br><br>
${org.orgNum}<br><br>
${org.logoURL}<br><br>
${org.website}<br><br>
</c:if>
</body>
</html>