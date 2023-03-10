<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #17a2b8;
	height: 100vh;
}

#login .container #login-row #login-column #login-box {
	margin-top: 120px;
	max-width: 600px;
	height: 320px;
	border: 1px solid #9C9C9C;
	background-color: #EAEAEA;
}

#login .container #login-row #login-column #login-box #login-form {
	padding: 20px;
}

#login .container #login-row #login-column #login-box #login-form #register-link
	{
	margin-top: -85px;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body style="background-color: #17a2b8;">
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container-fluid px-md-5">
			<div class="navbar-brand fs-4" href="/">
				<img src="images/logo.png" width="50" height="50" /> XYZ Airlines
			</div>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link text-dark"
						aria-current="page" href="index.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="login">
		<h3 class="text-center text-white pt-5">XYZ FLIGHTS</h3>
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div id="login-box" class="col-md-12">
						<form id="login-form" class="form" action="AdminLoginServlet"
							method="post">
							<h3 class="text-center text-info">Admin</h3>
							<div class="form-group">
								<label for="username" class="text-info">Username:</label><br>
								<input type="text" name="username" id="username"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Password:</label><br>
								<input type="text" name="password" id="password"
									class="form-control" required>
							</div>
							<div class="form-group">
								<input type="submit" name="submit" class="btn btn-info btn-md"
									value="Login">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			alert ( "Invalid Username Password." );
			//response.sendRedirect("Adminlogin.jsp");
		}
	</script>
</body>
</html>