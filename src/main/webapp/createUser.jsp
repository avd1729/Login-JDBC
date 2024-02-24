<%--
  Created by IntelliJ IDEA.
  User: Aravind
  Date: 24-02-2024
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // JDBC connection parameters
    String url = "jdbc:mysql://localhost:3306/mydatabase";
    String username = "your_username";
    String password = "your_password";

// Get user inputs from the form
    String uname = request.getParameter("username");
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    String phoneNumber = request.getParameter("phoneNumber");

    try {
        // Establish JDBC connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // Insert user data into database
        String sql = "INSERT INTO users (uname, email, pass, phone_number) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, uname);
        pstmt.setString(2, email);
        pstmt.setString(3, pass);
        pstmt.setString(4, phoneNumber);
        pstmt.executeUpdate();

        // Close JDBC resources
        pstmt.close();
        conn.close();

        // Redirect to welcome page after successful user creation
        response.sendRedirect("welcome.jsp");
    } catch(Exception e) {
        // Handle user creation failure
        System.out.println("User creation failed. Please try again.");
        e.printStackTrace();
    }
%>

