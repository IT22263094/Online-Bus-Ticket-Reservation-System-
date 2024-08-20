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


public class BookingEditServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String newDate = request.getParameter("newDate");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String jdbcUrl = "jdbc:mysql://localhost:3306/bus_ticket_system";
            String username = "root";
            String password = "200110904894@Vv";
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "UPDATE bookings SET departure_date = ? WHERE booking_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newDate);
            stmt.setInt(2, bookingId);
            stmt.executeUpdate();

            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
