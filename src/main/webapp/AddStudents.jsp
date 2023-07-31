<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}
</style>
</head>
<body>

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("principalEmail") == null)
		response.sendRedirect("PrincipalLogin.jsp");
	%>

	<div class=container>

		<form action="AddStudent">
			<div class="form-group">
				<label for="registerNumber">Student Register Number</label> <input
					type="text" class="form-control" id="registerNumber"
					name="registerNumber">
			</div>
			<div class="form-group">
				<label for="name">Student Name</label> <input type="text"
					class="form-control" id="name" name="name">
			</div>
			<div class="form-group">
				<label for="age">Student Age</label> <input type="text"
					class="form-control" id="age" name="age">
			</div>
			<input type="submit" value="Add" class="btn btn-primary">
	</div>
	</form>
	</div>
</body>
</html>