<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="CSS/adminstyle.css" rel="stylesheet">
<style>
.my {
	background-image: url("Images/health-care-logo-free-vector.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	background-origin: content-box;
	height: auto;
	width: 100%;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

h1 {
	color: white;
	padding: 100px;
}
</style>
</head>
<body>


<div class="container-fluid my">
	<div class="row flex-nowrap">
		<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-info">
			<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
				<a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
					<img alt="" src="Images/hospitallogo.png" style="width: 100px; height: auto;">
				</a>
				<span class="fs-5 d-none d-sm-inline text-light">WELCOME</span>
				<ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
					<li class="nav-item"><a href="Admindashbord.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Home</span></a></li>
					<li><a href="AddUserLogin.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Admin Login</span></a></li>
					<li><a href="UserLoginPage.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">User Login</span></a></li>
					<li><a href="DocterLoginpage.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Docter Login</span></a></li>
					<li><a href="" class="nav-link px-0"> <span class="d-none d-sm-inline">Department</span></a></li>
					<li><a href="" class="nav-link px-0"> <span class="d-none d-sm-inline">Gallery</span></a></li>
					<li><a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Contact</span></a></li>
				</ul>
				<hr>
				<div class="dropdown pb-4">
					<a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://static.vecteezy.com/system/resources/previews/000/569/503/original/sign-of-hospital-icon-vector.jpg" alt="hugenerd" width="30" height="30" class="rounded-circle">
						<span class="d-none d-sm-inline mx-1">Admin CEO</span>
					</a>
					<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
						<li><a class="dropdown-item" href="#">Employee</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>






<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</body>
</html>
