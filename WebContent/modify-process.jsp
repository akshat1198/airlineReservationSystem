<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*,java.util.*" %>
    
<%






	


try{
	


Class.forName("com.mysql.jdbc.Driver");

Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");

String ID =request.getParameter("conf_id");
String first_name=request.getParameter("data_2");
String last_name=request.getParameter("data_3");
String phone=request.getParameter("data_4");
String email=request.getParameter("data_5");
String depart_date=request.getParameter("data_6");
String arrival_date=request.getParameter("data_7");
String numPass=request.getParameter("data_8");

String st = "UPDATE reservations set first_name='"+first_name+"',last_name='"+last_name+"',phone='"+phone+"',email='"+email+"',depart_date='"+depart_date+"',arrival_date='"+arrival_date+"',numPass='"+numPass+"' WHERE conf_id ='"+ID+"'";

//String st = "UPDATE reservations set first_name='"+first_name+"',last_name='"+last_name+"',phone='"+phone+"',email='"+email+"',depart_date='"+depart_date+"',arrival_date='"+arrival_date+"',numPass='"+numPass+"'WHERE conf_id ='"+conf_id+"'";
//String st = "UPDATE reservations set conf_id='"+conf_id+"', first_name='"+first_name+"',last_name='"+last_name+"',phone='"+phone+"',email='"+email+"',depart_date='"+depart_date+"',arrival_date='"+arrival_date+"',numPass='"+numPass+"'WHERE conf_id ='"+conf_id+"'";
//PreparedStatement p = connection.prepareStatement(st);

Statement stmt = connection.createStatement();

stmt.executeUpdate(st);
out.println("Record Updated Successfully");



connection.close();
}

catch(SQLException st){
	 request.setAttribute("error",st);
	 out.println(st);
}

%>