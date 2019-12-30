<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>

<div align = "right">
<td><button type="button"  onclick='window.location.href="addflights-process.jsp"'>Add Flights</button></td>

<td><button type="button"  onclick='window.location.href="addflights.jsp"'>Flights</button></td>


</div>

 <div align="center">
  <h1>Welcome <%=session.getAttribute("user")%></h1>
   <p><a href="logout.jsp"> Log Out </a></p>
   

   <table>
<tr>
<td>ID</td>
 <td>First Name</td>
 	<td>Last Name</td>
    <td>Phone</td>
    <td>Email</td>
    <td>Depart Date</td>
    <td>Arrival Date</td>
    <td>Number of Passenger</td>
 </tr>
 

<%

try{
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	

	String st = "SELECT * FROM reservations;";
	 int result=0;

	 Statement stmt = conn.createStatement();

		  
		  ResultSet rs = stmt.executeQuery(st);
		  while (rs.next()){
			  %>
			  <tr>
			  
			  	 <td><%= rs.getString("conf_id")%></td>
			     <td><%= rs.getString("first_name")%></td>
			     <td><%= rs.getString("last_name")%></td>
			     <td><%= rs.getString("phone")%></td>
			     <td><%= rs.getString("email")%></td>
			     <td><%= rs.getString("depart_date")%></td>
			     <td><%= rs.getString("arrival_date")%></td>
			     <td><%= rs.getString("numPass")%></td>
			         <td><button type="button"  onclick='window.open("modify.jsp?conf_id=<%=rs.getString("conf_id")%>")'>Modify</button></td>
			         <%-- <td><button type="button"  onclick='window.open("cancel.jsp?conf_id = <%=rs.getString("conf_id")%>")'>Delete</button></td>--%>
			         <td><a href='cancel.jsp?conf_id=<%=rs.getString("conf_id")%>'>Delete</a></td>
			     
			  </tr>

			 <%
			 
			  
		  }
}catch(Exception e){
	 e.printStackTrace();
}



%>
 
 
 
 </table>
   </div>
</body>
</html>