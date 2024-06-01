<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.hospital.service.*"%>
<%@page import="org.DocerModel.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Details</title>
<style>
table {
    border-collapse: collapse;
    width: 50%;
    color: black;
        background-color: rgba(255, 255, 255, 0.5);
    }
    
    table th, table td {
    border: 1px solid green;
    padding: 8px;
    text-align: left;
}

.col {
    background-size: 100% 100%;
    background-color:white;
    color: orange;
}

.search-bar {
    padding: 20px;
}

.search-input {
    width: 200px; /* Adjust the width as needed */
    padding: 8px;
    border: 1px solid #ccc; /* Change this to the desired border color */
    border-radius: 5px;
}

.search-button {
    padding: 8px 16px;
    background-color: orange; /* Change this to the desired button color */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-left: 10px; /* Adjust the margin as needed */
}
</style>
</head>
<body>
    <%-- Include Main.jsp for common header/footer --%>
    <%@include file="MainReceptionist.jsp"%>
    
    <div class="col py-3">
        <div class="search-bar">
            <form action="viewDocter.jsp" method="GET">
                <input type="text" name="search" class="search-input" placeholder="Search doctor...">
                <button type="submit" class="search-button">Search</button>
            </form>
        </div>
        
        <h1>Doctor Details</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Sr no</th>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Specialty</th>
                    <th scope="col">Designation</th>
                    <th scope="col">Degree</th>
                    <th scope="col">Contact</th>
                    <th scope="col">Address</th>
                </tr>
            </thead>
            <tbody>
                <%-- Retrieve doctor list and iterate --%>
                <% 
                Docterservice docterservice = new DocterserviceImpl();
                List<DocterModel> doctorList;
                String search = request.getParameter("search");
                if (search != null && !search.isEmpty()) {
                    doctorList = docterservice.searchDoctors(search);
                } else {
                    doctorList = docterservice.getAllDocter();
                }
                int count = 0;
                for(DocterModel doctor : doctorList) { 
                %>
                <tr>
                    <td scope="row"><%=++count%></td>
                    <td><%=doctor.getId()%></td>
                    <td><%=doctor.getName()%></td>
                    <td><%=doctor.getSpeciality()%></td>
                    <td><%=doctor.getDesigination()%></td>
                    <td><%=doctor.getDgree()%></td>
                    <td><%=doctor.getContact()%></td>
                    <td><%=doctor.getAddress()%></td>
 </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
