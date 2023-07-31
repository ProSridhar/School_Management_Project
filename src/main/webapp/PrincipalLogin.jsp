<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Principal Login</title>
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
		<h3>Greetings Principal Enter your email and password to manage
			students and teachers</h3>
		<br> <br>
		<form action="ValidatePrincipal">
			<div class="form-group">
				<label for="principalEmail">Enter Email</label> <input type="text"
					class="form-control" id="principalEmail" name="principalEmail"
					placeholder="Enter Email">
			</div>
			<div class="form-group">
				<label for="principalPasword">Password</label> <input
					type="password" class="form-control" id="principalPasword"
					name="pwd" placeholder="Enter Password">
			</div>
			<div>
				<input type="submit" value="Login" class="btn btn-primary">
			</div>
		</form>
	</div>
</body>
</html>
</body>
</html>