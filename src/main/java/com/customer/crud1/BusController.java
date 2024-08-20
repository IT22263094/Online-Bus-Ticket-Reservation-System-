package com.customer.crud1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusController {
    private static String url = "jdbc:mysql://localhost:3306/bus_ticket_system"; // Update with your actual database URL
    private static String username = "root"; // Update with your database username
    private static String password = "200110904894@Vv"; // Update with your database password

    public static List<Bus> getAllBuses() {
        List<Bus> buses = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM buses";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Bus bus = new Bus(
                        resultSet.getInt("bus_id"),
                        resultSet.getString("bus_name"),
                        resultSet.getInt("capacity"),
                        resultSet.getString("bus_type"),
                        resultSet.getString("operator_name"),
                        resultSet.getTime("departure_time"),
                        resultSet.getTime("arrival_time"),
                        resultSet.getString("start_point"),
                        resultSet.getString("end_point"),
                        resultSet.getBigDecimal("fare")
                );
                buses.add(bus);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return buses;
    }
}
