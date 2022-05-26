<%@ page import="java.sql.*"%>
<%

String flightID = request.getParameter("flightID");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
    Statement statement = conn.createStatement();
	String command = "DELETE FLIGHT_SCHEDULE_DETAILS WHERE FLIGHT_ID='"+flightID+"'";
    statement.executeUpdate(command);
	out.println("Data is successfully deleted!");
}
catch(Exception e){
    out.print(e);

}
 
 
%>