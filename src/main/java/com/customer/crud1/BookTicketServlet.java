package com.customer.crud1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class BookTicketServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        int busId = Integer.parseInt(request.getParameter("busId"));
        String departureDate = request.getParameter("departureDate");
        
        try {
            String url = "jdbc:mysql://localhost:3306/bus_ticket_system?useSSL=true&requireSSL=true&verifyServerCertificate=false";
            Connection conn = DriverManager.getConnection(url, "root", "200110904894@Vv");

            String insertBookingSql = "INSERT INTO bookings (customer_name, email, bus_id, departure_date) VALUES (?, ?, ?, ?)";
            PreparedStatement insertBookingStmt = conn.prepareStatement(insertBookingSql);

            insertBookingStmt.setString(1, customerName);
            insertBookingStmt.setString(2, email);
            insertBookingStmt.setInt(3, busId);
            insertBookingStmt.setString(4, departureDate);

            int rowsAffected = insertBookingStmt.executeUpdate();

            conn.close();

            if (rowsAffected > 0) {
                String alertMessage = "Booking successful!";
                response.sendRedirect("index.jsp?alertMessage=" + alertMessage);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
