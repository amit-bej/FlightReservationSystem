package User;

import java.io.IOException;
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
		
		//Setting data to UserDetails.java
		UserDetails user = new UserDetails(First_Name,Last_Name,Age,Gender,Address,PhoneNo,Password);
		//user.setFirst_Name(First_Name);
		//user.setLastName(Last_Name);
		//user.setAge(Age);
		//user.setGender(Gender);
		//user.setAddress(Address);
		//user.setPhoneNo(PhoneNo);
		//user.setPassword(Password);
		
		//create a database model and calling saveUser
		UserDetailsDatabase regUser = new UserDetailsDatabase(GetConnection.getConnection());
		if (regUser.saveUser(user)) {
			   response.sendRedirect("Login.jsp");
			} else {
			    String errorMessage = "User Available";
			    HttpSession regSession = request.getSession();
			    regSession.setAttribute("RegistrationError", errorMessage);
			    response.sendRedirect("register.jsp");
			    }
	}


}
