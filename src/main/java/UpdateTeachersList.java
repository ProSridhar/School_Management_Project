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

@WebServlet("/updateTeachersList")
public class UpdateTeachersList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("employeeId"));
		String name = req.getParameter("name"), subject = req.getParameter("subject");
		try {
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement("UPDATE teachers SET `teacher_name` = '" + name
					+ "',`teacher_subject` = '" + subject + "' WHERE `teacher_id` = " + id);

			PreparedStatement ps1 = connection.prepareStatement("UPDATE teacher_login SET `employee_id` = " + id
					+ ",`password` = '" + name + id + "' WHERE `employee_id` = " + id);
			int result = ps.executeUpdate(), result1 = ps1.executeUpdate();

			if (result == 0 || result1 == 0) {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateTeachersList.jsp");
				resp.getWriter().write("<h1>Something went wrong while updating</h1>");
				rd.include(req, resp);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateTeachersList.jsp");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
