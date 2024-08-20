package com.customer.crud1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusRouteController {
    private static String url = "jdbc:mysql://localhost:3306/bus_ticket_system"; // Update with your actual database URL
    private static String username = "root"; // Update with your database username
    private static String password = "200110904894@Vv"; // Update with your database password

    public static List<BusRoute> getAllBusRoutes() {
        List<BusRoute> busRoutes = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM bus_routes";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                BusRoute busRoute = new BusRoute(
                        resultSet.getInt("bus_id"),
                        resultSet.getInt("route_id")
                );
                busRoutes.add(busRoute);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return busRoutes;
    }
}
