package com.customer.crud1;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdateScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("bus_id"));
        String departureTime = request.getParameter("departure_time");
        String arrivalTime = request.getParameter("arrival_time");
        String startPoint = request.getParameter("start_point");
        String endPoint = request.getParameter("end_point");

        try {
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket_system", "root", "200110904894@Vv");


            String sql = "UPDATE schedules SET departure_time = ?, arrival_time = ?, start_point = ?, end_point = ? WHERE bus_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, departureTime);
            stmt.setString(2, arrivalTime);
            stmt.setString(3, startPoint);
            stmt.setString(4, endPoint);
            stmt.setInt(5, busId);

            stmt.executeUpdate();

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("busOperator.jsp");
    }
}
