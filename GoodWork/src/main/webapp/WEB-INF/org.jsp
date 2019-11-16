<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${newOrg}
<h5 class="card-title">Delete Your Organization</h5>
      <p class="card-text">Please enter your organizaiton's goodWork ID number.</p>
      <form action="disableOrg.do" method="POST" >
		<input class="form-control" type="number"  min="1" required="required" name="id" placeholder="Enter ID Number"/> 
 		 <input class="btn btn-dark btn-lg btn-block" type="submit" value="Delete Transaction" />
		</form>

</body>
</html>