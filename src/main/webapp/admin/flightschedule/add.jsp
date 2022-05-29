<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String flightID = request.getParameter("flightID");
String flightname = request.getParameter("flightname");
String days[] = request.getParameterValues("days");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
    for (int i = 0; i < days.length; i++) {
	String command = "INSERT into FLIGHT_SCHEDULE_DETAILS(FLIGHT_ID, FLIGHT_NAME, AVAILABLE_DAYS)values('"+flightID+"','"+flightname+"','"+days[i]+"')";
    statement.executeUpdate(command);
    }
	out.println("Data is successfully inserted!");
}
catch(Exception e){
    out.print(e);

}

	

%>
