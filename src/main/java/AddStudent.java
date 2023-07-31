import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.logindao.ConnectDatabase;

@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("registerNumber"));
			String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement(
					"Insert into students (`student_id`, `student_name`,`student_age`) values (?,'" + name + "',?)");
			ps.setInt(1, id);
			ps.setInt(2, age);
			PreparedStatement ps1 = connection.prepareStatement("Insert into student_login values(?,?)");
			ps1.setInt(1, id);
			ps1.setString(2, "" + name + id);
			int res = ps.executeUpdate(), res1 = ps1.executeUpdate();
			if (res == 0 || res1 == 0) {
				resp.getWriter().write("<div class=container><h3>Something went wrong while adding student</h3></div>");
				resp.sendRedirect("AddStudents.jsp");
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AddStudents.jsp");
				resp.getWriter().write("<div class=container><h3>Student saved successfully</h3></div>");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
