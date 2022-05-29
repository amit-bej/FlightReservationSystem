<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String flightID = request.getParameter("flightID");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "DELETE FLIGHT_DETAILS WHERE FLIGHT_ID='"+flightID+"'";
    statement.executeUpdate(command);
	out.println("Data is successfully deleted!");
}
catch(Exception e){
    out.print(e);

}
 
 
%>