<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String phoneno = request.getParameter("phoneno");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
    String sess = String.valueOf(session.getAttribute("userid"));
	String command = "UPDATE USER_DETAILS SET FIRST_NAME = '"+firstname+"',LAST_NAME = '"+lastname+"',AGE = '"+age+"',GENDER = '"+gender+"',ADDRESS = '"+address+"',PHONE_NUMBER = '"+phoneno+"' WHERE USER_ID='"+sess+"'" ;
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Profile is successfully updated!</h1></center>");
}
catch(Exception e){
    out.print(e);

}
%>