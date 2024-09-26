package btltweb.iostar.Controllers.admin;

import java.io.IOException;

import btltweb.iostar.Models.UserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/admin/home" })
public class AdminHomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserModel u = (UserModel) session.getAttribute("account");
			req.setAttribute("username", u.getUserName());
			req.setAttribute("password", u.getPassWord());
			req.setAttribute("email", u.getEmail());
			req.setAttribute("fullname", u.getFullName());
			req.setAttribute("phone", u.getPhone());
		}

		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}
}
