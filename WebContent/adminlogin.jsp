<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>

 <div align="center">
  <h1>Log In To Your Account</h1>
  <form action="<%=request.getContextPath()%>/adminlogin" method="post">
   <table style="with: 100%">
    <tr>
     <td>Admin UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Admin Password</td>
     <td><input type="password" name="password" /></td>
    </tr>

   </table>
   <input type="submit" value="Log In" />
   
  </form>
 </div>
</body>
</html>