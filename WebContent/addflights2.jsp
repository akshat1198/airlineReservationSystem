<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="java.sql.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adding Flights</title>
</head>
<body>

<div align = "center">
  <h1>Flight Addition successful</h1>


   <p><a href="login.jsp"> Log Out </a></p>
   <p><a href="addflights.jsp"> Home </a></p>



<table>
<tr>
 <td>Flight Number</td>
 	<td>Depart</td>
    <td>Arrival</td>
    <td>Flight Type</td>
    <td>Cost</td>
    <td>Trip Options</td>
    <td>Number of Stops</td>
 </tr>

 <%
 

 String flightType=request.getParameter("data_3");
 String tripOption=request.getParameter("data_4");
 String cost=request.getParameter("data_5");
 String depart=request.getParameter("data_6");
 String arrival=request.getParameter("data_7");
 String numStops=request.getParameter("data_8");
 
 Connection conn = null;
 PreparedStatement p = null;
 

String queryString = "INSERT INTO airline.flights" +
        "  (flightNum,depart,arrival,flightType, cost,tripOption,numStops) VALUES " +
        " (?, ?, ?, ?, ?,?,?);";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 conn = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
 int result=0;
 String st = "SELECT * FROM flights";;

 
 p = conn.prepareStatement(queryString);
 p.setString(1, null);
 p.setString(2, depart);
 p.setString(3, arrival);
 p.setString(4, flightType);
 p.setString(5, cost);
 p.setString(6, tripOption);
 p.setString(7, numStops);

 
 System.out.println(p);

 result = p.executeUpdate();
 out.println("A flight has been added!");

 }
 catch(Exception e)
 {
 System.out.print(e);
 e.printStackTrace();
 }
 
 %>
 
 <%
 
 try{
 String st = "SELECT * FROM flights WHERE flightNum = (select max(flightNum) from flights);";

 Statement stmt = conn.createStatement();

	  
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
 conn.close();
 }
 catch(Exception e){
	 e.printStackTrace();
 }
 
 %>

</table>


 </div>



</body>
</html>