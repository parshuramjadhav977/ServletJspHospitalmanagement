<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
input
{
height: 40px;
width: 400px;
border-radius: 10px;
}
.col-md-4
{
border: 2px solid black;
height: 400px;
border-radius: 10px;
  background-color: rgba(255, 255, 255, 0.5);

}
button
{
height: 40px;
width: 400px;
border-radius: 10px;
}


</style>
</head>
<body>

<%@include file="Main.jsp"%>

    <div class="container " >
        <div class="row mt-5 ">
            <div class="col-md-4 offset-md-3 ">
				<h2 class="text-center mb-4">Add New User  </h2>
				<form  class="formarea" name="frm" action="user" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        
                    </div>
   
                    <center>
                        <button type="submit" class="btn btn-primary">Add User</button>

                         </center>
                    
                </form>
            </div>
        </div>
    </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
