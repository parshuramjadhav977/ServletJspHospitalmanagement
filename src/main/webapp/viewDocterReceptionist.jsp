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
<script type ="text/javascript">

function SearchData(){
    var str = document.getElementById("m").value;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function(){
          if(this.readyState == 4 && this.status == 200){
              document.getElementById("d").innerHTML = this.responseText;
          }  
    };
    xhttp.open("GET", "SearchDocter.jsp?q=" + str, true);
    xhttp.send();
   }

</script>
</head>
<body>
    <%@include file="MainReceptionist.jsp"%>
    <div class=" col-md-9 mt-5">
                <input type="text" id="m" name="search" class="search-input" onkeyup="SearchData()"/>
        
        <h1>Doctor Details</h1>
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
                Docterservice docterservice = new DocterserviceImpl();
                List<DocterModel> doctorList=docterservice.getAllDocter();
              if(doctorList!=null)
              {
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
                <%
                }
                }
                %>
                
            </tbody>
        </table>
    </div>
    </div>
    </div>
</body>
</html>
