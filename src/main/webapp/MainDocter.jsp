<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
.my {
	height: auto;
	background-image: url("Images/chair.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-position: center;
	background-origin: content-box;
	width: 100%;
	margin: 0; 
	padding: 0; 
	overflow: hidden;
}
</style>
</head>
<body>
<div class="container-fluid my">
<div class="row">

<div class="row flex-nowrap">
<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-danger">
<div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
<a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
<img alt="" src="Images/hospitallogo.png" style="width: 100px; height: auto;">
</a>

<p id="datetime"></p>
<script>
function updateDateTime()
{
  var now = new Date();
  var datetimeElement = document.getElementById('datetime');
  datetimeElement.innerHTML = '' + now.toLocaleString();
 }

updateDateTime();

setInterval(updateDateTime, 1000);
</script>
        <h6>Welcome Docter Page</h6>


<ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
    <li class="nav-item">
        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline"><img src="Images/menu2.png" ></span>
        </a>
        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                                                        <li class="w-100"><a href=" ViewPatientfordocter.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-light">View Allpatient</span> </a></li>
        
                        <li class="w-100"><a href=" Prescription.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-light">Prescription Allocate</span> </a></li>
                                    <li class="w-100"><a href=" ViewPrescription.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-light">View Prescription</span> </a></li>
            

        </ul>
    </li>
<hr>
	<div class="dropdown pb-4">
            <a href="" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle " id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://static.vecteezy.com/system/resources/previews/000/569/503/original/sign-of-hospital-icon-vector.jpg" alt="Admin" width="30" height="30" class="rounded-circle me-2">
Doctor Login <%= session.getAttribute("docusername") %> </a>
<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
<li><a class="dropdown-item" href="#">Employee</a></li>
<li><a class="dropdown-item" href="#">Settings</a></li>
<li><a class="dropdown-item" href="#">Profile</a></li>
<li>
<hr class="dropdown-divider">
</li>
<li><a class="dropdown-item" href="new.jsp">Sign out</a></li>
</ul>
</div>
</div>
</div>

<script>
    $(document).ready(function(){
        $('.dropdown-toggle').dropdown();
    });
</script>
</body>
</html>
