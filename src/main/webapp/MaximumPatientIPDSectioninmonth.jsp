<%@ page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.hospital.service.*"%>
<%@page import="org.DocerModel.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Patient MaximumPatientIPDSection Count</title>
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
        Map<String, Map<String, Integer>> maxPatientIPDSection = patientService.getMaximumPatientIPDSection();
        if (!maxPatientIPDSection.isEmpty()) {
%>
    <h2>Maximum Patient IPD Section Count:</h2>
    <table border="1">
        <tr>
            <th>Month</th>
            <th>Year</th>
            <th>Patient Count</th>
        </tr>
        <%
            for (Map.Entry<String, Map<String, Integer>> entry : maxPatientIPDSection.entrySet()) {
                String month = entry.getKey();
                Map<String, Integer> details = entry.getValue();
                Integer year = details.get("year");
                Integer patientCount = details.get("patientCount");
        %>
        <tr>
            <td><%= month %></td>
            <td><%= year %></td>
            <td><%= patientCount %></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
            out.println("No patients found");
        }
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>
</div>
</body>
</html>
