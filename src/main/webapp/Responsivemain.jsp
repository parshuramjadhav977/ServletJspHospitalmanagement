<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital Management System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
    body {
        background-color: #f8f9fa;
    }
    .navbar-brand {
        font-weight: bold;
    }
    .dropdown-toggle::after {
        display: none;
    }
    .dropdown-toggle:hover::after {
        display: inline-block;
    }
</style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Hospital Management System</a>
        <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle " id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="https://static.vecteezy.com/system/resources/previews/000/569/503/original/sign-of-hospital-icon-vector.jpg" alt="Admin" width="30" height="30" class="rounded-circle me-2">
User <%= session.getAttribute("username") %>            </a>
            
            
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                <li><a class="dropdown-item" href="#">Employee</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                    <img alt="" src="https://static.vecteezy.com/system/resources/previews/000/569/503/original/sign-of-hospital-icon-vector.jpg" style="width: 100px; height: auto;">
                </a>
                <p id="datetime"></p>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2 me-2"></i> <span class="ms-1 d-none d-sm-inline">Menu</span>
                        </a>
             <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
			<li class="w-100"><a href="AddDocter.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Add New Doctor</span> </a></li>
            <li class="w-100"><a href="viewDocter.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">View All Doctor</span></a></li>
            <li class="w-100"><a href="AddPatient.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">AddPatient</span></a></li>
            <li class="w-100"><a href="ViewPatient.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">ViewAll Patient</span></a></li>
            <li class="w-100"><a href="Ipdpatient.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Ipdpt</span></a></li>
            <li class="w-100"><a href="viewOpdpatient.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Viewopd</span></a></li>
            <li class="w-100"><a href="viewAllocatedPatients.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">AllocatedDoctorToPatient</span></a></li>
            <li class="w-100"><a href="Prescription.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">PrescriptionPatient</span></a></li>
            <li class="w-100"><a href="ViewPrescription.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">ViewPrescription</span></a></li>
            <li class="w-100"><a href="DateWiseAllPatient.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">patientsDatewise</span></a></li>
            <li class="w-100"><a href="viewPatientmonthwise.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Patients Monthwise</span></a></li>
            <li class="w-100"><a href="YearwisePatientlist.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Patients Yearwise</span></a></li>
            <li class="w-100"><a href="datebetween.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">Patients Between Date</span></a></li>
            <li class="w-100"><a href="Docterwisepatientlist.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">DoctorWise PatientList</span></a></li>
            <li class="w-100"><a href="DoctorWisePatientCount.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">DoctorWise PatientCount</span></a></li>
            <li class="w-100"><a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Maximum Patient OPD Section</span></a></li>
            <li class="w-100"><a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Maximum Patient IPD Section</span></a></li>
            <li class="w-100"><a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Patient History</span></a></li>
                                    </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    function updateDateTime() {
        var now = new Date();
        var datetimeElement = document.getElementById('datetime');
        datetimeElement.innerHTML = 'Current Time: ' + now.toLocaleString();
    }

    updateDateTime();

    setInterval(updateDateTime, 1000);
</script>
</body>
</html>
