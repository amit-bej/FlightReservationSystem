package User;

import java.io.IOException;
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		try
		{
			 PreparedStatement pt = con.prepareStatement("select * from OFRS.USER_DETAILS where USER_ID= ? and PASSWORD = ?");
			 pt.setString(1,userID);
			 pt.setString(2,password);
			 
			 ResultSet rs = pt.executeQuery();
			 if(rs.next())
			 {
				 session.setAttribute("username", rs.getString("First_Name"));
				 dispatcher = request.getRequestDispatcher("/Bookflight.jsp");
			 }
			 else
			 {
				 request.setAttribute("status", "failed");
				 dispatcher = request.getRequestDispatcher("Login.jsp");
			 }
			 dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}

}
