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


@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	Connection con ;

    public LoginServlet(Connection con) {
        this.con = con;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("username");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		try
		{
			 PreparedStatement pt = con.prepareStatement("select * from UserDetails where UserId = ? and Password = ?");
			 pt.setString(1,userID);
			 pt.setString(2,password);
			 
			 ResultSet rs = pt.executeQuery();
			 if(rs.next())
			 {
				 dispatcher = request.getRequestDispatcher("Bookflight.jsp");
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
