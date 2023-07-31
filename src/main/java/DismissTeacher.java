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

@WebServlet("/DismissTeacher")
public class DismissTeacher extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("employeeId"));
		try {
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement("Delete from teachers WHERE `teacher_id` = " + id);
			int result = ps.executeUpdate();
			if (result == 0) {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateTeachersList.jsp");
				resp.getWriter().write("<h1>Something went wrong while Dismissing</h1>");
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
