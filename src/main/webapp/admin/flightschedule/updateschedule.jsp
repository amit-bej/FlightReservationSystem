<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>

<% String flightID = request.getParameter("flightID"); %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Admin</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">XYZ Air Travels</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-white" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Add Flight Details</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Add Flight Schedule</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white">Add Route</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-4 m-auto border shadow-sm p-3">
                <h3 class="text-center mb-4">Update Flight Schedule</h3>
                <form action="update.jsp" method="POST">
                <div class="mb-3 ps-md-0">
                <label for="flightID" class="form-label">Select Flight ID</label>
                            <select class="form-select" aria-label="Default select example" name="flightID" id="FLIGHT_ID" required>
<option value="" selected disabled>Select</option>
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
<option value="" selected disabled>Select</option>
                        <% 
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
  <input class="form-check-input" type="checkbox" value="1" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Sunday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="2" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Monday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="3" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Tuesday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="4" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Wednesday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="5" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Thursday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="6" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Friday
  </label>
</div>
<div class="mb-3 form-check">
  <input class="form-check-input" type="checkbox" value="7" name="days">
  <label class="form-check-label" for="defaultCheck1">
    Every Saturday
  </label>
</div>
<input type="submit" class="btn btn-primary w-100" value="Add" />
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


</body>

</html>