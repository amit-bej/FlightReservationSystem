<%@ page import="java.sql.*"%>
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
                    <a class="sidebar-link ps-md-3" href="#"><i class="fas fa-info-circle"></i> Flight Details</a>
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
            <button type="button" class="btn btn-primary my-3" data-bs-toggle="modal" data-bs-target="#exampleModal">
  <i class="fas fa-plus-circle"></i> Add Flight Details
</button>
            <h3 class="mb-3">Manage Flight details</h3>
            <table class="table table-bordered table-responsive">
    <tr>
      <th>FLIGHT ID</th>
      <th>FLIGHT NAME</th>
      <th>SOURCE</th>
      <th>DESTINATION</th>
      <th>ACTIONS</th>
    </tr>
        
            <%
            try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
    Statement statement = conn.createStatement();
	String command = "SELECT * FROM FLIGHT_DETAILS";
	ResultSet resultSet = statement.executeQuery(command);
	while(resultSet.next()){
		%>
		
    <tr>
      <th><%=resultSet.getString("FLIGHT_ID") %></th>
      <td><%=resultSet.getString("FLIGHT_NAME") %></td>
      <td><%=resultSet.getString("SOURCE") %></td>
      <td><%=resultSet.getString("DESTINATION") %></td>
      <td><a class="text-decoration-none" href="updatedetails.jsp?flightID=<%=resultSet.getString("FLIGHT_ID") %>"><i class="fas fa-pencil-alt"></i> Edit</a>&nbsp;&nbsp;<a class="text-danger text-decoration-none" href="delete.jsp?flightID=<%=resultSet.getString("FLIGHT_ID") %>"><i class="fas fa-trash-alt"></i> Delete</a></td>
    </tr>

		
		<% 
	}
	conn.close();
}
catch(Exception e){
    out.print(e);

}
            
%>
</table>
    </div>
        </div>
        
        
        <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form action="add.jsp" method="POST">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add flight Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Flight ID</label>
                        <input type="number" class="form-control" name="flightID" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Flight Name</label>
                        <input type="text" class="form-control" name="flightname" required>
                    </div>
                    <div class="row m-0">
                        <div class="col-md-6 mb-3 ps-md-0">
                            <select class="form-select" aria-label="Default select example" name="source" required>
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
                        <div class="col-md-6 mb-3 pe-md-0">
                            <select class="form-select" aria-label="Default select example" name="destination" required>
                                <option value="" selected disabled>Destination</option>
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
                        <input type="number" class="form-control" name="travelduration" required>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Seating Capacity</label>
                        <input type="text" class="form-control" name="seatingcapacity" required>
                    </div>
                    <div class="mb-3">
                        <select class="form-select" aria-label="Default select example" name="reservationtype" required>
                            <option value="" selected disabled>Reservation Type</option>
                            <option value="First Class">First Class</option>
                            <option value="Business Class">Business Class</option>
                            <option value="Premium Economy">Premium Economy</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Reservation Capacity</label>
                        <input type="number" class="form-control" name="reservationcapacity" required>
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