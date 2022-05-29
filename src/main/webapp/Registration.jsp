<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Registration Page</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.42/css/uikit.css'>

</head>
<body>
<input type = "hidden" id ="status" value="<%= request.getAttribute("status") %>">
<input type = "hidden" id ="status" value="<%= request.getAttribute("Userid") %>">
<!--Top navigation bar-->
<div class="uk-section uk-section-primary uk-padding-remove">
	<div class="uk-container">
		<nav uk-navbar>
			<div class="uk-navbar-left">
			<h2>
          <img class="uk-margin-small-right " height="48" width="48" src="images/logo.png">
					XYZ Fight
			</h2>	
			</div>
			<div class="uk-navbar-right">
				<ul class="uk-navbar-nav">
					<li class="uk-hidden@s">
						<a href="#menu-offcanvas" uk-toggle>
							<i class="fas fa-bars fa-2x"></i>
						</a>
					</li>
					<li class="uk-visible@s">
						<a href="">
							Home
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>

<div class="uk-section uk-padding-remove">
	<div class="uk-container">
		<div class="uk-grid-collapse" uk-grid>
			<div class="uk-width-expand uk-background-muted uk-padding-small">
<section class="uk-section uk-section-xsmall" uk-height-viewport="offset-top: true">
	<div class="uk-container">
		<div class="uk-flex uk-flex-center">
			<div class="uk-card uk-card-default uk-card-hover uk-card-body uk-width-large">
				<h3>Register</h3>
				<form class="uk-form-stacked" action="RegisterServlet" method="get">
					<div class="uk-margin">
						<label class="uk-form-label" for="firstname">
							First Name
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="firstname" name="FirstName" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="lastname">
							Last Name
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="lastname" name="LastName" type="text">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Age">
							Age
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Age" name="Age" type="text">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Gender">
							Gender
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Gender" name="Gender" type="text">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Address">
							Address
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Address" name="Address" type="text">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="PhoneNO">
							PhoneNo
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="PhoneNo" name="PhoneNo" type="text">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Password">
							Password
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Password" name="Password" type="Password">
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label>
							 <a href="Login.jsp">Already have an account!</a>.
						</label>
					</div>
					<button class="uk-button uk-button-primary uk-width-1-1" type="submit">Register</button>
				</form>
			</div>
		</div>
	</div>
</section>

			</div>
		</div>
	</div>
</div>

<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.42/js/uikit.js'></script>
<script src='https://use.fontawesome.com/releases/v5.0.9/js/all.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	var id = request.getAttribute("userid");
	if(status == "success")
		{
		swal({
			title:"Congrats!",
			text:"Account Created Successfully. /n Your id is:"+id,
			icon:"success"});
		    response.sendRedirect("Login.jsp");
		}
</script>
</body>
</html>
