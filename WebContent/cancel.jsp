<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
    
  
  
   <%--
// String id =request.getParameter("conf_id");


 //try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	  String st = "SELECT * FROM reservations WHERE conf_id = "+id;
	  
	  Statement stmt = connection.createStatement();

	  
		  
	  
	  ResultSet rs = stmt.executeQuery(st);

 

 rs.close();
 stmt.close();
 connection.close();
 }
 catch(Exception e){
	 e.printStackTrace();
 }
 
 --%>
 
   
<%
try{
	

Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
String ID =request.getParameter("conf_id");

Statement stmt = connection.createStatement();

//stmt.executeQuery("SELECT * FROM reservations WHERE conf_id = "+ID);
stmt.executeUpdate("DELETE FROM reservations WHERE conf_id= '"+ID+"'");
out.println("Record Deleted Successfully");

response.sendRedirect("adminHome.jsp");


connection.close();

}
catch(SQLException st){
	 request.setAttribute("error",st);
	 out.println(st);
}

%>