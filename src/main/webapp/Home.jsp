<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}

div {
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<body>
	<div class="container">
		<a href="PrincipalLogin.jsp"><button class="btn btn-primary">
				<span style="color: white;">Principal Login</span>
			</button></a> <a href="StudentLogin.jsp"><button class="btn btn-primary">
				<span style="color: white;">Student Login</span>
			</button></a> <a href="TeacherLogin.jsp">
			<button class="btn btn-primary">
				<span style="color: white;">Teacher Login</span>
			</button>
		</a>
	</div>
</body>
</html>