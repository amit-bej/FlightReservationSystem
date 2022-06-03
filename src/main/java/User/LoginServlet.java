package User;
import Encryption.Encryption;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.GetConnection;


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	Connection con = GetConnection.getConnection();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("username");
		String password = Encryption.MD5(request.getParameter("password"));
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try
		{
			 PreparedStatement pt = con.prepareStatement("select * from OFRS.LOGIN_CREDENTIALS where USER_ID= ? and PASSWORD = ?");
			 pt.setString(1,userID);
			 pt.setString(2,password);
			 ResultSet rs = pt.executeQuery();
			 if(rs.next())
			 {
				 session.setAttribute("userid", rs.getString("USER_ID"));
				 if("U".equals(rs.getString("USER_TYPE"))) {
				     //response.sendRedirect("http://localhost:8081/FlightReservationSystem/index.jsp");
				     dispatcher = request.getRequestDispatcher("index.jsp");}
				 else if("A".equals(rs.getString("USER_TYPE"))) {
					 //response.sendRedirect("http://localhost:8081/FlightReservationSystem/admin/index.jsp");
					 dispatcher = request.getRequestDispatcher("admin/index.jsp");}
			 }
			 else
			 {
				 request.setAttribute("status", "failed");
				 dispatcher = request.getRequestDispatcher("Login.jsp");
				 //response.sendRedirect("http://localhost:8081/FlightReservationSystem/Login.jsp");
			 }
			 dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}

}
