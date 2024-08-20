<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order history</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
    }

    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #333;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    form {
        display: inline-block;
    }

    input[type="date"] {
        width: 140px;
        padding: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        padding: 5px 10px;
        cursor: pointer;
        background-color: #333;
        color: #fff;
        border: none;
    }

    input[type="submit"]:hover {
        background-color: #444;
    }
</style>

</head>
<body>

<h1>Booking History</h1>
<%@ page import="java.sql.*" %>


<%
    String email = request.getParameter("email");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String jdbcUrl = "jdbc:mysql://localhost:3306/bus_ticket_system";
        String username = "root";
        String password = "200110904894@Vv";
        conn = DriverManager.getConnection(jdbcUrl, username, password);

        String sql = "SELECT * FROM bookings WHERE email = '" + email + "'";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        if (rs.next()) {
%>

<table border="1">
    <tr>
        <th>Booking ID</th>
        <th>Customer Name</th>
        <th>Email</th>
        <th>Bus ID</th>
        <th>Departure Date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

<%
            do {
%>
    <tr>
        <td><%= rs.getInt("booking_id") %></td>
        <td><%= rs.getString("customer_name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getInt("bus_id") %></td>
        <td>
            <form action="edit" method="post">
                <input type="hidden" name="bookingId" value="<%= rs.getInt("booking_id") %>">
                <input type="date" name="newDate" value="<%= rs.getString("departure_date") %>">
                <input type="submit" value="Edit">
            </form>
        </td>
        <td>
            <form action="delete" method="post">
                <input type="hidden" name="bookingId" value="<%= rs.getInt("booking_id") %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
<%
            } while (rs.next());
%>
</table>

<%
        } else {
%>
    <p>No bookings found for <%= email %>.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>