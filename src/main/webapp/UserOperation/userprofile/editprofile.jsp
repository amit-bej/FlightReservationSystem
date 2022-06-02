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
	String command = "UPDATE OFRS.USER_DETAILS SET FIRST_NAME = '"+firstname+"',LAST_NAME = '"+lastname+"',AGE = '"+age+"',GENDER = '"+gender+"',ADDRESS = '"+address+"',PHONE_NUMBER = '"+phoneno+"' WHERE USER_ID=14764" ;
    statement.executeUpdate(command);
	out.println("Data is successfully inserted!");
}
catch(Exception e){
    out.print(e);

}
%>