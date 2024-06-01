<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.DocerModel.PatientModel" %>
<%@ page import="org.hospital.service.PatientService" %>
<%@ page import="org.hospital.service.PatientServiceImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital Patients</title>
    <style>
        .table {
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

        .col {
            background-size: 100% 100%;
            background-color: white;
            color: orange;
        }
    </style>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="MainReceptionist.jsp"%>

<div class="col py-3">
    <div class="container mt-5">
        <h2 class="mb-4">OPD Patients</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Patient ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Contact</th>
                <th>Address</th>
                <th>OPD Date</th>
                <th>Doctor Name</th>
                <th>Fee</th>
                <th>Appointment Date</th>
                <th>Category</th>
            </tr>
            </thead>
            <tbody>
            <% 
            PatientService patientService = new PatientServiceImpl();
            List<PatientModel> opdPatients = patientService.getOPDPatients();
            if (opdPatients != null && !opdPatients.isEmpty()) {
                for (PatientModel patient : opdPatients) {
            %>

            <tr>
                <td><%= patient.getPtid() %></td>
                <td><%= patient.getPtName() %></td>
                <td><%= patient.getAge() %></td>
                <td><%= patient.getGender() %></td>
                <td><%= patient.getContact() %></td>
                <td><%= patient.getAddress() %></td>
                <td><%= patient.getOpdDate() %></td>
                <td><%= patient.getDocname() %></td>
                <td><%= patient.getFess() %></td>
                <td><%= patient.getAppointmentDate() %></td>
                <td><%= patient.getCategory() %></td>
            </tr>
            <% 
                }
            } else {
            %>
            <tr>
                <td colspan="11" class="text-center">No OPD patients found</td>
            </tr>
            <% } %>
            </tbody>
        </table>


    </div>
</div>

</body>
</html>
