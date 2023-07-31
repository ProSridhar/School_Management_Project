import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.logindao.ValidateLogin;

@WebServlet("/ValidatePrincipal")
public class ValidatePrincipal extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("principalEmail");
		String password = req.getParameter("pwd");
		if (new ValidateLogin().checkPrincipal(email, password)) {
			HttpSession hs = req.getSession();
			hs.setAttribute("principalEmail", email);
			hs.setAttribute("password", password);
			RequestDispatcher rd = req.getRequestDispatcher("PrincipalHome.jsp");
			rd.include(req, resp);
		} else {
			RequestDispatcher rd = req.getRequestDispatcher("PrincipalLogin.jsp");
			resp.getWriter().write("<div class=container><h2> Wrong credentials Try again</h2></div>");
			rd.include(req, resp);
		}
	}
}
