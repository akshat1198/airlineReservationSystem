<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="net.airline.login.dao.*"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Success</title>

</head>


<body>
 <div align="center">
 
  <h1>Welcome <%=session.getAttribute("user")%></h1>
   <p><a href="logout.jsp"> Log Out </a></p>
<p><a href="custReserves.jsp"> View Account </a></p>
   <p>Please choose your departing location and press ENTER</p>
 </div>
 <div align ="right">
   <button onclick = "window.location.href='adminHome.jsp';">Ask a Representative</button>

</div>
 <div align = "center">
 
 <div align="center">
<form method="get">
 <input type="text" id="From" placeholder="Departing From..." name="f" >
</form>

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
    <td>Booking</td>
 </tr>
 
 
 <%
 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	  String st = "SELECT * FROM flights";;
	  String f = request.getParameter("f");
	  Statement stmt = connection.createStatement();
	  if(f != null)
	  {
		  st = "SELECT * FROM flights WHERE depart like '%"+f+"%'";
		  
	  }
	  else{
		  st = "SELECT * FROM flights";
	  }
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
    <%-- <td><a href="reservation.jsp"> Book Flight </a></td>--%>
    <td><button type="button"  onclick='window.open("reservation.jsp?flightNum=<%=rs.getString("flightNum")%>")'>Book Flight</button></td>
    
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
 </div>
</body>
</html>


