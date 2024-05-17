<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    
}

.container {
    margin-top: 150px;
    background-color: rgba(255, 255, 255, 0.5);
    height: 300px;
    border-radius: 10px;
    border: 1px solid black;
    
    
    
}



input[type="text"],
input[type="password"] {
    width: 400px;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 10px;
}

input[type="submit"] {
    width: 400px;
    padding: 10px;
    margin-top: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 10px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.error-message {
    color: red;
    margin-top: 10px;
    
    
}
#login
{
width: fit-content;
}


</style>
</head>
<body>
    <%@ include file="Admindashbord.jsp" %>

    
    
    <div class="col py-12">
        <div class="container " id="login">
            <center>
                <h2>Login Here</h2>
                
                <form id="adminLoginForm" action="admin" method="POST">
                    <input type="text" name="adminUsername" id="adminUsername" placeholder="Username" required autocomplete="off"><br>
                    <input type="password" name="adminPassword" id="adminPassword" placeholder="Password" required><br>
                    <input type="submit" value="Login">
                    <div id="errorMessage" class="error-message"></div> 
                </form>
            </center>
        </div>
       
    
    </div>
           
   </div>
      
    </div>
        <div class="col py-12">
                <div class="row mt-5">
            <div class="row">
    <div class="col-md-3">
        <div class="card">
            <img src="Images/1st.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Dr Prachi Patil</h5>
                <p class="card-text">Experienced OB-GYN Specialists: Our team comprises board-certified OB-GYNs with years of experience in delivering personalized care for women's health needs, including pregnancy, childbirth, and gynecological issues.</p>
                <a href="#" class="btn btn-primary">About</a>
            </div>
        </div>
    </div>
    <!-- Repeat the same structure for other cards -->
    <div class="col-md-3">
        <div class="card">
            <img src="Images/pradeep.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Dr Pradeep Sangnode</h5>
                <p class="card-text">Experienced Orthopedic Specialists: Our team consists of highly skilled orthopedic doctors with years of experience in diagnosing and treating a wide range of toe conditions.</p>
                <a href="#" class="btn btn-primary">About</a>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <img src="Images/hero.png" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Dr Pankaj Zanwar</h5>
                <p class="card-text">Experienced Urology Specialists: Our team consists of highly skilled urologists with extensive experience in diagnosing and treating a wide range of urological conditions in both men and women.</p>
                <a href="#" class="btn btn-primary">About</a>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <img src="Images/2nd.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">Dr Samiksha Kalyankar</h5>
                <p class="card-text">Experienced Dental Professionals: Our team comprises skilled dentists and hygienists with extensive experience in delivering comprehensive dental care for patients of all ages.</p>
                <a href="#" class="btn btn-primary">About</a>
            </div>
        </div>
    </div>
</div>

                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col">
                <div class="card text-center">
                    <div class="card-header bg-danger">
                        <h1>Each day in the hospital is a step closer to a healthier and brighter tomorrow.</h1>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Apollo Hospital</h5>
                        <p class="card-text">Someone has been visiting Alex at the hospital almost every day.</p>
                        <p class="card-text">When Howie was released from the hospital, Rose took him in.</p>
                        <a href="#" class="btn btn-primary">About</a>
                    </div>
                    <div class="card-footer text-muted">
                        <h5>Healthy Habits, Happy Life</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        <% if(request.getAttribute("errorMessage") != null) { %>
            var errorMessage = "<%= request.getAttribute("errorMessage") %>";
            document.getElementById("errorMessage").innerHTML = "<p><%= request.getAttribute("errorMessage") %></p>";
        <% } %>
    </script>
    
</body>
</html>
