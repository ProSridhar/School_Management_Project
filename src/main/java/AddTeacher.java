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

@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("employeeId"));
			String name = req.getParameter("name"), subject = req.getParameter("subject");
			Connection connection = ConnectDatabase.getConnection();
			PreparedStatement ps = connection.prepareStatement(
					"Insert into teachers (`teacher_id`, `teacher_name`,`teacher_subject`) values (?,'" + name + "','"
							+ subject + "')");
			ps.setInt(1, id);
			PreparedStatement ps1 = connection.prepareStatement("Insert into teacher_login values(?,?)");
			ps1.setInt(1, id);
			ps1.setString(2, "" + name + id);
			int res = ps.executeUpdate(), res1 = ps1.executeUpdate();
			if (res == 0 || res1 == 0) {
				resp.getWriter().write("<div class=container><h3>Something went wrong while adding teacher</h3></div>");
				resp.sendRedirect("AddTeachers.jsp");
			} else {
				RequestDispatcher rd = req.getRequestDispatcher("AddTeachers.jsp");
				resp.getWriter().write("<div class=container><h3>Teacher saved successfully</h3></div>");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
