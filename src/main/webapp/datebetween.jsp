<%@ page import="java.util.List" %>
<%@ page import="org.DocerModel.PatientModel" %>
<%@ page import="org.hospital.service.PatientService" %>
<%@ page import="org.hospital.service.PatientServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patients Between Dates</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: red;
        }
        .form-group
        {
        width: 200px;
        }
        table {
    border-collapse: collapse;
    width: 50%;
    color: black;
    background-color: lime;
    }
    
    table th, table td {
    border: 1px solid red;
    padding: 8px;
    text-align: left;
}
    </style>
</head>
<body>

        
     <%@include file="MainReceptionist.jsp"%>

<div class="col py-3">   
    <div class="container">
        <h2 class="mt-5 mb-4">Retrieve Patients Between Dates</h2>
        <form action="betweendate" method="post" class="mb-4">
            <div class="form-group">
                <label for="startDate">Start Date:</label>
                <input type="date" name="startDate" id="startDate" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="endDate">End Date:</label>
                <input type="date" name="endDate" id="endDate" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Retrieve Patients</button>
        </form>

        <%-- Display error message if date format is invalid --%>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="error"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <% if (request.getAttribute("patients") != null) { %>
            <h3>Patients Between Selected Dates:</h3>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Patient ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th>OPD Date</th>
                            <th>Doctor ID</th>
                            <th>Fees</th>
                            <th>Appointment Date</th>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<PatientModel> patients = (List<PatientModel>) request.getAttribute("patients");
                        for (PatientModel patient : patients) { %>
                            <tr>
                                <td><%= patient.getPtid() %></td>
                                <td><%= patient.getPtName() %></td>
                                <td><%= patient.getAge() %></td>
                                <td><%= patient.getGender() %></td>
                                <td><%= patient.getContact() %></td>
                                <td><%= patient.getAddress() %></td>
                                <td><%= patient.getOpdDate() %></td>
                                <td><%= patient.getDid() %></td>
                                <td><%= patient.getFess() %></td>
                                <td><%= patient.getAppointmentDate() %></td>
                                <td><%= patient.getCategory() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </div>
        </div>
        </div>
            </div>
    
</body>
</html>
