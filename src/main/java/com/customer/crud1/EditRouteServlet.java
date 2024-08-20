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

/**
 * Servlet implementation class EditRouteServlet
 */

public class EditRouteServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int routeId = Integer.parseInt(request.getParameter("route_id"));
        int newDuration = Integer.parseInt(request.getParameter("new_duration"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcUrl = "jdbc:mysql://localhost:3306/bus_ticket_system";
            String username = "root";
            String password = "200110904894@Vv";
            conn = DriverManager.getConnection(jdbcUrl, username, password);

            String sql = "UPDATE routes SET duration_minutes = ? WHERE route_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, newDuration);
            stmt.setInt(2, routeId);
            stmt.executeUpdate();

            response.sendRedirect("busOperator.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close connections here (stmt, conn)
        }
    }
}

