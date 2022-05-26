<%@ page import="java.sql.*"%>
<%

String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String city_name=request.getParameter("city_name");
String email=request.getParameter("email");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
    Statement statement = conn.createStatement();
	String command = "INSERT into users(first_name,last_name,city_name,email)values('"+first_name+"','"+last_name+"','"+city_name+"','"+email+"')";
    statement.executeUpdate(command);
	out.println("Data is successfully inserted!");
}
catch(Exception e){
    out.print(e);

}
 
 
%>
<%=email%>