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
input[type="password"]
 {
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
input[type="number"]
{width: 400px;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 10px;

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
    <%@ include file="Main.jsp" %>

    
    
    <div class="col py-12">
        <div class="container " id="login">
            <center>
                <h2>Create DocterLogin</h2>
                
                <form id="adminLoginForm" action="docusername" method="POST">
                    <input type="text" name="docusername" id="docusername" placeholder="docusername" required autocomplete="off"><br>
                    <input type="password" name="docpassword" id="docpassword" placeholder="docpassword" required><br>
                     <input type="number" name="did" id="did" placeholder="Docter Id" required autocomplete="off"><br>
                    
                    <input type="submit" value="Create new DocterLogin">
                    <div id="errorMessage" class="error-message"></div> 
                </form>
                
            </center>
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
