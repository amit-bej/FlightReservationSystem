<%@ page import="java.sql.*"%>
<%

String flightID = request.getParameter("flightID");
String flightname = request.getParameter("flightname");
String days[] = request.getParameterValues("days");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
    Statement statement = conn.createStatement();
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
