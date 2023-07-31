<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.logindao.ConnectDatabase"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		String sql = "Select * from teachers";
		Statement st = connection.createStatement();
		rs = st.executeQuery(sql);

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<div class=container>
		<table border="2px" align="center"
			class="table table-hover table-dark">
			<thead>
				<tr>
					<th scope="col">Teacher ID</th>
					<th scope="col">Teacher Name</th>
					<th scope="col">Subject</th>
				</tr>
			</thead>

			<%
			while (rs.next()) {
			%>
			<tbody>
				<tr>
					<th scope="row"><%=rs.getInt(1)%></th>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>