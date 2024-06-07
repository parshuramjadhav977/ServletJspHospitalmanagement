<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
 Connection conn;
 PreparedStatement stmt;
 ResultSet rs;
%>
<%
 String name=request.getParameter("n");
 Class.forName("com.mysql.cj.jdbc.Driver");
 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital2", "root","root");
 if(conn!=null){
	stmt=conn.prepareStatement("select *from doctor where name like '%"+name+"%'");
	rs=stmt.executeQuery();
	out.println("<table border='5' align='center' width='50%'>");
	out.println("<tr><th>Employee Code</th><th>NAME</th><th>Contact</th><th>Salary</th></tr>");
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getInt(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getInt(4)+"</td>");
		
		out.println("</tr>");
	}
	out.println("</table>");
 }
 else{
	 out.println("Database is not connected");
 }
%>
</body>
</html>

