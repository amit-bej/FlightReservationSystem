<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String flightID = request.getParameter("flightID");
String userID = String.valueOf(session.getAttribute("userid"));
String datejourney = request.getParameter("date");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "DELETE RESERVE_FLIGHT_DETAILS WHERE FLIGHT_ID='"+flightID+"' AND USER_ID='"+userID+"' AND DATE_OF_JOURNEY='"+datejourney+"'";
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Ticket is successfully cancelled!</h1></center>");
}
catch(Exception e){
    out.print(e);

}
 
 
%>