<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%

String routeID = request.getParameter("routeID");
String routename = request.getParameter("routename");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "UPDATE ROUTE_DETAILS SET ROUTE_NAME='"+routename+"' WHERE ROUTE_ID='"+routeID+"'";
    statement.executeUpdate(command);
    out.println("<center style='display:flex;align-items:center;height:100vh;justify-content:center;'><h1>Data is successfully updated!</h1></center>");
}
catch(Exception e){
    out.print(e);

}
 
 
%>