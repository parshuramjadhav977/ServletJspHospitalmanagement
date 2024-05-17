<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Data Form</title>
<link
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<style>
    body {
        height: auto;
    }

    .form-container {
        background-color: rgba(255, 255, 255, 0.5);
        padding: 20px; /* adjust padding */
        border-radius: 10px;
        margin-top:40px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-height: 800px;
        width: 500px;
        overflow: auto;
        scrollbar-width: none;
    }
</style>
</head>
<body>
<%@ include file="Main.jsp" %>
<div class="col-md-3"></div>
<div class="col-md-6">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="form-container">
                        <center><h1 class="mt-4">Patient Data Form</h1></center>
                    
                    
                        <div id="successMessage" style="display: none;" class="alert alert-success" role="alert">
                        		Patient added successfully.
                    			</div>

                    
                    <form action="newpatient" method="post" name="patientForm">
                        <div class="form-group">
                            <label for="ptName">Patient Name:</label> <input type="text"
                                class="form-control" id="ptName" name="ptName"
                                pattern="[A-Za-z ]+" required> <small
                                class="form-text text-muted">Only alphabets and spaces
                                are allowed.</small>
                        </div>







		
                        <div class="form-group">
                            <label for="age">Age:</label> <input type="number"
                                class="form-control" id="age" name="age" min="0" required>
                        </div>

                        <div class="form-group">
                            <label for="gender">Gender:</label> <select class="form-control"
                                id="gender" name="gender">
                                <option value="MALE">Male</option>
                                <option value="FEMALE">Female</option>
                                <option value="OTHER">Other</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="contact">Contact Number:</label> <input type="tel"
                                class="form-control" id="contact" name="contact"
                                pattern="[0-9]{10}" required>
                        </div>

                        <div class="form-group">
                            <label for="address">Address:</label>
                            <textarea class="form-control" id="address" name="address"
                                rows="4" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="opddate">OPD Date:</label>
                             <input type="date" class="form-control" id="opddate" name="opdDate" required>
                        </div>

                        <div class="form-group">
                            <label for="docid">Doctor ID:</label> <input type="number"
                                class="form-control" id="docid" name="did" min="1" required>
                        </div>

                        <div class="form-group">
                            <label for="fess">Consultation Fee:</label> <input type="number"
                                class="form-control" id="fess" name="fees" step="0.01" min="0"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="appointmentDate">Appointment Date:</label> 
                            <input type="date" class="form-control" id="appointmentDate"name="appointmentDate" required>
                            
                            
                            
                        </div>

                        <div class="form-group">
                            <label for="category">Category:</label> <select
                                class="form-control" id="category" name="category" required>
                                <option value="">Select Category</option>
                                <option value="OPD">OPD</option>
                                <option value="IPD">IPD</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById("patientForm").addEventListener("submit", function(event) {
            var category = document.getElementById("category").value;
            if (category === "") {
                alert("Please select a category.");
                event.preventDefault();
            }
        });
        
        $(document).ready(function() {
            var successMessage = $("#successMessage");
            successMessage.show();
            setTimeout(function() {
                successMessage.hide();
            }, 5000); // Hide after 5 seconds
            setTimeout(function() {
                window.location.href = "PatientDataForm.jsp"; // Redirect back to form
            }, 5000); // Redirect after 5 seconds
        });

    </script>
</body>
</html>
