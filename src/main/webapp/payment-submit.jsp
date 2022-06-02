<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%
String cardnumber = request.getParameter("cardnumber");
String price = request.getParameter("price");
String date = request.getParameter("date");


try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
    String command = "INSERT INTO PAYMENT_ONLINE_DETAILS (CREDIT_CARD_NUMBER,CREDIT_CARD_VALIDITY,TICKET_CHARGES) VALUES ('"+cardnumber+"', '"+date+"','"+price+"')";
	
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Payment received successfully!</h1></center>");
	%>
	<script type="text/javascript">
	
	window.location.href = "http://localhost:2000/FlightReservationSystem/UserOperation/myflight.jsp";
	</script>
	<%
	
}
catch(Exception e){
    out.print(e);

}
 
 
%>