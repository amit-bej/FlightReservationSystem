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
				<li><a class="sidebar-link ps-md-3" href="#"><i
						class="fas fa-info-circle"></i> Flight Details</a></li>

				<li><a class="sidebar-link ps-md-3" href="../flightschedule/index.jsp"><i
						class="fas fa-calendar-alt"></i> Flight Schedule</a></li>
				<li class="active"><a class="sidebar-link ps-md-3" href="../routedetails/index.jsp"><i
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

			<div class="container mb-5">
				<button type="button" class="btn btn-primary my-3"
					data-bs-toggle="modal" data-bs-target="#exampleModal">
					<i class="fas fa-plus-circle"></i> Add Route Details
				</button>
				<h3 class="mb-3">Manage Route details</h3>
				<table class="table table-bordered table-responsive">
					<tr>
						<th>ROUTE ID</th>
						<th>ROUTE NAME</th>
						<th>ACTIONS</th>
					</tr>

					<%
					try {
						Connection con = GetConnection.getConnection();
						Statement statement = con.createStatement();
						String command = "SELECT * FROM ROUTE_DETAILS";
						ResultSet resultSet = statement.executeQuery(command);
						while (resultSet.next()) {
					%>

					<tr>
						<th><%=resultSet.getString("ROUTE_ID")%></th>
						<td><%=resultSet.getString("ROUTE_NAME")%></td>
						<td><a class="text-decoration-none"
							href="updatedetails.jsp?routeID=<%=resultSet.getString("ROUTE_ID")%>"><i
								class="fas fa-pencil-alt"></i> Edit</a>&nbsp;&nbsp;<a
							class="text-danger text-decoration-none"
							href="delete.jsp?routeID=<%=resultSet.getString("ROUTE_ID")%>"><i
								class="fas fa-trash-alt"></i> Delete</a></td>
					</tr>


					<%
					}
					con.close();
					} catch (Exception e) {
					out.print(e);

					}
					%>
				</table>
			</div>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="add.jsp" method="POST">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Add Route
								Details</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Route
									ID</label> <input type="number" class="form-control" name="routeID"
									required>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Route
									Name</label> <input type="text" class="form-control" name="routename"
									required>
							</div>
						</div>
						<div class="modal-footer">

							<input type="submit" class="btn btn-primary w-100" value="Add" />
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sidebar").mCustomScrollbar({
				theme : "minimal"
			});

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar, #content').toggleClass('active');
				$('.collapse.in').toggleClass('in');
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});
		});
	</script>

</body>

</html>