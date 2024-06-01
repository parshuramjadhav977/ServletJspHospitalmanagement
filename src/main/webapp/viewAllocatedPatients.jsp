<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.DocerModel.AllocatePatientModel" %>
<%@ page import="org.hospital.service.AllocatePatientService" %>
<%@ page import="org.hospital.service.AllocatePatientServiceImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Allocated Patients</title>
    <style>
table {
    border-collapse: collapse;
    width: 50%;
    
    color: black;
    background-color: background-color: rgba(255, 255, 255, 0.5);
    }
    
    table th, table td {
    padding: 8px;
    text-align: left;
            border: 1px solid black;
    
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
        <h2 class="mb-4">Allocated Patients</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Patient ID</th>
                <th>Patient Name</th>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
            </tr>
            </thead>
            <tbody>
            <% 
            AllocatePatientService allocatePatientService = new AllocatePatientServiceImpl();
            List<AllocatePatientModel> allocatedPatients = allocatePatientService.getAllAllocatedPatients();
            if (allocatedPatients != null && !allocatedPatients.isEmpty()) {
                for (AllocatePatientModel patient : allocatedPatients) {
            %>

            <tr>
                <td><%= patient.getPtid() %></td>
                <td><%= patient.getPtName() %></td>
                <td><%= patient.getDocid() %></td>
                <td><%= patient.getDoctorName() %></td>
            </tr>
            <% 
                }
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center">No allocated patients found</td>
            </tr>
            <% } %>
            </tbody>
        </table>


    </div>
</div>

</body>
</html>
