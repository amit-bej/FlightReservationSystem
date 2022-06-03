<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%@ page import="java.util.Calendar"%>

<%

String flightID = request.getParameter("flightID"); 
String date = request.getParameter("date");


%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="style.css" rel="stylesheet" />
    <title>Checkout</title>
</head>

<body>
<script>
if (<%=session.getAttribute("userid") %> == null){
	window.location.href = "http://localhost:2000/FlightReservationSystem/Login.jsp";
	
}
</script>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand fs-4" href="/"><img src="images/logo.png" width="50" height="50" /> XYZ Airlines</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-dark" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    
                    
                    <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            <i class="fas fa-user-circle"></i>
			          </a>
			          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
			            <li><p class="dropdown-item mb-1" >User ID: <%=session.getAttribute("userid") %></p></li>
			            <li><a class="dropdown-item" href="UserOperation/userprofile/userprofile.jsp">Profile</a></li>
			            <li><a class="dropdown-item" href="UserOperation/myflight.jsp">My Bookings</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i> Logout </a></li>
			          </ul>
			        </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container my-5">
    
    <div class="row m-0">
    <div class="col-md-6 m-auto shadow-sm border p-3">
    <h3 class="text-center">Checkout</h3>
    <form action="reserveflight.jsp" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">User ID</label>
    <input type="number" class="form-control" value="<%=session.getAttribute("userid") %>" readonly="readonly" name="userID">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Flight ID</label>
    <input type="number" class="form-control" value="<%=flightID%>" readonly="readonly" name="flightID">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Date of Journey</label>
    <input type="date" class="form-control" value="<%=date%>" readonly="readonly" name="date">
  </div>
  <div class="mb-3"><label for="exampleInputEmail1" class="form-label">Reservation Type</label> 
								<select class="form-select" aria-label="Default select example"
									name="reservationtype" required>
									<option value="" selected disabled>Reservation Type</option>
									<option value="First Class">First Class</option>
									<option value="Business Class">Business Class</option>
									<option value="Premium Economy">Premium Economy</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Total Seats</label> 
								<input type="number" class="form-control"
									name="seats" required>
							</div>
  <input type="submit" class="btn btn-primary" value="Confirm Booking">
</form>
    </div></div></div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


</body>

</html>