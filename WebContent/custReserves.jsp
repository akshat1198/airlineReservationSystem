<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Info</title>
</head>
<body>
<div align = "center">
  <h1>Your Reservations</h1>

<p><a href="loginsuccess.jsp"> Search Flights </a></p>
   <p><a href="logout.jsp"> Log Out </a></p>
   

<table>
<tr align = "center" >
<td>ID</td>
 <td>First Name</td>
 	<td>Last Name</td>
    <td>Phone</td>
    <td>Email</td>
    <td>Depart Date</td>
    <td>Arrival Date</td>
    <td>Number of Passenger</td>
    <%
    String x = (String)(session.getAttribute("user"));

 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	  String st = "SELECT * FROM reservations";;
	  //String f = request.getParameter("f");
	  //String t = request.getParameter("t");
	  Statement stmt = connection.createStatement();
	  //if(f != null)
	  //{
		  //st = "SELECT * FROM flights WHERE depart like '%"+f+"%'";
		  
	  //}
	  
		  st = "SELECT * FROM reservations WHERE username like '%"+x+"%'";
	  
	  ResultSet rs = stmt.executeQuery(st);
	  while (rs.next()){
 %>
 <tr align = "center" >
    
    <td><%= rs.getString("conf_id")%></td>
    <td><%= rs.getString("first_name")%></td>
    <td><%= rs.getString("last_name")%></td>
    <td><%= rs.getString("phone")%></td>
    <td><%= rs.getString("email")%></td>
    <td><%= rs.getString("depart_date")%></td>
    <td><%= rs.getString("arrival_date")%></td>
    <td><%= rs.getString("numPass")%></td>
    <td><button type="button"  onclick='window.open("modify.jsp?conf_id=<%=rs.getString("conf_id")%>")'>Modify</button></td>
    <td><a href='delete.jsp?conf_id=<%=rs.getString("conf_id")%>'>Delete</a></td>
    
    
    
 </tr>

<%
}
 
%>

</table>

<%
 rs.close();
 stmt.close();
 connection.close();
 }
 catch(Exception e){
	 e.printStackTrace();
 }
 
 %>

</div>
</body>
</html>