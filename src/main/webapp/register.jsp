<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
<h2>Register</h2>
<form action="createUser.jsp" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email"><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password"><br>
    <label for="phoneNumber">Phone Number:</label><br>
    <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{10}"><br>
    <input type="submit" value="Register">
</form>
</body>
</html>

