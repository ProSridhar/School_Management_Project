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

@WebServlet("/DismissStudent")
public class DismissStudent extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("registerNumber"));
		try {
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement("Delete from students WHERE `student_id` = " + id);
			int result = ps.executeUpdate();
			if (result == 0) {
				RequestDispatcher rd = req.getRequestDispatcher("UpdateStudentsList.jsp");
				resp.getWriter().write("<h1>Something went wrong while dismissing</h1>");
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
