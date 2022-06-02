package User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setHeader("Cache-control","no-cache , no-store, must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expire", 0);
		session.setAttribute("userId", null);
		session.invalidate();
		
		response.sendRedirect("Login.jsp");
	}

}
