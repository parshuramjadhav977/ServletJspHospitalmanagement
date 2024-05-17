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
.search-bar
{
width:30%;
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
        <%@include file="Main.jsp"%>

        <div class="col py-3">
<div class="search-bar">
    <form action="viewPatientmonthwise.jsp" method="GET" class="d-flex">
        <input type="month" name="searchMonth" id="searchMonth" class="form-control mr-2" value="<%= request.getParameter("searchMonth") %>">
        <button type="submit" class="btn btn-primary btn-sm">Search</button>
    </form>
</div>


            <div class="container mt-5">
                <h2 class="mb-4">Monthwise All Patients</h2>
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
                                String searchMonth = request.getParameter("searchMonth");
                                if (searchMonth != null && !searchMonth.isEmpty()) {
                                    int year = Integer.parseInt(searchMonth.substring(0, 4));
                                    int month = Integer.parseInt(searchMonth.substring(5, 7));
                                    
                                    PatientService patientService = new PatientServiceImpl();
                                    List<PatientModel> opdPatients = patientService.getPatientsByMonth(year, month);
                                    if (opdPatients.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="11" class="text-center">No patients found for the selected month</td>
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
                                <td colspan="11" class="text-center">Please select a month to view patients</td>
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
