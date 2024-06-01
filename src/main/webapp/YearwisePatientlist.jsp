<%@ page import="java.util.List" %>
<%@ page import="org.DocerModel.PatientModel" %>
<%@ page import="org.hospital.service.PatientService" %>
<%@ page import="org.hospital.service.PatientServiceImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Patients</title>
    <style>
        .search-bar {
            width: 30%;
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <%@include file="MainReceptionist.jsp"%>

        <div class="col py-3">
<div class="search-bar">
    <form action="YearwisePatientlist.jsp" method="GET" class="d-flex">
        <input type="number" name="searchYear" id="searchYear" class="form-control mr-2" placeholder="Enter Year (e.g., 2022)" min="1900" max="9999" value="<%= request.getParameter("searchYear") != null ? request.getParameter("searchYear") : "" %>">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>


            <div class="container mt-5">
                <h2 class="mb-4">Yearwise All Patients</h2>
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
                                <th>Doctor id</th>
                                <th>Fee</th>
                                <th>Appointment Date</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            try {
                                String searchYear = request.getParameter("searchYear");
                                if (searchYear != null && !searchYear.isEmpty()) {
                                    int year = Integer.parseInt(searchYear);
                                    
                                    PatientService patientService = new PatientServiceImpl();
                                    List<PatientModel> opdPatients = patientService.getPatientsByYear(year);
                                    if (opdPatients.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="11" class="text-center">No patients found for the selected year</td>
                            </tr>
                            <% 
                                    } else {
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
                                <td><%= patient.getDid() %></td>
                                <td><%= patient.getFess() %></td>
                                <td><%= patient.getAppointmentDate() %></td>
                                <td><%= patient.getCategory() %></td>
                            </tr>
                            <% 
                                        }
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="11" class="text-center">Please enter a year to view patients</td>
                            </tr>
                            <% 
                                }
                            } catch (Exception ex) {
                            %>
                            <tr>
                                <td colspan="11" class="text-center">An error occurred while retrieving patient data</td>
                            </tr>
                            <% 
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
x