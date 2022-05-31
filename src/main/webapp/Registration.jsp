<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Registration Page</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.0-beta.42/css/uikit.css'>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="style.css" rel="stylesheet" />
</head>
<body>
<input type = "hidden" id ="status" value="<%= request.getAttribute("status") %>">
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
                        <a class="nav-link text-dark" aria-current="page" href="index.jsp">Home</a>
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

<div class="uk-section uk-padding-remove bg-light">
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
								<input class="uk-input" id="lastname" name="LastName" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Age">
							Age
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Age" name="Age" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Gender">
							Gender
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Gender" name="Gender" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Address">
							Address
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Address" name="Address" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="PhoneNO">
							PhoneNo
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="PhoneNo" name="PhoneNo" type="text" required>
							</div>
						</div>
					</div>
					<div class="uk-margin">
						<label class="uk-form-label" for="Password">
							Password
						</label>
						<div class="uk-form-controls">
							<div class="uk-inline uk-width-1-1">
								<input class="uk-input" id="Password" name="Password" type="Password" required>
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
	
	
<script type="text/javascript">
	var status = document.getElementById("status").value;
	//var id = request.getAttribute("userid");
	if(status == "success")
		{
		swal("Congratulations","Registered Sussecfull","success");
		}
</script>
</body>
</html>
