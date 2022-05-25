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
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1234");
    Statement statement = conn.createStatement();
	String command = "INSERT into OFRS.FLIGHT_DETAILS(FLIGHT_ID, FLIGHT_NAME, SOURCE, DESTINATION, ESTIMATED_TRAVEL_DURATION, SEATING_CAPACITY, RESERVATION_TYPE, RESERVATION_CAPACITY)values('"+flightID+"','"+flightname+"','"+source+"','"+destination+"','"+travelduration+"','"+seatingcapacity+"','"+reservationtype+"','"+reservationcapacity+"')";
    statement.executeUpdate(command);
	out.println("Data is successfully inserted!");
}
catch(Exception e){
    out.print(e);

}
 
 
%>