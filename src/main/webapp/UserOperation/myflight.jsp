<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"></link>

<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="../style.css">
<title>My Bookings</title>
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
			            <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt"></i> Logout </a></li>
			          </ul>
			        </li>
                </ul>
            </div>
        </div>
    </nav>
	

			<div class="container  my-5">
			<h3 class="mb-3">My Bookings</h3>
			<table class="table table-bordered table-responsive">
				<tr>
					<th>FLIGHT ID</th>
					<th>FLIGHT NAME</th>
					<th>SOURCE</th>
					<th>DESTINATION</th>
					<th>DATE OF JOURNEY</th>
					<th>ACTION</th>
				</tr>
			<%
				try {
					String userID = String.valueOf(session.getAttribute("userid"));
					Connection con = GetConnection.getConnection();
					Statement statement = con.createStatement();
					String command = "SELECT FLIGHT_ID FROM RESERVE_FLIGHT_DETAILS where USER_ID='"+userID+"'";
					ResultSet resultSet = statement.executeQuery(command);
					
					while (resultSet.next()) {
						String command1 = "SELECT * FROM RESERVE_FLIGHT_DETAILS LEFT JOIN FLIGHT_DETAILS ON RESERVE_FLIGHT_DETAILS.FLIGHT_ID = FLIGHT_DETAILS.FLIGHT_ID WHERE RESERVE_FLIGHT_DETAILS.FLIGHT_ID='"+resultSet.getString("FLIGHT_ID")+"' AND RESERVE_FLIGHT_DETAILS.USER_ID='"+userID+"'";
						ResultSet resultSet1 = statement.executeQuery(command1);
						while (resultSet1.next()) {
				%>

				<tr>
					<th><%=resultSet1.getString("FLIGHT_ID")%></th>
					<td><%=resultSet1.getString("FLIGHT_NAME")%></td>
					<td><%=resultSet1.getString("SOURCE")%></td>
					<td><%=resultSet1.getString("DESTINATION")%></td>
					<td><%=resultSet1.getString("DATE_OF_JOURNEY")%></td>
					<td><a href="print.jsp?flightID=<%=resultSet1.getString("FLIGHT_ID")%>&date=<%=resultSet1.getString("DATE_OF_JOURNEY")%>" class="btn btn-success"><i class="fas fa-print"></i> Print Ticket</a> <a href="cancelticket.jsp?flightID=<%=resultSet1.getString("FLIGHT_ID")%>&date=<%=resultSet1.getString("DATE_OF_JOURNEY")%>" class="btn btn-danger"><i class="fas fa-times"></i> Cancel</a></td>
				</tr>


				<%
				}
					}
				con.close();
				} catch (Exception e) {
				out.print(e);

				}
				%>
			</table></div>
	



	

	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	

</body>

</html>