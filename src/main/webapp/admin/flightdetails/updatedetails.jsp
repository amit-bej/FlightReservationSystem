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
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../sidebar.css">
    <link rel="stylesheet" href="../../style.css">
    <title>Admin</title>
</head>


<body>
<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header text-center">
            <img src="../../images/logo.png" width="70" height="70" alt="image"/>
                <h3>XYZ Airlines</h3>
            </div>
            <hr>

            <ul class="list-unstyled components">
                <li class="active">
                    <a class="sidebar-link ps-md-3" href="../flightdetails"><i class="fas fa-info-circle"></i> Flight Details</a>
                </li>  
                  
                <li>  
                    <a class="sidebar-link ps-md-3" href="../flightschedule"><i class="fas fa-calendar-alt"></i> Flight Schedule</a>
                </li>  
                <li>  
                    <a class="sidebar-link ps-md-3" href="#"><i class="fas fa-map-marker-alt"></i> Route Details</a>
                </li>  
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
            
        <div class="row">
            <div class="col-md-6 m-auto border shadow-sm p-3">
                <h3 class="text-center mb-4">Update Flight Details</h3>
                <form action="update.jsp" method="POST">

<% 

try{
	Connection con = GetConnection.getConnection();
    Statement statement = con.createStatement();
	String command = "SELECT * FROM FLIGHT_DETAILS WHERE FLIGHT_ID='"+flightID+"'";
	ResultSet resultSet = statement.executeQuery(command);
	while(resultSet.next()){
		%>
		<div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Flight ID</label>
                        <input type="number" class="form-control" name="flightID" value="<%=resultSet.getString("FLIGHT_ID") %>" required >
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Flight Name</label>
                        <input type="text" class="form-control" name="flightname" value="<%=resultSet.getString("FLIGHT_NAME") %>" required>
                    </div>
                    <div class="row m-0">
                        <div class="col-md-6 mb-3 ps-md-0">
                            <select class="form-select" aria-label="Default select example" name="source" required>
                                <option value="<%=resultSet.getString("SOURCE") %>" selected><%=resultSet.getString("SOURCE") %></option>
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
                        <div class="col-md-6 mb-3 pe-md-0">
                            <select class="form-select" aria-label="Default select example" name="destination" required>
                                <option value="<%=resultSet.getString("DESTINATION") %>" selected><%=resultSet.getString("DESTINATION") %></option>
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
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Travel Duration</label>
                        <input type="number" class="form-control" name="travelduration" value="<%=resultSet.getString("ESTIMATED_TRAVEL_DURATION") %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Seating Capacity</label>
                        <input type="text" class="form-control" name="seatingcapacity" value="<%=resultSet.getString("SEATING_CAPACITY") %>" required>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" aria-label="Default select example" name="reservationtype" required>
                            <option value="<%=resultSet.getString("RESERVATION_TYPE") %>" selected><%=resultSet.getString("RESERVATION_TYPE") %></option>
                            <option value="First Class">First Class</option>
                            <option value="Business Class">Business Class</option>
                            <option value="Premium Economy">Premium Economy</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Reservation Capacity</label>
                        <input type="number" class="form-control" name="reservationcapacity" value="<%=resultSet.getString("RESERVATION_CAPACITY") %>" required>
                    </div>
		
		<%
		}
	con.close();
}
catch(Exception e){
    out.print(e);

}
 
 
%>
<input type="submit" class="btn btn-primary w-100" value="Update" />
                </form>
            </div>
        </div>
        
        
        
  </div>
</div>

    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
    </script>

</body>

</html>