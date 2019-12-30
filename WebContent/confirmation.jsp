<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*,java.util.*"%>
     <%@page import="net.airline.login.dao.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
</head>
<body>

<div align = "center">
  <h1>Reservation successful</h1>

<p><a href="custReserves.jsp"> View Account </a></p>
<p><a href="loginsuccess.jsp"> Search Flights </a></p>
   <p><a href="logout.jsp"> Log Out </a></p>



<table>
<tr align = "center">
 <td>First Name</td>
 	<td>Last Name</td>
    <td>Phone</td>
    <td>Email</td>
    <td>Depart Date</td>
    <td>Arrival Date</td>
    <td>Number of Passenger</td>
 </tr>

 <%
 

 String first_name=request.getParameter("data_2");
 String last_name=request.getParameter("data_3");
 String phone=request.getParameter("data_4");
 String email=request.getParameter("data_5");
 String depart_date=request.getParameter("data_6");
 String arrival_date=request.getParameter("data_7");
 String numPass=request.getParameter("data_8");
 
 Connection conn = null;
 PreparedStatement p = null;
 
String u = (String)(session.getAttribute("user"));
String queryString = "INSERT INTO airline.reservations" +
        "  (conf_id,first_name,last_name,phone, email,depart_date,arrival_date,numPass,username) VALUES " +
        " (?, ?, ?, ?, ?,?,?,?,'"+u+"');";
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 conn = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
 int result=0;
 String st = "SELECT * FROM reservations";;

 
 p = conn.prepareStatement(queryString);
 p.setString(1, null);
 p.setString(2, first_name);
 p.setString(3, last_name);
 p.setString(4, phone);
 p.setString(5, email);
 p.setString(6, depart_date);
 p.setString(7, arrival_date);
 p.setString(8, numPass);
 
 System.out.println(p);

 result = p.executeUpdate();
 out.println("Your flight is booked!");

 }
 catch(Exception e)
 {
 System.out.print(e);
 e.printStackTrace();
 }
 
 %>
 
 <%
 
 try{
 String st = "SELECT * FROM reservations WHERE username like '%"+u+"%' and conf_id = (select max(conf_id) from reservations);";

 Statement stmt = conn.createStatement();

	  
	  ResultSet rs = stmt.executeQuery(st);
	  while (rs.next()){
 %>
 <tr align = "center">
    <td><%= rs.getString("first_name")%></td>
    <td><%= rs.getString("last_name")%></td>
    <td><%= rs.getString("phone")%></td>
    <td><%= rs.getString("email")%></td>
    <td><%= rs.getString("depart_date")%></td>
    <td><%= rs.getString("arrival_date")%></td>
    <td><%= rs.getString("numPass")%></td>
    
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