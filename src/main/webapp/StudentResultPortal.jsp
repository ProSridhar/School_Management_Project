<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.logindao.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Congratulations</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	margin-top: 5rem;
}
</style>
</head>
<body style="background-color: rgb(90, 173, 245);">
	<% 
	int id = Integer.parseInt(request.getParameter("registerNumber"));
ResultSet rs=null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = ConnectDatabase.getConnection();
	String sql="Select * from students where student_id="+id;
	Statement st = connection.createStatement();
	rs=st.executeQuery(sql);
}catch(Exception e){
	e.printStackTrace();
}
%>

	<div class=container>
		<table align="center" class="table table-hover table-dark">
			<thead>
				<tr>
					<th scope="col">Roll No</th>
					<th scope="col">Name</th>
					<th scope="col">Age</th>
					<th scope="col">Overall Rank</th>
				</tr>
			</thead>
			<% while(rs.next()) { %>
			<tbody>
				<tr>
					<th scope="row"><%= rs.getInt(1) %></th>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getInt(3) %></td>
					<td><%= rs.getString(4) %></td>
				</tr>
			</tbody>
			<%} %>

		</table>
	</div>
	<a href="logoutStudent"><button class="btn btn-primary">
			<span style="color: white;">Logout</span>
		</button></a>
</body>
</html>