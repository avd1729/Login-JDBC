<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot PIN</title>
</head>
<body>

<%
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    String pin = null;

    // Perform input validation
    if (email == null || email.isEmpty() || phone == null || phone.isEmpty()) {
        out.println("Please provide both email and phone number.");
    } else {
        // Database connectivity
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "rootpass");

            // Query to fetch PIN using email or phone number
            String query = "SELECT pin FROM users WHERE email = ? OR phone = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, phone);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pin = rs.getString("pin");
            } else {
                out.println("No account found with provided email or phone number.");
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<% if (pin != null) { %>
<p>Your PIN is: <%= pin %></p>
<% } else { %>
<form method="post" action="forgotpin.jsp">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <label for="phone">Phone Number:</label>
    <input type="text" id="phone" name="phone" required><br>
    <input type="submit" value="Submit">
</form>
<% } %>

</body>
</html>
