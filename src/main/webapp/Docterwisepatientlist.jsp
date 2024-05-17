<%@page import="java.util.List"%>
<%@page import="org.hospital.service.*"%>
<%@page import="org.DocerModel.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Doctor and Patient Information</title>
    <style>
table {
    border-collapse: collapse;
    width: 100%;
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
<%@include file="Main.jsp"%>

<div class="col py-3">


	<%
Docterservice docterservice = new DocterserviceImpl(); 
PatientService patientService = new PatientServiceImpl();

    List<DocterModel> allDoctors = docterservice.getAllDocter();

    if (allDoctors != null && !allDoctors.isEmpty()) {
        for (DocterModel doctor : allDoctors) {
%>

	<h2>
		Doctor:
		<%= doctor.getName() %></h2>

	<%
            List<PatientModel> doctorPatients = patientService.getPatientsByDoctorId(doctor.getId());
            if (doctorPatients != null && !doctorPatients.isEmpty()) {
%>

	<table border="1">
		<tr>
			<th>Patient ID</th>
			<th>Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Contact</th>
			<th>Address</th>
			<th>OPD Date</th>
			<th>Doctor ID</th>
			<th>Fee</th>
			<th>Appointment Date</th>
			<th>Category</th>
		</tr>

		<%
                for (PatientModel patient : doctorPatients) {
    %>
		<tr>
			<td><%= patient.getPtid() %></td>
			<td><%= patient.getPtName() %></td>
			<td><%= patient.getAge() %></td>
			<td><%= patient.getGender() %></td>
			<td><%= patient.getContact() %></td>
			<td><%= patient.getAddress() %></td>
			<td><%= patient.getOpdDate() %></td>
			<td><%= patient.getDocid() %></td>
			<td><%= patient.getFess() %></td>
			<td><%= patient.getAppointmentDate() %></td>
			<td><%= patient.getCategory() %></td>
		</tr>
		<%
                }
    %>
	</table>

	<%
            } else {
                out.println("No patients assigned to this doctor.");
            }
%>

	<br>

	<%
        }
    } else {
        out.println("No doctors found.");
    }
%>
</div>
</div>

</body>
</html>
