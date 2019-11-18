<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello, ${newOrg.orgName}</title>
<%@include file="/WEB-INF/nav.jsp"%>
</head>
<body>
${newOrg}
${successful}
${successfulUpdate}
<h5 class="card-title">Delete Your Organization</h5>
      <p class="card-text">Please enter your organizaiton's goodWork ID number.</p>
      <form action="disableOrg.do" method="POST" >
		<input class="form-control" type="number"  min="1" required="required" name="id" placeholder="Enter ID Number"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Delete Transaction" />
		</form>
<h5 class="card-title">Update Your Organization</h5>
      <form action="updateOrgForm.do" method="GET" >
		<input class="form-control" type="number"  min="1" required="required" name="id" placeholder="Enter ID Number"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Update Organization" />
		</form>

</body>
</html>