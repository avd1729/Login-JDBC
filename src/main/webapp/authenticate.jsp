<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 24-02-2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/db";
    String username = "root";
    String password = "rootpass";

// Get user inputs from the form
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");

    try {
        // Establish JDBC connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // Add authentication logic here (check if username/password is valid)

        // Close JDBC resources
        conn.close();

        // Redirect to welcome page if authentication is successful
        response.sendRedirect("welcome.jsp");
    } catch (Exception e) {
        // Handle authentication failure
        System.out.println("Authentication failed. Please check your username and password.");
        e.printStackTrace();
    }
%>

