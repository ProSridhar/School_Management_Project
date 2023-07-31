<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	color: white;
	margin-top: 5rem;
}
</style>
</head>
<body>

	<div class=container>
		<h3>Greetings Dear Student Enter your register number and
			password to view results</h3>
		<br>
		<br>
		<form action="ValidateStudent">
			<div class="form-group">
				<label for="studentRegisterNumber">Enter Register Number</label> <input
					type="text" class="form-control" id="studentRegisterNumber"
					name="registerNumber" placeholder="Enter Register Number">
			</div>
			<div class="form-group">
				<label for="studentPasword">Enter Password</label> <input
					type="password" class="form-control" id="studentPasword" name="pwd"
					placeholder="Enter Password">
			</div>
			<div>
				<input type="submit" value="Login" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>