<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.logindao.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Teacher</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}
</style>
</head>
<body>

	<%
	int employeeId = Integer.parseInt(request.getParameter("employeeId"));

	ResultSet rs = null;
	try {
		Connection connection = ConnectDatabase.getConnection();
		String sql = "select * from teachers where teacher_id =" + employeeId;
		PreparedStatement ps = connection.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<div class=container>

		<form action="updateTeachersList">
			<div class="form-group">
				<label for="employeeId">Teacher Employee ID</label> <input
					type="text" class="form-control" id="employeeId" name="employeeId"
					value="<%=rs.getInt(1)%>" readonly>
			</div>
			<div class="form-group">
				<label for="name">Teacher Name</label> <input type="text"
					class="form-control" id="name" name="name"
					value="<%=rs.getString(2)%>">
			</div>
			<div class="form-group">
				<label for="subject">Student Rank</label> <input type="text"
					class="form-control" id="subject" name="subject"
					value="<%=rs.getString(3)%>">
			</div>
			<input type="submit" value="Update" class="btn btn-primary">
	</div>
	</form>
	</div>
</body>
</html>