<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%
String userID = request.getParameter("userID");
String flightID = request.getParameter("flightID");
String journeydate = request.getParameter("date");
String seats = request.getParameter("seats");
String reservationtype = request.getParameter("reservationtype");


try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
    String command = "INSERT INTO RESERVE_FLIGHT_DETAILS(USER_ID, FLIGHT_ID, DATE_OF_JOURNEY, NO_OF_SEATS, RESERVATION_TYPE)values('"+userID+"', '"+flightID+"','"+journeydate+"','"+seats+"','"+reservationtype+"')";
	
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Your seat is successfully reserved!</h1></center>");
	%>
	<script type="text/javascript">
	
	window.location.href = "http://localhost:2000/FlightReservationSystem/payment.jsp?flightID=<%=flightID%>"+"&dateofjourney="+"<%=journeydate%>";
	</script>
	<%
}
catch(Exception e){
    out.print(e);

}
 
 
%>