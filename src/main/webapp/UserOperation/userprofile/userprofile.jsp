<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="Connection.GetConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="userprofile.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
	integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
	integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
	integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK"
	crossorigin="anonymous"></script>

</head>
<body>
<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="main-content">
		<div class="container mt-7">
			<!-- Table -->
			<div class="row">
				<div class="col-xl-8 m-auto order-xl-1">
					<div class="card bg-secondary shadow">
						<%
						try {
							Connection con = GetConnection.getConnection();
							Statement statement = con.createStatement();
							String command = "SELECT * FROM OFRS.USER_DETAILS WHERE USER_ID=14764";
							ResultSet resultSet = statement.executeQuery(command);
							while (resultSet.next()) {
						%>
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">My account</h3>
								</div>
								<div class="col-4  text-left">
									<div class="col-8  text-right">
										<button type="button" class="btn btn-primary btn-sm"
											data-toggle="modal" data-target="#ModalLoginForm">
											Edit Profile</button>
									</div>
									<!-- Modal HTML Markup -->
									<div id="ModalLoginForm" class="modal fade">

										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title">Edit Profile</h1>
												</div>
												<div class="modal-body">
													<form role="form" method="POST" action="editprofile.jsp">

														<div class="form-group">
															<label class="control-label">First Name</label>
															<div>
																<input type="email" class="form-control input-lg"
																	name="firstname"
																	value="<%=resultSet.getString("FIRST_NAME")%>">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label">Last Name</label>
															<div>
																<input type="text" class="form-control input-lg"
																	name="lastname"
																	value="<%=resultSet.getString("LAST_NAME")%>">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label">Age</label>
															<div>
																<input type="email" class="form-control input-lg"
																	name="age" value="<%=resultSet.getString("AGE")%>">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label">Address</label>
															<div>
																<input type="email" class="form-control input-lg"
																	name="address"
																	value="<%=resultSet.getString("ADDRESS")%>">
															</div>
														</div>
														<div class="form-group">
															<label class="control-label">PhoneNo</label>
															<div>
																<input type="email" class="form-control input-lg"
																	name="phoneno"
																	value="<%=resultSet.getString("PHONE_NUMBER")%>">
															</div>
														</div>
														<div class="form-group">
															<div>
																<button type="submit" class="btn btn-success ">Update</button>

																<button type="button"
																	class="btn btn-default float-right"
																	data-dismiss="modal">Close</button>
															</div>
														</div>
													</form>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</div>

							</div>
						</div>
						<div class="card-body">
							<div class="col-3  text-left">
								<div class="col-3  text-right">
									<a href="#!" data-toggle="modal" data-target="#ModalExample">Change Password?</a>
								</div>
								<!-- Modal Change Password -->
								<div id="ModalExample" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title text-xs-center">Change Password</h4>
											</div>
											<div class="modal-body">
												<form method="POST" action="changepassword.jsp">
													<div class="form-group">
														<label class="control-label">New Password</label>
														<div>
															<input type="text" class="form-control input-lg"
																name="password">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label">Confirm Password</label>
														<div>
															<input type="text" class="form-control input-lg"
																name="confirmpassword">
														</div>
													</div>

													<div class="form-group">
														<div>
															<button type="submit" class="btn btn-success">Change</button>
															<button type="button" class="btn btn-default float-right"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</form>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
							</div>
							<h6 class="heading-small text-muted mb-4">User information</h6>

							<div class="pl-lg-4">

								<div class="row">
									<div class="col-lg-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-username">UserId</label>
											<input type="text" id="input-username"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("USER_ID")%>" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" for="input-email">Email
												address</label> <input type="email" id="input-email"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("USER_ID")%>" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-first-name">First
												name</label> <input type="text" id="input-first-name"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("FIRST_NAME")%>" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-last-name">Last
												name</label> <input type="text" id="input-last-name"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("LAST_NAME")%>" readonly>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-first-name">Age
											</label> <input type="text" id="input-first-name"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("AGE")%>" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-last-name">Gender
											</label> <input type="text" id="input-last-name"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("GENDER")%>" readonly>
										</div>
									</div>
								</div>


							</div>
							<hr class="my-4">
							<!-- Address -->
							<h6 class="heading-small text-muted mb-4">Contact
								information</h6>
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group focused">
											<label class="form-control-label" for="input-address">Address</label>
											<input id="input-address"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("ADDRESS")%>" type="text"
												readonly>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group focused">
											<label class="form-control-label" for="input-city">Phone
												No.</label> <input type="text" id="input-city"
												class="form-control form-control-alternative"
												value="<%=resultSet.getString("PHONE_NUMBER")%>" readonly>
										</div>
									</div>
								</div>
							</div>
							S
						</div>
						<%
						}
						con.close();
						} catch (Exception e) {
						out.print(e);

						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="row align-items-center justify-content-xl-between">
			<div class="col-xl-6 m-auto text-center">
				<div class="copyright">
					<p>XYZ Airlines</p>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal({
			    title: "Congrats!",
			    text: "Password Successfuly",
			    type: "success",
			    icon: "success"
			}).then(function() {
			    window.location = "userprofile.jsp";
			});
		}
	</script>
</body>
</html>