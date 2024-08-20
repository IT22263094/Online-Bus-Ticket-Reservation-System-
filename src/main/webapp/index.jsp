<%@ page import="java.util.List" %>
<%@ page import="com.customer.crud1.BusController" %>
<%@ page import="com.customer.crud1.Bus" %>
<html>
<head>
    <title>Bus Details</title>
    
    <style>
    
    
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
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

        .profile-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            width: 35%;
            margin: 5px auto 20px auto;
            
        }

        .profile-details p {
            margin: 10px 0;
            font-size: 18px;
        }

        h1, th, td {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        .flexclass{
        	display: flex;
        	align-item: center;
        	justify-content: space-evenly;
        
        }
        
        .route {
        	width: 40%;
        }
        
        .nexttab{
        	width: 60%;
        }
        
        .seat {
        	width: 900px;
        }

        form input, button {
            padding: 10px;
            margin: 5px 0;
        }

        form input[type="date"] {
            width: 100%;
        }

        .view-history-btn {
        background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 10px auto 10px auto;
    }

    .view-history-btn:hover {
        background-color: #444;
    }
        
        
        .booking-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        margin: 0 auto;
    }

    .booking-form input[type="text"],
    .booking-form input[type="date"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .booking-form input[type="submit"] {
        background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .booking-form input[type="submit"]:hover {
        background-color: #444;
    }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: relative;
            width: 100%;
            bottom: 0;
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

<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.customer.crud1.Customer" %>
<%@ page import="com.customer.crud1.CuzDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>

<%
    String loginEmail = (String)session.getAttribute("loginEmail");
    List<Customer> customer = CuzDao.getCustomerByEmail(loginEmail);
    if (!customer.isEmpty()) {
        Customer cus = customer.get(0);
        System.out.println("Customer Data: " + cus.getFirstName() + ", " + cus.getEmail()); // Add this line for debugging
%>


<section id="profile-section">
    <h1>Profile Details</h1>
    
    <div class="profile-details">
        <p><strong>Name:</strong> <%= cus.getFirstName() %></p>
        <p><strong>Email:</strong> <%= cus.getEmail() %></p>
        <p><strong>Phone:</strong> <%= cus.getPhoneNumber() %></p>
        <p><strong>Address:</strong> <%= cus.getAddress() %></p>
    </div>
</section>

<%
    } else {
%>
    <div class="profile-details">
        <p><strong>Name:</strong> dunith wellalage </p>
        <p><strong>Email:</strong>  wella@gmail.com</p>
        <p><strong>Phone:</strong> 0743318215</p>
        <p><strong>Address:</strong> 123 Main badulla</p>
    </div>
<%
    }
%>




    <h1>Bus Details</h1>
    <table border="1">
        <tr>
            <th>Bus ID</th>
            <th>Name</th>
            <th>Capacity</th>
            <th>Type</th>
            <th>Operator</th>
            <th>Departure Time</th>
            <th>Arrival Time</th>
            <th>Start Point</th>
            <th>End Point</th>
            <th>Fare</th>
        </tr>
        <% List<Bus> buses = BusController.getAllBuses();
           for (Bus bus : buses) { %>
            <tr>
                <td><%= bus.getBus_id() %></td>
                <td><%= bus.getBus_name() %></td>
                <td><%= bus.getCapacity() %></td>
                <td><%= bus.getBus_type() %></td>
                <td><%= bus.getOperator_name() %></td>
                <td><%= bus.getDeparture_time() %></td>
                <td><%= bus.getArrival_time() %></td>
                <td><%= bus.getStart_point() %></td>
                <td><%= bus.getEnd_point() %></td>
                <td><%= bus.getFare() %></td>
            </tr>
        <% } %>
    </table>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.customer.crud1.RouteController" %>
<%@ page import="com.customer.crud1.Route" %>
<%@ page import="com.customer.crud1.BusRouteController" %>
<%@ page import="com.customer.crud1.BusRoute" %>

<%
   List<Route> routes = RouteController.getAllRoutes();
   List<BusRoute> busRoutes = BusRouteController.getAllBusRoutes();
%>

<div class="flexclass">

<div>
     <h1>Route Details</h1>
    <table border="1" class="route">
        <tr>
            <th>Route ID</th>
            <th>Start Point</th>
            <th>End Point</th>
            <th>Distance (km)</th>
            <th>Duration (minutes)</th>
        </tr>
        <% for (Route route : routes) { %>
            <tr>
                <td><%= route.getRoute_id() %></td>
                <td><%= route.getStart_point() %></td>
                <td><%= route.getEnd_point() %></td>
                <td><%= route.getDistance_km() %></td>
                <td><%= route.getDuration_minutes() %></td>
            </tr>
        <% } %>
    </table>
</div>

<div>
    <h1>Bus Routes</h1>
    <table border="1" class="nexttab">
        <tr>
            <th>Bus ID</th>
            <th>Route ID</th>
        </tr>
        <% for (BusRoute busRoute : busRoutes) { %>
            <tr>
                <td><%= busRoute.getBus_id() %></td>
                <td><%= busRoute.getRoute_id() %></td>
            </tr>
        <% } %>
    </table>
    
    </div>
 </div>   
    <%@ page import="com.customer.crud1.SeatController" %>
<%@ page import="com.customer.crud1.Seat" %>

<%
   List<Seat> seats = SeatController.getAllSeats();
%>
    
    
    
    
    <h1>Seat Details</h1>
    <table border="1" class="seat">
        <tr>
            <th>Seat ID</th>
            <th>Bus ID</th>
            <th>Total Seats</th>
            <th>Booked Seat Numbers</th>
            <th>Available Seat Numbers</th>
        </tr>
        <% for (Seat seat : seats) { %>
            <tr>
                <td><%= seat.getSeatId() %></td>
                <td><%= seat.getBusId() %></td>
                <td><%= seat.getTotalSeats() %></td>
                <td><%= seat.getBookedSeatNumbers() %></td>
                <td><%= seat.getAvailableSeatNumbers() %></td>
            </tr>
        <% } %>
    </table>
    
    
    <%@ page import="java.sql.*" %>
<%@ page import="com.customer.crud1.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String alertMessage = request.getParameter("alertMessage");
    if (alertMessage != null && !alertMessage.isEmpty()) {
        out.println("<script>alert('" + alertMessage + "');</script>");
        out.println("<script>window.location='index.jsp';</script>"); // Redirect after alert
    }
%>
    
<form action="book" method="post" class="booking-form">
    Customer Name: <input type="text" name="customerName"><br>
    Email: <input type="text" name="email"><br>
    Bus ID: <input type="text" name="busId"><br>
    Departure Date: <input type="date" name="departureDate"><br>
    <input type="submit" value="Book Ticket">
</form>

<script>
        function viewBookingHistory() {
            var email = prompt("Please enter your email:");
            if (email != null && email != "") {
                window.location.href = "bookingHistory.jsp?email=" + email;
            }
        }
        
        function navigate(section) {
            var sections = {
                'home': 'home-section',
                'profile': 'profile-section',
                'branches': 'branches-section'
            };
            var sectionId = sections[section];
            var element = document.getElementById(sectionId);
            if (element) {
                element.scrollIntoView();
            }
        }
    </script>

<button  class="view-history-btn" onclick="viewBookingHistory()">View Booking History</button>




<footer>
    <p>&copy; 2023 VnM tech inventors</p>
</footer>


    
</body>
</html>
