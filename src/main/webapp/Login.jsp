<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" href="assets/css/loginstyle.css">
</head>
<body>
<input type = "hidden" id ="status" value="<%= request.getAttribute("status") %>">

	<div class="topnav">
		<h2>
			<img class="uk-margin-small-right " height="48" width="48"
				src="images/logo.png"> XYZ Fight
		</h2>
		<div class="topnav-right" float: right;>
			<a href="#">Home</a> 
			<a href="#about">About</a> 
			<a href="#about">Contact</a>

		</div>
	</div>
	<!-- partial:index.partial.html -->
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<h2 class="active">Sign In</h2>
			<!-- Login Form -->
			<form action="Login" method="get">
				<input type="text" id="login" class="fadeIn second" name="username"
					placeholder="username"> <input type="password"
					id="password" class="fadeIn third" name="password"
					placeholder="password"> <a class="underlineHover"
					href="Forgot.jsp">Forgot Password?</a><br> <input
					type="submit" class="fadeIn fourth" value="Log In">
			</form>
			<div id="formFooter">
				<a class="underlineHover" href="Registration.jsp">Do not have an
					account?</a>
			</div>

		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed")
		{
		swal("Sorry","Wrong Username or Password","failed");
		response.sendRedirect("Login.jsp");
		}
	</script>
</body>
</html>
