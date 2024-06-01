<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Navigation Bar with Login Forms</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-image: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%);
}

.navbar-nav .nav-item + .nav-item {
	margin-left: 0;
}

.navbar-nav .nav-link {
	padding: 0.5rem 1rem;
}

.navbar a {
	color: white !important;
}

.navbar a:hover {
	background-color: #17a2b8 !important;
}

.login-form {
	display: none;
	background-color: rgba(255, 255, 255, 0.9);
	padding: 20px;
	border-radius: 10px;
	max-width: 400px;
	margin: 20px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-form h2 {
	margin-top: 0;
}

input, button {
	height: 40px;
	width: 100%;
	margin-bottom: 10px;
}

.error-message {
	color: red;
}

.hero-section {
	background: url('Images/hero.jpg') no-repeat center center/cover;
	color: white;
	padding: 100px 0;
	text-align: center;
}

.hero-section h1 {
	font-size: 4rem;
}

.testimonials {
	background-color: #f8f9fa;
	padding: 50px 0;
	text-align: center;
}

.testimonial-card {
	margin: 10px;
}

.faq-section {
	background-color: #fff;
	padding: 50px 0;
}

.footer {
	background-color: #343a40;
	color: white;
	padding: 20px 0;
	text-align: center;
}
</style>
<script type="text/javascript">
function showAdminLogin() {
    document.getElementById('admin-login-form').style.display = 'block';
    document.getElementById('user-login-form').style.display = 'none';
    document.getElementById('doctor-login-form').style.display = 'none';
}

function showUserLogin() {
    document.getElementById('user-login-form').style.display = 'block';
    document.getElementById('admin-login-form').style.display = 'none';
    document.getElementById('doctor-login-form').style.display = 'none';
}

function showDoctorLogin() {
    document.getElementById('doctor-login-form').style.display = 'block';
    document.getElementById('admin-login-form').style.display = 'none';
    document.getElementById('user-login-form').style.display = 'none';
}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Apollo Hospital</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#doctor-login" onclick="showDoctorLogin()">Doctor Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#user-login" onclick="showUserLogin()">Reception Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#admin-login" onclick="showAdminLogin()">Admin Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="hero-section">
		<h1>Welcome to Apollo Hospital</h1>
		<p>Providing compassionate care and world-class services</p>
		<a href="#services" class="btn btn-primary">Learn More</a>
	</div>

	<div id="admin-login-form" class="login-form">
		<h2>Admin Login</h2>
		<form id="adminLoginForm" action="admin" method="POST">
			<input type="text" name="adminUsername" id="adminUsername"
				placeholder="Username" required autocomplete="off"> <input
				type="password" name="adminPassword" id="adminPassword"
				placeholder="Password" required>
			<button type="submit">Login</button>
			<div id="adminErrorMessage" class="error-message"></div>
		</form>
	</div>

	<div id="user-login-form" class="login-form">
		<h2>Reception Login</h2>
		<form id="userLoginForm" action="UserLogin" method="POST">
			<input type="text" name="username" id="username"
				placeholder="Username" required autocomplete="off"> <input
				type="password" name="password" id="password" placeholder="Password"
				required>
			<button type="submit">Login</button>
			<div id="userErrorMessage" class="error-message"></div>
		</form>
	</div>

	<div id="doctor-login-form" class="login-form">
		<h2>Doctor Login</h2>
                <form id="DocterLoginForm" action="DocterLoginFromController" method="POST">
                    <input type="text" name="docusername" id="Docusername" placeholder="Docusername" required autocomplete="off"><br>
                    <input type="password" name="docpassword" id="Docpassword" placeholder="Docpassword" required><br>
                    <input type="submit" value="Login">
                    <div id="errorMessage" class="error-message"></div>  
                </form>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img src="Images/1st.jpg" class="card-img-top"
						alt="Dr Prachi Patil">
					<div class="card-body">
						<h5 class="card-title">Dr Prachi Patil</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img src="Images/hero.png" class="card-img-top"
						alt="Dr Pradeep Sangnode">
					<div class="card-body">
						<h5 class="card-title">Dr Pradeep Sangnode</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img src="Images/pradeep.png" class="card-img-top"
						alt="Dr Pankaj Zanwar">
					<div class="card-body">
						<h5 class="card-title">Dr Pankaj Zanwar</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img src="Images/2nd.jpg" class="card-img-top"
						alt="Dr Samiksha Kalyankar">
					<div class="card-body">
						<h5 class="card-title">Dr Samiksha Kalyankar</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>

		<div class="testimonials mt-5">
			<center>
				<h2>Patient Testimonials</h2>
			</center>
			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card testimonial-card">
						<div class="card-body">
							<h5 class="card-title">John Doe</h5>
							<p class="card-text">The doctors and staff are very
								professional and caring. Highly recommended!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card testimonial-card">
						<div class="card-body">
							<h5 class="card-title">Jane Smith</h5>
							<p class="card-text">I received excellent care during my
								stay. The facilities are top-notch.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4">
					<div class="card testimonial-card">
						<div class="card-body">
							<h5 class="card-title">Robert Brown</h5>
							<p class="card-text">A wonderful experience with highly
								skilled professionals. Thank you!</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="faq-section mt-5">
			<center>
				<h2>Frequently Asked Questions</h2>
			</center>
			<div class="accordion" id="faqAccordion">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">What
							are the visiting hours?</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
						<div class="accordion-body">Visiting hours are from 9:00 AM
							to 7:00 PM daily.</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">How
							can I book an appointment?</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
						<div class="accordion-body">You can book an appointment by
							calling our reception or through our website.</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">Do
							you accept insurance?</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
						<div class="accordion-body">Yes, we accept most major
							insurance plans. Please contact our billing department for more
							information.</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer mt-5">
		<p>&copy; 2024 Apollo Hospital. All Rights Reserved.</p>
	</footer>

	<script>
    <% if (request.getAttribute("errorMessage") != null) { %>
        var errorMessage = "<%= request.getAttribute("errorMessage") %>";
        if (document.getElementById('admin-login-form').style.display === 'block') {
            document.getElementById("adminErrorMessage").innerHTML = errorMessage;
        } else if (document.getElementById('user-login-form').style.display === 'block') {
            document.getElementById("userErrorMessage").innerHTML = errorMessage;
        } else if (document.getElementById('doctor-login-form').style.display === 'block') {
            document.getElementById("doctorErrorMessage").innerHTML = errorMessage;
        }
    <% } %>
	</script>
</body>
</html>
