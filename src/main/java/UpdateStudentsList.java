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

@WebServlet("/updateStudentsList")
public class UpdateStudentsList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("registerNumber")), age = Integer.parseInt(req.getParameter("age"));
		String name = req.getParameter("name"), rank = req.getParameter("rank");
		try {
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement("UPDATE students SET `student_name` = '" + name
					+ "',`student_age` = '" + age + "' WHERE `student_id` = " + id);

			PreparedStatement ps1 = connection.prepareStatement("UPDATE student_login SET `register_number` = " + id
					+ ",`password` = '" + name + id + "' WHERE `register_number` = " + id);
			int result = ps.executeUpdate(), result1 = ps1.executeUpdate();
			if (result == 0 || result1 == 0) {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateStudentsList.jsp");
				resp.getWriter().write("<h1>Something went wrong while updating</h1>");
				rd.include(req, resp);
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateStudentsList.jsp");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
