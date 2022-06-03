<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Print Ticket</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../style.css" rel="stylesheet" />
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
	
	<style type="text/css">
	
@media print
{
body * { visibility: hidden; }
#printarea * { visibility: visible;}

</style>
</head>
<body>
<script>
if (<%=session.getAttribute("userid") %> == null){
	window.location.href = "http://localhost:2000/FlightReservationSystem/Login.jsp";
	
}
</script>

	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand fs-4" href="/"><img src="../images/logo.png" width="50" height="50" /> XYZ Airlines</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-dark" aria-current="page" href="http://localhost:2000/FlightReservationSystem/">Home</a>
                    </li>
                    
                    
                    <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            <i class="fas fa-user-circle"></i>
			          </a>
			          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
			            <li><p class="dropdown-item mb-1" >User ID: <%=session.getAttribute("userid") %></p></li>
			            <li><a class="dropdown-item" href="userprofile/userprofile.jsp">Edit Profile</a></li>
			            <li><a class="dropdown-item" href="myflight.jsp">My Bookings</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Logout </a></li>
			          </ul>
			        </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container my-5">
	<%
		try
		{
			String flightID = request.getParameter("flightID");
			String userID = String.valueOf(session.getAttribute("userid"));
			String datejourney = request.getParameter("date");
			Connection con = GetConnection.getConnection();
			Statement statement = con.createStatement();
			String command = "SELECT FLIGHT_ID FROM RESERVE_FLIGHT_DETAILS where USER_ID='"+userID+"'";
			ResultSet resultSet = statement.executeQuery(command);
			
			while (resultSet.next()) {
				String command1 = "SELECT * FROM RESERVE_FLIGHT_DETAILS JOIN FLIGHT_DETAILS ON RESERVE_FLIGHT_DETAILS.FLIGHT_ID = FLIGHT_DETAILS.FLIGHT_ID JOIN USER_DETAILS ON RESERVE_FLIGHT_DETAILS.USER_ID = USER_DETAILS.USER_ID WHERE RESERVE_FLIGHT_DETAILS.FLIGHT_ID='"+flightID+"' AND RESERVE_FLIGHT_DETAILS.USER_ID='"+userID+"' AND RESERVE_FLIGHT_DETAILS.DATE_OF_JOURNEY='"+datejourney+"'";
				ResultSet resultSet1 = statement.executeQuery(command1);
				while (resultSet1.next()) {
					Integer p = Integer.parseInt(resultSet1.getString("PRICE"));
					Integer s = Integer.parseInt(resultSet1.getString("NO_OF_SEATS"));
					Integer price =  p*s ;
				%>
				<div class="row m-0 border-print">
			        <div class="col-12 col-print-12 m-auto shadow-sm border p-0 ticket-border" id="printarea">
			        <div class="row m-0">
			        <div class="col-8 p-0">
			        <div class="row m-0 bg-primarycolor text-white">
			                <div class="col-2 py-1 text-center">
			                <img src="../images/logo.png" width="50" height="auto" />
			                </div>
			                <div class="col-6 py-1">
			        <h3><%=resultSet1.getString("FLIGHT_NAME")%></h3>
			                </div>
			                <div class="col-4 py-1">
			                <p class="mb-1 text-end">Boarding Pass</p>
			        <p class="mb-1 text-end"><%=resultSet1.getString("RESERVATION_TYPE")%></p>
			                </div>
			            </div>
			        
			            <div class="row m-0">
			                <div class="col-2 p-3">
			                </div>
			                <div class="col-6 pt-3">
			                <p class="mb-1">Passenger Name</p>
			        <p class="text-uppercase fw-bold"><%=resultSet1.getString("FIRST_NAME")%> <%=resultSet1.getString("LAST_NAME")%></p>
			        <p class="mb-1">From</p>
			        <p class="text-uppercase fw-bold"><%=resultSet1.getString("SOURCE")%></p>
			        <p class="mb-1">To</p>
			        <p class="text-uppercase fw-bold"><%=resultSet1.getString("DESTINATION")%></p>
			                </div>
			                <div class="col-4 pt-3">
			                <p class="mb-1">Date</p>
			                <p class="text-uppercase fw-bold mb-1"><%=resultSet1.getString("DATE_OF_JOURNEY")%></p>
			                <p class="mb-1">Flight</p>
			                <p class="text-uppercase fw-bold mb-1"><%=resultSet1.getString("FLIGHT_ID")%></p>
			                <div class="row m-0 p-0">
			                <div class="col-6 p-0"><p class="mb-1">Seats</p>
			                <p class="text-uppercase fw-bold mb-1"><%=resultSet1.getString("NO_OF_SEATS")%></p></div>
			                <div class="col-6 p-0"><p class="mb-1">Price</p>
			                <p class="text-uppercase fw-bold"><%=price%></p></div>
			                </div>
			                
			                
			                </div>
			            </div>
			        </div>
			        <div class="col-4 p-0" style="border-left-style: dashed;">
			        <div class="bg-primarycolor text-white  pe-2 py-1">
			        <p class="mb-1 text-end">Boarding Pass</p>
			        <p class="mb-1 text-end"><%=resultSet1.getString("RESERVATION_TYPE")%></p>
			        </div>
			        <div class="p-3">
			        <p class="mb-1">Passenger Name</p>
			        <p class="mb-1 text-uppercase fw-bold"><%=resultSet1.getString("FIRST_NAME")%> <%=resultSet1.getString("LAST_NAME")%></p>
			        <div class="row m-0 p-0">
			                <div class="col-6 p-0">
			                <p class="mb-1">From</p>
			        <p class="mb-1 text-uppercase fw-bold"><%=resultSet1.getString("SOURCE")%></p>
			        <p class="mb-1">To</p>
			        <p class="mb-1 text-uppercase fw-bold"><%=resultSet1.getString("DESTINATION")%></p></div>
			                <div class="col-6 p-0"><p class="mb-1">Date</p>
			                <p class="text-uppercase fw-bold mb-1"><%=resultSet1.getString("DATE_OF_JOURNEY")%></p>
			                <p class="mb-1">Flight</p>
			                <p class="text-uppercase fw-bold mb-1"><%=resultSet1.getString("FLIGHT_ID")%></p></div>
			                </div>
			        
			        </div>
			        
			        </div>
			        </div>
			        </div>
			    </div>

			<%
			}
		}
		con.close();
		} catch (Exception e) {
			out.print(e);

		}
%>
<div class="text-center my-5">
<button class="btn btn-success" onclick="print()"><i class="fas fa-print"></i>  Print Ticket</button></div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>
