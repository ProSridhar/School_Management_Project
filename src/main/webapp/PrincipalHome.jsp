<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Principal</title>
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

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("principalEmail") == null)
		response.sendRedirect("PrincipalLogin.jsp");
	%>

	<div class="container">
		<a href="AddStudents.jsp"><button class="btn btn-primary">
				<span style="color: white;">To Add Student</span>
			</button></a> <a href="UpdateStudentsList.jsp"><button class="btn btn-primary">
				<span style="color: white;">To View/Edit/Dismiss Student</span>
			</button></a>  <a href="AddTeachers.jsp"><button class="btn btn-primary">
				<span style="color: white;">To Add Teachers</span>
			</button></a> <a href="UpdateTeachersList.jsp"><button class="btn btn-primary">
				<span style="color: white;">To View/Dismiss Teacher</span>
			</button></a> <a href="logoutPrincipal"><button class="btn btn-primary">
				<span style="color: white;">Logout</span>
			</button></a>
	</div>


</body>
</html>