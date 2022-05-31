<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/loginstyle.css">
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container-fluid px-md-5">
			<a class="navbar-brand fs-4" href="/"><img src="images/logo.png"
				width="50" height="50" /> XYZ Airlines</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link text-dark"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="Login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="Registration.jsp">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- partial:index.partial.html -->
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<h2 class="active">Sign In</h2>
			<!-- Login Form -->
			<form action="Login" method="get">
				<input type="text" id="login" class="fadeIn second" name="username"
					placeholder="username" required> <input type="password"
					id="password" class="fadeIn third" name="password"
					placeholder="password" required>
				<!--  <a class="underlineHover"
					href="Forgot.jsp">Forgot Password?</a>-->
				<br> <input type="submit" class="fadeIn fourth" value="Log In">
			</form>
			<div id="formFooter">
				<a class="underlineHover" href="Registration.jsp">Do not have an
					account?</a>
			</div>

		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Sorry", "Wrong Username or Password", "error");
			response.sendRedirect("Login.jsp");
		}
	</script>
</body>
</html>
