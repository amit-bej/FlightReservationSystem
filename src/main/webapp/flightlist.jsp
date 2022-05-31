<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            outline: none;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background: #f2f2f2;
        }

        nav {
            position: fixed;
            width: 100%;
            background: #171c24;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            height: 70px;
            padding: 0 100px;
            z-index: 100000;
        }

        nav .logo {
            color: #fff;
            font-size: 30px;
            font-weight: 600;
            letter-spacing: -1px;
        }

        nav #source,
        #destination,
        #dateid,
        #search {
            border-color: black;
            border-radius: 14px;
            padding: 6px;
        }

        nav .navbar {
            color: white;
        }
        nav .navbar a{
            color: white;
            text-decoration: none;
        }

        .search-data {
            position: fixed;
            right: 10px;
            bottom: 93%;
            width: 5%;
            display: inline-block;
            padding: 8px;
           margin: 0px auto auto auto;
            border-radius: 14px;
        }
    </style>
</head>

<body>
    <nav>
        <div class="logo">
            XyzAirlines
        </div>
         <form action="#">
        <div class="navbar">
        Source
           <select class="form-select" aria-label="Default select example"
										name="source" required>
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
Destination           <select class="form-select" aria-label="Default select example"
										name="source" required>
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
            Date <input type="date">
            <!-- add user ui html in href of ModifySearch -->
            <input type="submit" value="Search" class="search-data" id="search">
            
           

        </div>
        </form>
    </nav>
    

</body>

</html>