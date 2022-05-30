package User;

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
	 public static String MD5(String password) {
	        final byte[] defaultBytes = password.getBytes();
	        try {
	            final MessageDigest md5MsgDigest = MessageDigest.getInstance("MD5");
	            md5MsgDigest.reset();
	            md5MsgDigest.update(defaultBytes);
	            final byte messageDigest[] = md5MsgDigest.digest();

	            final StringBuffer hexString = new StringBuffer();
	            for (final byte element : messageDigest) {
	                final String hex = Integer.toHexString(0xFF & element);
	                if (hex.length() == 1) {
	                    hexString.append('0');
	                }
	                hexString.append(hex);
	            }
	            password = hexString + "";
	        } catch (final NoSuchAlgorithmException nsae) {
	            nsae.printStackTrace();
	        }
	        return password;
	 }
	Connection con = GetConnection.getConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("username");
		String password = MD5(request.getParameter("password"));
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
				 session.setAttribute("username", rs.getString("FIRST_NAME"));
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
