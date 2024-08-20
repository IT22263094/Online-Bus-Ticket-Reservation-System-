<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operators</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    .navbar {
            background-color: #f48906;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            margin-bottom:20px;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            list-style: none;
            padding: 0;
            display: flex;
        }

        .nav-links li {
            margin: 0 10px;
        }

        .nav-links a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

    h1 {
        text-align: center;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
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

    a {
        text-decoration: none;
        color: #333;
    }

    a:hover {
        text-decoration: underline;
    }

    #profileDetails {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 0 auto;
        text-align: center;
    }

    footer {
        text-align: center;
        background-color: #e85238;
        color: #fff;
        padding: 10px;
        position: relative;
        bottom: 0;
        width: 100%;
    }
    
    .tab1{
    	display:none;
    	align-item : center;
    	justify-content: center;
    	
    }
    
    .cus{
    	width:50%;
    }
    
    .cus th {
    	background-color: #f5bf42;
    }
    .bus{
    	width:50%;
    }
    
    .bus th {
    	background-color: #f5bf42;
    }
    
    #btndetails {
    	width: 220px;
    	height: 220px;
    	margin-left: 320px;
    	border-radius: 12px;
    	text-transform: uppercase;
    	background-color: #2ecc71; /* Green */
    }
    
    .mainprof{
    	width: 100%;
    	justify-content: space-evenly;
    	align-item: center;
    }
    
    .routetb th{
    }
</style>
</head>
<body>

<nav class="navbar">
    <div class="navbar-brand">
        <span>VnM tech inventors</span>
    </div>
    <ul class="nav-links">
        <li><a href="#">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</nav>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List" %>
 <%@ page import="java.sql.*" %>
<%@ page import="com.customer.crud1.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>

<div style="display: flex;" class="mainprof">
<button id="btndetails">User Details</button>
<div id="profileDetails">
    <h1>Admin Profile</h1>
    <p><strong>Name :</strong> Nimesh Kariyawasam</p>
    <p><strong>Email :</strong> nimma@gmail.com</p>
    <p><strong>Operator ID :</strong> 3</p>
</div>
</div>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.customer.crud1.Customer" %>
<%@ page import="com.customer.crud1.BusOperator" %>
<%@ page import="com.customer.crud1.Admin" %>
<%@ page import="com.customer.crud1.CustomerDAO" %> <!-- Import your DAO classes -->
<%@ page import="com.customer.crud1.BusOperatorDAO" %>
<%@ page import="com.customer.crud1.AdminDAO" %>

<%
    List<Customer> customers = CustomerDAO.getAllCustomers();
    List<BusOperator> operators = BusOperatorDAO.getAllOperators();
    List<Admin> admins = AdminDAO.getAllAdmins();
%>


<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var button = document.getElementById('btndetails');
    var tab1 = document.querySelector('.tab1');
    
    button.addEventListener('click', function() {
        if(tab1.style.display === 'none' || tab1.style.display === '') {
            tab1.style.display = 'flex';
        } else {
            tab1.style.display = 'none';
        }
    });
});

</script>
<div class="tab1">

<!-- Displaying Customer Details -->
<div id="customerDetails">
    <h1>Customer Details</h1>
    <table border="1" class="cus">
        <tr>
            <th>Customer ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Address</th>
        </tr>
        <% for (Customer customer : customers) { %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getFirstName() %></td>
                <td><%= customer.getLastName() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.getPhoneNumber() %></td>
                <td><%= customer.getAddress() %></td>
            </tr>
        <% } %>
    </table>
</div>

<!-- Displaying Bus Operator Details -->
<div id="operatorDetails">
    <h1>Bus Operator Details</h1>
    <table border="1" class="bus">
        <tr>
            <th>Operator ID</th>
            <th> Name</th>
            <th>Email</th>
        </tr>
        <% for (BusOperator operator : operators) { %>
            <tr>
                <td><%= operator.getOperatorId() %></td>
                <td><%= operator.getFirstName() %></td>
                <td><%= operator.getLastName() %></td>
            </tr>
        <% } %>
    </table>
</div>

<!-- Displaying Admin Details -->
<div id="adminDetails">
    
</div>
</div>
<!-- ************************ -->



<h1>Routes</h1>
<table border="1" class="routetb">
    <tr>
        <th>Route ID</th>
        <th>Start Point</th>
        <th>End Point</th>
        <th>Distance (km)</th>
        <th>Duration (minutes)</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/bus_ticket_system";
            String username = "root";
            String password = "200110904894@Vv";
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "SELECT * FROM routes";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("route_id") %></td>
            <td><%= rs.getString("start_point") %></td>
            <td><%= rs.getString("end_point") %></td>
            <td><%= rs.getDouble("distance_km") %></td>
            <td><%= rs.getInt("duration_minutes") %></td>
            <td><a href="editRoute.jsp?route_id=<%= rs.getInt("route_id") %>">Edit</a></td>
            <td><a href="deleteRoute?route_id=<%= rs.getInt("route_id") %>">Delete</a></td>
        </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close connections here (rs, stmt, conn)
        }
    %>
</table>


<h1>Bus Schedule</h1>

<table border="1" style= "margin-bottom:30px" class="routetb">
    <tr>
        <th>Bus Name</th>
        <th>Departure Time</th>
        <th>Arrival Time</th>
        <th>Start Point</th>
        <th>End Point</th>
        <th>Set New Schedule</th>
    </tr>

    <%
        Connection conn2 = null;
        Statement stmt2 = null;
        ResultSet rs2 = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/bus_ticket_system";
            String username = "root";
            String password = "200110904894@Vv";
            conn2 = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "SELECT * FROM buses";
            stmt2 = conn.createStatement();
            rs2 = stmt.executeQuery(sql);

            while (rs2.next()) {
    %>
        <tr>
            <td><%= rs2.getString("bus_name") %></td>
            <td><%= rs2.getTime("departure_time") %></td>
            <td><%= rs2.getTime("arrival_time") %></td>
            <td><%= rs2.getString("start_point") %></td>
            <td><%= rs2.getString("end_point") %></td>
            <td><a href="setNewSchedule.jsp?bus_id=<%= rs2.getInt("bus_id") %>">Set New Schedule</a></td>
        </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close connections here (rs, stmt, conn)
        }
    %>
</table>

<footer>
    <p>&copy; 2023 VnM tech inventors</p>
</footer>

</body>
</html>