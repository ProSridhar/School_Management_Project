<%@page import="java.sql.Statement"%>
<%@page import="com.logindao.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit/Dismiss Student</title>
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
	if ((String) session.getAttribute("principalEmail") == null)
		response.sendRedirect("PrincipalLogin.jsp");
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = ConnectDatabase.getConnection();
		String sql = "Select * from students";
		Statement st = connection.createStatement();
		rs = st.executeQuery(sql);

	} catch (Exception e) {

	}
	%>
	<div class="container">
		<table align="center" class="table table-hover table-dark">

			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Age</th>
					<th scope="col">Rank</th>
					<th scope="col">Update</th>
					<th scope="col">Dismiss</th>
				</tr>
			</thead>
			<%
			while (rs.next()) {
			%>
			<tbody>
				<tr>
					<th scope="row"><%=rs.getInt(1)%></th>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getInt(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><button class="btn btn-primary">
							<a href="EditStudentsList.jsp?registerNumber=<%=rs.getInt(1)%>"><span
								style="color: white;">Edit</span></a>
						</button></td>
					<td><button class="btn btn-primary">
							<a href="DismissStudent?registerNumber=<%=rs.getInt(1)%>"><span
								style="color: white;">Dismiss</span></a>
						</button></td>
				</tr>

				<%
				}
				%>
			
		</table>
	</div>
</body>
</html>