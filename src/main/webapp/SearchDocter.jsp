<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.hospital.service.*"%>
<%@page import="org.DocerModel.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String search =request.getParameter("q");
Docterservice docterservice = new DocterserviceImpl();

%>
<table id="d" class="table">
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
                    <th scope="col">Delete</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
                <%-- Retrieve doctor list and iterate --%>
                <% 
                List<DocterModel> doctorList = docterservice.searchDoctors(search);
              
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
                    <td><a href='del?did=<%=doctor.getId()%>'><img src="Images/delete.png" alt="33"></a></td>
<td><a href='upddocter?did=<%=doctor.getId()%>&docname=<%=doctor.getName()%>&speciality=<%=doctor.getSpeciality()%>&designation=<%=doctor.getDesigination()%>&degree=<%=doctor.getDgree()%>&contact=<%=doctor.getContact()%>&address=<%=doctor.getAddress()%>'><img src="Images/update.png" alt="33"></a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
