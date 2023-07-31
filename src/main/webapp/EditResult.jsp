<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.logindao.ConnectDatabase"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Results</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}
</style>
</head>
<body>

	<%
	int registerNumber = Integer.parseInt(request.getParameter("registerNumber"));

	ResultSet rs = null;
	try {
		Connection connection = ConnectDatabase.getConnection();
		String sql = "select * from students where student_id =" + registerNumber;
		PreparedStatement ps = connection.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

	<div class=container>

		<form action="updateResult">
			<div class="form-group">
				<label for="registerNumber">Student Register Number</label> <input
					type="text" class="form-control" id="registerNumber"
					name="registerNumber" value="<%=rs.getInt(1)%>" readonly>
			</div>
			<div class="form-group">
				<label for="name">Student Name</label> <input type="text"
					class="form-control" id="name" name="registerNumber"
					value="<%=rs.getString(2)%>" readonly>
			</div>
			<div class="form-group">
				<label for="age">Student Age</label> <input type="text"
					class="form-control" id="age" name="age"
					value="<%=rs.getInt(3)%>" readonly>
			</div>
			<div class="form-group">
				<label for="rank">Student Rank</label> <input type="text"
					class="form-control" id="rank" name="rank"
					value="<%=rs.getString(4)%>">
			</div>
			<input type="submit" value="Update" class="btn btn-primary">
	</div>
	</form>
	</div>
</body>
</html>