<%@ page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.hospital.service.*"%>
<%@page import="org.DocerModel.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Doctor-wise Patient Count</title>
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
    

</style>
</head>
<body>
<%@include file="MainReceptionist.jsp"%>

<div class="col py-3">

	<%
PatientService patientService = new PatientServiceImpl();

    try {
        Map<String, Integer> doctorWisePatientCount = patientService.getDoctorWisePatientCount();
        if (!doctorWisePatientCount.isEmpty()) {
%>

	<h2>Doctor-wise Patient Count:</h2>

	<table border="1">
		<tr>
			<th>Doctor Name</th>
			<th>Patient Count</th>
		</tr>

		<%
            for (Map.Entry<String, Integer> entry : doctorWisePatientCount.entrySet()) {
    %>
		<tr>
			<td><%= entry.getKey() %></td>
			<td><%= entry.getValue() %></td>
		</tr>
		<%
            }
    %>
	</table>

	<%
        } else {
            out.println("No patients found for any doctor.");
        }
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>
</div></div>
</body>
</html>
