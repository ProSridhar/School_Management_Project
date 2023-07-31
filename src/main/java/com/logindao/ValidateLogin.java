package com.logindao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;

public class ValidateLogin extends HttpServlet {
	final String url="jdbc:mysql://localhost:3306/servlet_005",username="root",password="root";
	
	public boolean checkStudent(int id, String pass){
		pass="'"+pass+"'"; // single quote for varchar datatype in sql
			try {
				Connection connection = ConnectDatabase.getConnection();
				PreparedStatement st = connection.prepareStatement("Select * from student_login where register_number="+id+" and password="+pass);
				ResultSet rs = st.executeQuery();
				return rs.next();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}

	public boolean checkTeacher(int id, String pass){
		pass="'"+pass+"'"; // single quote for varchar datatype in sql
		try {
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement st = connection.prepareStatement("Select * from teacher_login where employee_id="+id+" and password="+pass);
			ResultSet rs = st.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return false;
	}
	public boolean checkPrincipal(String email, String pass){
		pass="'"+pass+"'";email="'"+email+"'"; // single quote for varchar datatype in sql
			try {
				Connection connection = ConnectDatabase.getConnection();
				PreparedStatement st = connection.prepareStatement("Select * from principal_login where email="+email+" and password="+pass);
				ResultSet rs = st.executeQuery();
				return rs.next();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}
	
}
