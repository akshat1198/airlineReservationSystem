<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.sql.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights</title>
</head>
<body>

<div align = "right">
<td><button type="button"  onclick='window.location.href="addflights-process.jsp"'>Add Flights</button></td>
<td><button type="button"  onclick='window.location.href="adminHome.jsp"'>Home</button></td>
<td><button type="button"  onclick='window.location.href="login"'>Log Out</button></td>


</div>

<table>
 <tr align = "center">
 <td>Flight Number</td>
 	<td>Depart</td>
    <td>Arrival</td>
    <td>Flight Type</td>
    <td>Cost</td>
    <td>Trip Options</td>
    <td>Number of Stops</td>
   
 </tr>
 
 
 <%
 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	  String st = "SELECT * FROM flights";;
	  Statement stmt = connection.createStatement();
	  	  
		  
	 
	  ResultSet rs = stmt.executeQuery(st);
	  while (rs.next()){
 %>
 <tr align = "center">
    <td><%= rs.getString("flightNum")%></td>
    <td><%= rs.getString("depart")%></td>
    <td><%= rs.getString("arrival")%></td>
    <td><%= rs.getString("flightType")%></td>
    <td><%= rs.getString("cost")%></td>
    <td><%= rs.getString("tripOption")%></td>
    <td><%= rs.getString("numStops")%></td>
    
 </tr>


<%
}
 


 rs.close();
 stmt.close();
 connection.close();
 }
 catch(Exception e){
	 e.printStackTrace();
 }
 
 %>

</table>

</body>
</html>