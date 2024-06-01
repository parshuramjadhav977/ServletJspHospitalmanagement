<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.DocerModel.PrescriptionModel"%>
<%@ page import="org.hospital.service.PrescriptionService"%>
<%@ page import="org.hospital.service.PrescriptionServiceImpl"%>
<%@ page import="org.hospital.repository.PrescriptionRepositoryImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Allocated Prescriptions</title>
<style>
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

.col {
	background-size: 100% 100%;
	background-color: white;
	color: orange;
}
</style>
<!-- Include Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@include file="MainDocter.jsp"%>

	<div class="col py-3">
		<div class="container mt-5">
			<h2 class="mb-4">Allocated Prescriptions</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Prescription ID</th>
						<th>Prescription Details</th>
						<th>Patient Name</th>
						<th>Doctor Name</th>
						 <th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<% 
                //PrescriptionRepositoryImpl prescriptionRepository = new PrescriptionRepositoryImpl();
                PrescriptionService prescriptionService = new PrescriptionServiceImpl();
                List<PrescriptionModel> allocatedPrescriptions = prescriptionService.getAllPrescription();
                if (allocatedPrescriptions != null && !allocatedPrescriptions.isEmpty()) {
                    for (PrescriptionModel prescription : allocatedPrescriptions) {
            %>
					<tr>
						<td><%= prescription.getPrescriptionId() %></td>
						<td><%= prescription.getPrescriptionDetails() %></td>
						<td><%= prescription.getPtname()%></td>
						<td><%= prescription.getDocname()%></td>
						
						

						    <td>
        <a href='deletePrescription?Prescription_id=<%=prescription.getPrescriptionId()%>'>
            <img src="Images/delete.png" alt="Delete">
        </a>
    </td>

    
					</tr>
					<% 
                    }
                } else {
            %>
					<tr>
						<td colspan="4" class="text-center">No allocated
							prescriptions found</td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
