<%@ page import="java.sql.*"%>
<%

String flightID = request.getParameter("flightID");
String flightname = request.getParameter("flightname");
String source = request.getParameter("source");
String destination = request.getParameter("destination");
String travelduration = request.getParameter("travelduration");
String seatingcapacity = request.getParameter("seatingcapacity");
String reservationtype = request.getParameter("reservationtype");
String reservationcapacity = request.getParameter("reservationcapacity");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
    Statement statement = conn.createStatement();
	String command = "UPDATE FLIGHT_DETAILS SET FLIGHT_NAME='"+flightname+"', SOURCE='"+source+"', DESTINATION='"+destination+"', ESTIMATED_TRAVEL_DURATION='"+travelduration+"', SEATING_CAPACITY='"+seatingcapacity+"', RESERVATION_TYPE='"+reservationtype+"', RESERVATION_CAPACITY='"+reservationcapacity+"' WHERE FLIGHT_ID='"+flightID+"'";
    statement.executeUpdate(command);
	out.println("Data is successfully updated!");
}
catch(Exception e){
    out.print(e);

}
 
 
%>