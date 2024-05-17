<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hospital.service.*, org.DocerModel.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Patients</title>
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
    width: 100%;
}

.search-bar {
    padding: 20px;
}

.search-input {
    width: 200px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.search-button {
    padding: 8px 16px;
    background-color: orange;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 10px;
}
</style>
</head>
<body>
    <%@include file="Main.jsp"%>

    <div class="col py-3">
<div class="search-bar">
            <form action="ViewPatient.jsp" method="GET">
			<input type="text" name="searchpatient" class="search-input" placeholder="Search Patient">
	                <button type="submit" class="search-button">Search</button>
            </form>
        </div>

        <h1>Patient Details</h1>
        <table class="table">
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
                    <th scope="col">Fess</th>
                    <th scope="col">Appointment Date</th>
                    <th scope="col">Category</th>
                    <th scope="col">Delete</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <%
    PatientService patientService = new PatientServiceImpl();
    List<PatientModel> list = null;
    try {
        list = patientService.getAllPatient();

        String search = request.getParameter("searchpatient");
        
        if (search != null && !search.isEmpty()) {
            list = patientService.searchPatient(search);
        }
    } catch (Exception e) {
        out.println("Error fetching patient list: " + e.getMessage());
    }
%>

<%-- Display the filtered list or a message if no result found --%>
<%
    if (list != null && !list.isEmpty()) {
        int count = 0;
        for (PatientModel patient : list) {
%>
<tr>
    <td><%=++count%></td>
    <td><%=patient.getPtid()%></td>
    <td><%=patient.getPtName()%></td>
    <td><%=patient.getAge()%></td>
    <td><%=patient.getGender()%></td>
    <td><%=patient.getContact()%></td>
    <td><%=patient.getAddress()%></td>
    <td><%=patient.getOpdDate()%></td>
    <td><%=patient.getDocid()%></td>
    <td><%=patient.getFess()%></td>
    <td><%=patient.getAppointmentDate()%></td>
    <td><%=patient.getCategory()%></td>

    <td>
        <a href='deletepatient?ptid=<%=patient.getPtid()%>'>
            <img src="Images/delete.png" alt="Delete">
        </a>
    </td>
    <td>
        <a href='updpatient?ptid=<%=patient.getPtid()%>&ptname=<%=patient.getPtName()%>&age=<%=patient.getAge()%>&gender=<%=patient.getGender()%>&contact=<%=patient.getContact()%>&address=<%=patient.getAddress()%>&opddate=<%=patient.getOpdDate()%>&did=<%=patient.getDid()%>&fess=<%=patient.getFess()%>&appoinmentdate=<%=patient.getAppointmentDate()%>&category=<%=patient.getCategory()%>'>
            <img src="Images/update.png" alt="Update">
        </a>
    </td>
</tr>
<%
        }
    } else {
%>
<tr>
    <td colspan="12">No patient records found.</td>
</tr>
<%
    }
%>

            </tbody>
        </table>
    </div>
</body>
</html>
