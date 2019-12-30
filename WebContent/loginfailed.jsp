<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="net.airline.login.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Failed</title>
 
</head>
<body>


 <div align ="center">
 <font color ="red"><h1>Login Failed. Please check your username or password or Sign Up.</h1></font>
 
 <form action="<%=request.getContextPath()%>/login" method="post">
   <table style="with: 100%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>

   </table>
   <input type="submit" value="Log In" />
   
   <a href="customerregister.jsp"> Sign Up </a>
  </form>
</div>
</body>
</html>