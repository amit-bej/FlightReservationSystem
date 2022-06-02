<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<%@ page import="java.util.Calendar"%>
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
    <title>XYZ Airlines</title>
</head>

<body>
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
                        <a class="nav-link text-dark" aria-current="page" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Registration.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Logout"><%=session.getAttribute("username") %></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section style="height:90vh;">
        <img src="images/parallax.jpg" width="100%" height="100%" />
    </section>
    <section class="py-5 mb-5" style="background-color:#ffa500;">
    <div class="container">
    <form action="" method="GET">
    <div class="row m-0 d-flex align-items-center">
    <div class="col-md-3">
    <label for="exampleInputEmail1" class="form-label">Source</label>
    <select class="form-select" aria-label="Default select example"
										name="source" required>
										<option value="" selected disabled>Source</option>
										<option value="Afghanistan">Afghanistan</option>
										<option value="Antarctica">Antarctica</option>
										<option value="Australia">Australia</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Brazil">Bangladesh</option>
										<option value="Canada">Canada</option>
										<option value="Denmark">Denmark</option>
										<option value="Egypt">Egypt</option>
										<option value="France">France</option>
										<option value="Germany">Germany</option>
										<option value="India">India</option>
										<option value="Japan">Japan</option>
										<option value="Singapore">Singapore</option>
										<option value="United States">United States</option>
										<option value="Zimbabwe">Zimbabwe</option>
									</select>
									</div>
    <div class="col-md-3">
    <label for="exampleInputEmail1" class="form-label">Destination</label>
    <select class="form-select" aria-label="Default select example"
										name="destination" required>
										<option value="" selected disabled>Source</option>
										<option value="Afghanistan">Afghanistan</option>
										<option value="Antarctica">Antarctica</option>
										<option value="Australia">Australia</option>
										<option value="Bangladesh">Bangladesh</option>
										<option value="Brazil">Bangladesh</option>
										<option value="Canada">Canada</option>
										<option value="Denmark">Denmark</option>
										<option value="Egypt">Egypt</option>
										<option value="France">France</option>
										<option value="Germany">Germany</option>
										<option value="India">India</option>
										<option value="Japan">Japan</option>
										<option value="Singapore">Singapore</option>
										<option value="United States">United States</option>
										<option value="Zimbabwe">Zimbabwe</option>
									</select>
									</div>
    <div class="col-md-3">
    <label for="exampleInputEmail1" class="form-label">Date of Journey</label>
    <input type="date" class="form-control" name="date">
    
  
  </div>
    <div class="col-md-3 mt-4 pt-1">
    <input type="submit" class="btn btn-success" value="Search Flights"/>
    </div>
    </div>
    </form>
    </div>
    </section>
    <section>
    <div class="container mb-5">
    
<%
try{
				
					String source = request.getParameter("source");
					String destination = request.getParameter("destination");
    				String date = request.getParameter("date");
    				String dateofjourney = request.getParameter("day");
    				
    				if (source != null || destination!= null || date!= null || dateofjourney!=null){
    					%> 
        				<script>
        					var date = "<%=date%>";
        					var datearray = date.split("-");
        					var newdate = datearray[1] + '-' + datearray[2] + '-' + datearray[0];
        					var date8 = new Date(newdate);
        					
        					url = new URL(window.location.href);
        					var p = url.searchParams.get('day');
        					if (p == null){
        						const urlParams = new URLSearchParams(window.location.search);

            					urlParams.set('day', date8.getDay());

            					window.location.search = urlParams;
        					}
        					else if (p == "NaN"){
        						const urlParams = new URLSearchParams(window.location.search);

            					urlParams.set('day', date8.getDay());

            					window.location.search = urlParams;
        					}
        					
        					
        				</script>
        				<h3 class="text-center">Showing Flights on</h3>
        				<h4 class="text-center"><%=date%></h4>
        				<%
        				dateofjourney = request.getParameter("day");
    					Connection con = GetConnection.getConnection();
    					Statement statement = con.createStatement();
    					String command = "SELECT * FROM FLIGHT_DETAILS JOIN FLIGHT_SCHEDULE_DETAILS ON FLIGHT_DETAILS.FLIGHT_ID = FLIGHT_SCHEDULE_DETAILS.FLIGHT_ID WHERE FLIGHT_DETAILS.SOURCE='"+source+"' AND FLIGHT_DETAILS.DESTINATION='"+destination+"' AND AVAILABLE_DAYS='"+dateofjourney+"'";
    					ResultSet resultSet = statement.executeQuery(command);
    					while (resultSet.next()) {
    						%>

    						<div class="row m-0 my-4">
    						<div class="col-md-6 p-3 m-auto shadow-sm border ">
    						<h3><%=resultSet.getString("FLIGHT_NAME")%></h3>
    						<p class="mb-1">Flight: <%=resultSet.getString("FLIGHT_id")%></p>
    						<h5 class="text-uppercase"><%=resultSet.getString("SOURCE")%> TO <%=resultSet.getString("DESTINATION")%></h5>
    						<h4><span class="badge bg-warning text-dark">Rs <%=resultSet.getString("PRICE")%>/-</span> <a href="checkout.jsp?flightID=<%=resultSet.getString("FLIGHT_id")%>&date=<%=date %>" class="btn btn-primary btn-sm">Book Now</a></h4>
    						
    						</div>


    						<%
    						}
    				

    						con.close();
    				}
    						} catch (Exception e) {
    						out.print(e);

    						}

    						%>
</div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


</body>

</html>