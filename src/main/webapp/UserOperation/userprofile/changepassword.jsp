<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%@ page import="Encryption.Encryption" %>
<%

String password = Encryption.MD5(request.getParameter("password"));
String confirmpassword  = request.getParameter("confirmpassword");
RequestDispatcher dispatcher = null;
try{
	
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "UPDATE OFRS.USER_DETAILS SET PASSWORD = '"+password+"'WHERE USER_ID = 14764";
   
	out.println("Pasword Changed Successfully!");
	 int i = statement.executeUpdate(command);
	 //if(i>0)
	 //{
	//	 request.setAttribute("status", "success");
	//	 response.sendRedirect("userprofile.jsp");
	 //}
	// else
	// {
	//	 request.setAttribute("status", "failed");
	//	 response.sendRedirect("userprofile.jsp");
	 //}
	 //dispatcher.forward(request,response);
}
catch(Exception e){
    out.print(e);

}
%>