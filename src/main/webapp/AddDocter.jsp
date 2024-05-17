<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Doctor</title>
    <style>

        .container {
            background-color:rgba(255, 255, 255,0.5 );
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 30px;
            max-width: 600px; 
             height:auto;
            
        }
        h2 {
            color:#333; 
        }
        label {
            color: #333; 
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da; 
            border-radius: 10px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da; 
              border-radius: 10px;
            resize: none; 
        }
        button[type="submit"] {
            background-color: #007bff;
            border: none;
            color: #fff; /* White text */
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="Main.jsp" %>
       <div class="col-md-4	"></div>
       
        <div class="col-md-4 ">
<div class="container mb-3">
    <h2 class="text-center ">Add Doctor</h2>
    <form  class="formarea " name="frm" action="newdocter" method="post" style="padding:20px;">
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="docname" required pattern="[A-Za-z ]+" title="Please enter a valid name (only letters and spaces)">
        </div>
        <div class="mb-3">
            <label for="speciality" class="form-label">Speciality</label>
            <input type="text" class="form-control" id="speciality" name="speciality">
        </div>
        <div class="mb-3">
            <label for="designation" class="form-label">Designation</label>
            <input type="text" class="form-control" id="designation" name="designation">
        </div>
        <div class="mb-3">
            <label for="degree" class="form-label">Degree</label>
            <input type="text" class="form-control" id="degree" name="degree" required>
        </div>
        <div class="mb-3">
            <label for="contact" class="form-label">Contact</label>
            <input type="text" class="form-control" id="contact" name="contact" required pattern="[0-9]{10}" title="Please enter a 10-digit phone number">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3"></textarea>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        
        
    </form>
</div>

 </div>

           <div class="col-md-4	"></div>
    
</div>
</div>


</body>
</html>
