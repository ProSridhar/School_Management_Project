<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Login</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}
</style>
</head>
<body>

	<br>
	<div class=container>
		<h3>Hi Respected Teacher Enter your employee id and password to
			manage students</h3>
		<br>
		<br>
		<form action="ValidateTeacher">
			<div class="form-group">
				<label for="employeeId">Enter Employee ID</label> <input type="text"
					class="form-control" id="employeeId" name="employeeId"
					placeholder="Enter Employee ID">
			</div>
			<div class="form-group">
				<label for="teacherPasword">Password</label> <input type="password"
					class="form-control" id="teacherPasword" name="pwd"
					placeholder="Enter Password">
			</div>
			<div>
				<input type="submit" value="Login" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>