<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Account</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!-- 
<script> 
function validate()
{ 
     var First_Name = document.form.FirstName.value;
     var Last_Name = document.form.LastName.value;
     var Age = document.Age.value; 
     var Gender = document.form.Gender.value;
     var Address= document.form.Address.value;
     var PhoneNo= document.form.PhoneNo.value;
     var Password= document.form.Password.value;
     
     if (FirstName==null || FirstName=="")
     { 
     alert("First Name can't be blank"); 
     return false; 
     }
     else if (Last_Name==null || Last_Name=="")
     { 
     alert("Last Name can't be blank"); 
     return false; 
     }
     else if (Age==null || Age=="")
     { 
     alert("Age can't be blank"); 
     return false; 
     }
     else if (Gender==null || Gender=="")
     { 
     alert("Gender can't be blank"); 
     return false; 
     }
     else if (Address==null || Address=="")
     { 
     alert("Address can't be blank"); 
     return false; 
     }
     else if (PhoneNo==null || PhoneNo=="" || PhoneNo.length<10)
     { 
     alert("Invalid PhoneNo"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
 } 
</script> >-->
</head>
<body>
	<div class="container">
		<div class="regbox box">
			<img class="avatar" src="img/collaboration.png">
			<h1>Register Account</h1>
			<form action="RegisterServlet" method="get">
				<p>First Name</p>
				<input type="text" placeholder="First Name" name="FirstName"
					required>
				<p>Last Name</p>
				<input type="text" placeholder="Last Name" name="LastName" required>
				<p> Age<p>
				<input type="text" placeholder="Age" name="Age" required>
				<p>Gender<p>
				<input type="text" placeholder="Gender" name="Gender" required>
				<p>Address<p>
				<input type="text" placeholder="Address" name="Address" required>
				<p>PhoneNo<p>
				<input type="text" placeholder="PhoneNo" name="PhoneNo" required>
                <p>Password<p>				
				<input type="password" placeholder="Password" name="Password" required>
				<input type="submit" value="Register"> <br>
				<a href="Login.jsp">Already have an Account?</a>
			</form>
		</div>
	</div>
</body>
</html>
