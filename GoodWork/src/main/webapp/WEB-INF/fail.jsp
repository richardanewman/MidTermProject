<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Looks like trouble!</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
<!-- <div class="displayResults"> -->
<div class="container jumbotron" align="center">
<h1><strong>Oops!</strong></h1>
${oops}
<a href="login.do" >Login</a>
</div>
</body>
</html>