<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>


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
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container-fluid px-md-5">
            <a class="navbar-brand fs-4" href="/"><img src="images/logo.png" width="50" height="50" /> XYZ Airlines</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-dark" aria-current="page" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Registration.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container my-5">
    
    <div class="row m-0">
    <div class="col-md-6 m-auto shadow-sm border p-3">
    <h3 class="text-center">Payment</h3>
    <form action="payment-submit.jsp" method="POST">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Card Number</label>
    <input type="number" class="form-control" name="cardnumber">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Expiry Date</label>
    <input type="date" class="form-control" name="date">
  </div>
  <%
String userID = String.valueOf(session.getAttribute("userid"));
String flightID = request.getParameter("flightID");
String dateofjourney = request.getParameter("dateofjourney");

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
    String command = "SELECT * FROM RESERVE_FLIGHT_DETAILS JOIN FLIGHT_DETAILS ON RESERVE_FLIGHT_DETAILS.FLIGHT_ID = FLIGHT_DETAILS.FLIGHT_ID JOIN USER_DETAILS ON RESERVE_FLIGHT_DETAILS.USER_ID = USER_DETAILS.USER_ID WHERE RESERVE_FLIGHT_DETAILS.FLIGHT_ID='"+flightID+"' AND RESERVE_FLIGHT_DETAILS.USER_ID='"+userID+"' AND RESERVE_FLIGHT_DETAILS.DATE_OF_JOURNEY='"+dateofjourney+"'";
	
    ResultSet resultSet = statement.executeQuery(command);
	while (resultSet.next()) {
		Integer p = Integer.parseInt(resultSet.getString("PRICE"));
		Integer s = Integer.parseInt(resultSet.getString("NO_OF_SEATS"));
		Integer price =  p*s ;
%>
<div class="mb-3">
	<h5>PAYMENT SUMMARY</h5>
	<p class="mb-0">Total Seats: <%=s%></p>
	<p class="mb-2">Amount per Seat: <%=p%></p>
    <h6>Total Amount to Pay: <%=price%></h6>
  </div>
  <div class="mb-3">
    <input type="hidden" class="form-control" name="price" value="<%=price%>">
  </div>
<% 
	}
}
catch(Exception e){
    out.print(e);

}
 
 
%>
  <input type="submit" class="btn btn-primary" value="Make Payment">
</form>
    </div></div></div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


</body>

</html>