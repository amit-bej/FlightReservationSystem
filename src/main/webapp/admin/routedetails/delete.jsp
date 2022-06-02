<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String flightID = request.getParameter("flightID");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "DELETE FLIGHT_DETAILS WHERE FLIGHT_ID='"+flightID+"'";
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Data is successfully deleted!</h1></center>");
}
catch(Exception e){
    out.print(e);

}
 
 
%>