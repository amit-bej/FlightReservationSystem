package User;
import Encryption.Encryption;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
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
	
	//Encryption
	Connection con = GetConnection.getConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Fetch data from registration page
		String First_Name = request.getParameter("FirstName");
		String Last_Name = request.getParameter("LastName");
		//String DOB = request.getParameter("DOB");
		String Age = request.getParameter("Age");
		String Gender = request.getParameter("Gender");
		String Address = request.getParameter("Address");
		String PhoneNo = request.getParameter("PhoneNo");
		String Password = Encryption.MD5(request.getParameter("Password"));
		String u = "U";
		//Creating random user id for user
	    Random rnd = new Random();
	    int number = rnd.nextInt(99999);
		
	    
		RequestDispatcher dispatcher = null;
		
		try
		{
			
			 String query = "insert into OFRS.USER_DETAILS (USER_ID,PASSWORD,FIRST_NAME,LAST_NAME,AGE,GENDER,ADDRESS,PHONE_NUMBER) values(?,?,?,?,?,?,?,?)";
			 String command = "insert into OFRS.LOGIN_CREDENTIALS (USER_TYPE,USER_ID,PASSWORD) VALUES ('"+u+"','"+number+"','"+Password+"')";
			 Statement statement = con.createStatement();
			 statement.executeUpdate(command);
	           PreparedStatement pt = con.prepareStatement(query);
	           pt.setInt(1, number);
	           pt.setString(2,Password );
	           pt.setString(3, First_Name);
	           pt.setString(4, Last_Name);
	           pt.setString(5, Age);
	           pt.setString(6, Gender);
	           pt.setString(7,Address);
	           pt.setString(8,PhoneNo);
	           
	           int i = pt.executeUpdate();
	           dispatcher = request.getRequestDispatcher("Registration.jsp");
	           if(i>0)
	           {
	        	   //response.sendRedirect("Login.jsp");
	        	   request.setAttribute("status", "success");
	        	   request.setAttribute("userid", number);
	           }
	           else {
				   //String errorMessage = "User Available";
				   	//HttpSession regSession = request.getSession();
				    //regSession.setAttribute("RegistrationError", errorMessage);
				    //response.sendRedirect("Registration.jsp");
	        	   request.setAttribute("status", "failed");
				    }
	        	   dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		
	


}
