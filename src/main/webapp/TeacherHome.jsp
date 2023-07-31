<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Home</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
	body{
		margin-top:5rem;
	}
	div{
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
	if((Integer)session.getAttribute("employeeId")==null)
		response.sendRedirect("TeacherLogin.jsp");
	%>

	<div class="container">
		<a href="ViewStudents.jsp"><button class="btn btn-primary"><span style="color:white;">To View Student Ranks</span></button></a>
		<a href="UpdateStudents.jsp"><button class="btn btn-primary"><span style="color:white;">To Update Student Ranks</span></button></a>
		<a href="logout"><button class="btn btn-primary"><span style="color:white;">Logout</span></button></a>
	</div>
	
	
</body>
</html>