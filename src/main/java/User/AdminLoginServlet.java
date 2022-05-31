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


import Connection.GetConnection;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = GetConnection.getConnection();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("username");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		try
		{
			 PreparedStatement pt = con.prepareStatement("select * from OFRS.LOGIN_CREDENTIALS where USER_ID= ? and PASSWORD = ?");
			 pt.setString(1,userID);
			 pt.setString(2,password);
			 
			 ResultSet rs = pt.executeQuery();
			 if(rs.next())
			 {
				 
				 dispatcher = request.getRequestDispatcher("admin/flightdetails/index.jsp");
			 }
			 else
			 {
				 request.setAttribute("status", "failed");
				 dispatcher = request.getRequestDispatcher("Adminlogin.jsp");
			 }
			 dispatcher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}

}
