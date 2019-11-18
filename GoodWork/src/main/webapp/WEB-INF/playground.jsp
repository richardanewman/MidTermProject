<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty newUser}">
	<c:choose>
		<c:when test="${newUser.id == event.host.id}">
			<!--  Stuff for buttons, update and delete -->
		</c:when>
		<c:otherwise>
			<c:forEach var="vol" items="${event.users}">
				<c:choose>
					<c:when test="${vol.user.id == newUser.id}">
						<!-- Stuff saying you already signed up for this event -->
					</c:when>
				</c:choose>
			</c:forEach>
				<!-- Stuff for buttons, the sign up button specifically -->
		</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>