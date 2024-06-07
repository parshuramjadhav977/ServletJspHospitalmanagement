<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hospital.service.*, org.DocerModel.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String search =request.getParameter("q");
PatientService patientService = new PatientServiceImpl();
%>

<table id="d">
<thead>
    <tr>
        <th scope="col">Sr no</th>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
        <th scope="col">Gender</th>
        <th scope="col">Contact</th>
        <th scope="col">Address</th>
        <th scope="col">OPD Date</th>
        <th scope="col">Doctor ID</th>
        <th scope="col">Fees</th>
        <th scope="col">Appointment Date</th>
        <th scope="col">Category</th>
        <th scope="col">Delete</th>
        <th scope="col">Update</th>
    </tr>
</thead>
<tbody >
    <%
    
        List<PatientModel> list = patientService.searchPatient(search);
    int count = 0;

            for (PatientModel patient : list) {
    %>
    <tr>
        <td><%= ++count %></td>
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
        <td><a href='deletepatient?ptid=<%= patient.getPtid() %>'> <img src="Images/delete.png" alt="Delete"></a></td>
        <td><a href='updpatient?ptid=<%= patient.getPtid() %>&ptname=<%= patient.getPtName() %>&age=<%= patient.getAge() %>&gender=<%= patient.getGender() %>&contact=<%= patient.getContact() %>&address=<%= patient.getAddress() %>&opddate=<%= patient.getOpdDate() %>&did=<%= patient.getDid() %>&fess=<%= patient.getFess() %>&appoinmentdate=<%= patient.getAppointmentDate() %>&category=<%= patient.getCategory() %>'> <img src="Images/update.png" alt="Update"></a></td>
    </tr>

    
    <%
       
            }
            
    %>
</tbody>
</table>
</div>
</body>
</html>