<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>

<% String flightID = request.getParameter("flightID"); %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../sidebar.css">
<link rel="stylesheet" href="../../style.css">
    <title>Admin</title>
</head>

<body>
<script>
if (<%=session.getAttribute("userid") %> == null){
	window.location.href = "http://localhost:2000/FlightReservationSystem/Login.jsp";
	
}
</script>
<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header text-center">
				<img src="../../images/logo.png" width="70" height="70" alt="image" />
				<h3>XYZ Airlines</h3>
			</div>
			<hr>

			<ul class="list-unstyled components">
			<li><a class="sidebar-link ps-md-3" href="../index.jsp"><i
						class="fas fa-info-circle"></i> Manage bookings</a></li>
				<li><a class="sidebar-link ps-md-3" href="../flightdetails/index.jsp"><i
						class="fas fa-info-circle"></i> Flight Details</a></li>

				<li class="active"><a class="sidebar-link ps-md-3" href="../flightschedule/index.jsp"><i
						class="fas fa-calendar-alt"></i> Flight Schedule</a></li>
				<li><a class="sidebar-link ps-md-3" href="../routedetails/index.jsp"><i
						class="fas fa-map-marker-alt"></i> Route Details</a></li>
						<li><a class="sidebar-link ps-md-3" href="routedetails/index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
			</ul>


		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-white">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i>
					</button>


				</div>
			</nav>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-6 m-auto border shadow-sm p-3">
                <h3 class="text-center mb-4">Update Flight Schedule</h3>
                <form action="update.jsp" method="POST">
                <div class="mb-3 ps-md-0">
                <label for="flightID" class="form-label">Select Flight ID</label>
                            <select class="form-select" aria-label="Default select example" name="flightID" id="FLIGHT_ID" required>
<option value="<%=flightID %>" selected><%=flightID %></option>
<% 

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "SELECT * FROM FLIGHT_DETAILS";
	ResultSet resultSet = statement.executeQuery(command);
	while(resultSet.next()){
		%>
                    
                        
                                <option value="<%=resultSet.getString("FLIGHT_ID") %>"><%=resultSet.getString("FLIGHT_ID") %></option>
                            
		
		<%
		}
	%>
	</select>
	</div>
	<div class="mb-3">
                 <label for="exampleInputEmail1" class="form-label">Flight Name</label>
                 <select class="form-select" aria-label="Default select example" name="flightname" id="FLIGHT_ID" required>
<% 
	String sql4 = "SELECT FLIGHT_NAME FROM FLIGHT_DETAILS WHERE FLIGHT_ID='"+flightID+"'";
	ResultSet result4 = statement.executeQuery(sql4);
	while(result4.next()){
		%>
                    
                        <option value="<%=result4.getString("FLIGHT_NAME") %>"><%=result4.getString("FLIGHT_NAME") %></option>
                              
                            
		
		<%
		}
	


 
	String sql = "SELECT * FROM FLIGHT_DETAILS";
	ResultSet result = statement.executeQuery(sql);
	while(result.next()){
		%>
                    
                        <option value="<%=result.getString("FLIGHT_NAME") %>"><%=result.getString("FLIGHT_NAME") %></option>
                              
                            
		
		<%
		}
	con.close();
}
catch(Exception e){
    out.print(e);

}
 
 
%>
</select>
                        </div>
                        <div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="0" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Sunday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="1" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Monday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="2" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Tuesday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="3" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Wednesday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="4" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Thursday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="5" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Friday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="6" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Saturday
  </label>
</div>
<input type="submit" class="btn btn-primary w-100" value="Add" />
                </form>
            </div>
        </div>
    </div>
</div>

	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


</body>

</html>