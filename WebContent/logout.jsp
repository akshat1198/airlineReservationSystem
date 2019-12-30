<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
session.invalidate();
//session.removeAttribute("username");
response.sendRedirect("login.jsp");
%>
</body>
</html>