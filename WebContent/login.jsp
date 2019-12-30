<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<div align ="right">
   <button onclick = "window.location.href='adminlogin.jsp';">Admin Log In</button>

</div>
 <div align="center">
  <h1>Log In To Your Account</h1>
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