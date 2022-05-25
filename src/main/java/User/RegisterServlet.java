package User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.GetConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public RegisterServlet() 
	{
        super();
    }
	
	Connection con = GetConnection.getConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Fetch data from registration page
		String First_Name = request.getParameter("First Name");
		String Last_Name = request.getParameter("Last Name");
		//String DOB = request.getParameter("DOB");
		int Age = Integer.parseInt(request.getParameter("Age"));
		String Gender = request.getParameter("Gender");
		String Address = request.getParameter("Address");
		Long PhoneNo = Long.parseLong(request.getParameter("PhoneNo"));
		String Password = request.getParameter("Password");
		
		
		//Creating random user id for user
	    Random rnd = new Random();
	    int number = rnd.nextInt(99999);
		
		//RequestDispatcher dispatcher = null;
		
		try
		{
			
			 String query = "insert into OFRS.USER_DETAILS (USER_ID,PASSWORD,FIRST_NAME,LAST_NAME,AGE,GENDER,ADDRESS,PHONE_NUMBER) values(?,?,?,?,?,?,?,?)";
	           PreparedStatement pt = con.prepareStatement(query);
	           pt.setInt(1, number);
	           pt.setString(2,Password );
	           pt.setString(3, First_Name);
	           pt.setString(4, Last_Name);
	           pt.setInt(5, Age);
	           pt.setString(6, Gender);
	           pt.setString(7,Address);
	           pt.setLong(8,PhoneNo);
	           
	           int i = pt.executeUpdate();
	           
	           if(i!=0)
	           {
	        	   response.sendRedirect("Login.jsp");
	           }
	           else {
				    String errorMessage = "User Available";
				    HttpSession regSession = request.getSession();
				    regSession.setAttribute("RegistrationError", errorMessage);
				    response.sendRedirect("Registration.jsp");
				    }
	        	   
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		
	


}
