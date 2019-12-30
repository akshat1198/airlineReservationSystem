<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*,java.util.*"%>

<script type="text/javascript">
function validateForm() {
if (isEmpty(document.getElementById('data_2').value.trim())) {
alert('First name is required!');
return false;
}
if (isEmpty(document.getElementById('data_3').value.trim())) {
alert('Last name is required!');
return false;
}
if (isEmpty(document.getElementById('data_4').value.trim())) {
alert('Phone is required!');
return false;
}
if (isEmpty(document.getElementById('data_5').value.trim())) {
alert('Email is required!');
return false;
}
if (!validateEmail(document.getElementById('data_5').value.trim())) {
alert('Email must be a valid email address!');
return false;
}
if (isEmpty(document.getElementById('data_6').value.trim())) {
alert('Arrival date is required!');
return false;
}
if (isEmpty(document.getElementById('data_7').value.trim())) {
alert('Departure date is required!');
return false;
}
if (isEmpty(document.getElementById('data_8').value.trim())) {
alert('Number of passengers is required!');
return false;
}
return true;
}
function isEmpty(str) { return (str.length === 0 || !str.trim()); }
function validateEmail(email) {
var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,15}(?:\.[a-z]{2})?)$/i;
return isEmpty(email) || re.test(email);
}
</script>




 <%
 String flightId =request.getParameter("flightNum");


 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection connection = DriverManager.getConnection("jdbc:mysql://cs336database.cjkscrsiieac.us-east-2.rds.amazonaws.com:3306/airline","antmatos21", "!1Antmat");
	  String st = "SELECT * FROM flights WHERE flightNum = "+flightId;
	  
	  Statement stmt = connection.createStatement();

	  
		  
	  
	  ResultSet rs = stmt.executeQuery(st);
	  if (rs.next()){
 %>

<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Reservation</title>

<body>



<form method="post" action="confirmation.jsp" onSubmit="return validateForm();">
<div style="width: 400px;">
</div>
<div style="padding-bottom: 18px;font-size : 24px;">Flight Reservation</div>




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
 
  <tr align = "center">
    <td><%= rs.getString("flightNum")%></td>
    <td><%= rs.getString("depart")%></td>
    <td><%= rs.getString("arrival")%></td>
    <td><%= rs.getString("flightType")%></td>
    <td><%= rs.getString("cost")%></td>
    <td><%= rs.getString("tripOption")%></td>
    <td><%= rs.getString("numStops")%></td>
    </tr>
 
 </table>




<div style="display: flex; padding-bottom: 18px;width : 450px;">

<div style=" margin-left : 0; margin-right : 1%; width : 49%;">First name<span style="color: red;"> *</span><br/>
<input type="text" id="data_2" name="data_2" style="width: 100%;" class="form-control"/>
</div>
<div style=" margin-left : 1%; margin-right : 0; width : 49%;">Last name<span style="color: red;"> *</span><br/>
<input type="text" id="data_3" name="data_3" style="width: 100%;" class="form-control"/>
</div>
</div><div style="padding-bottom: 18px;">Phone<span style="color: red;"> *</span><br/>
<input type="text" id="data_4" name="data_4" style="width : 450px;" class="form-control"/>
</div>
<div style="padding-bottom: 18px;">Email<span style="color: red;"> *</span><br/>
<input type="text" id="data_5" name="data_5" style="width : 450px;" class="form-control"/>
</div>
<div style="padding-bottom: 18px;">Departure date<span style="color: red;"> *</span><br/>
<input type="text" id="data_6" name="data_6" style="width : 250px;" class="form-control"/>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.4.0/pikaday.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.4.0/css/pikaday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">new Pikaday({ field: document.getElementById('data_6') });</script>
<div style="padding-bottom: 18px;">Arrival date<span style="color: red;"> *</span><br/>
<input type="text" id="data_7" name="data_7" style="width : 250px;" class="form-control"/>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.4.0/pikaday.min.js" type="text/javascript"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.4.0/css/pikaday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">new Pikaday({ field: document.getElementById('data_7') });</script>
<div style="padding-bottom: 18px;">Number of passengers<span style="color: red;"> *</span><br/>
<input type="number" id="data_8" name="data_8" style="width : 250px;" class="form-control"/>
</div>

<div style="padding-bottom: 18px;"><input name="skip_Submit" value="Reserve" type="submit"/></div>

</form>
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

</body>
</html>