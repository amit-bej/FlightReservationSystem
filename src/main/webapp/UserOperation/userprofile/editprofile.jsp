<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
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
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "INSERT into FLIGHT_DETAILS(FLIGHT_ID, FLIGHT_NAME, SOURCE, DESTINATION, ESTIMATED_TRAVEL_DURATION, SEATING_CAPACITY, RESERVATION_TYPE, RESERVATION_CAPACITY)values('"+flightID+"','"+flightname+"','"+source+"','"+destination+"','"+travelduration+"','"+seatingcapacity+"','"+reservationtype+"','"+reservationcapacity+"')";
    statement.executeUpdate(command);
	out.println("Data is successfully inserted!");
}
catch(Exception e){
    out.print(e);

}