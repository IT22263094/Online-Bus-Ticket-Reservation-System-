package com.customer.crud1;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteController {
    private static String url = "jdbc:mysql://localhost:3306/bus_ticket_system"; // Update with your actual database URL
    private static String username = "root"; // Update with your database username
    private static String password = "200110904894@Vv"; // Update with your database password

    public static List<Route> getAllRoutes() {
        List<Route> routes = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM routes";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Route route = new Route(
                        resultSet.getInt("route_id"),
                        resultSet.getString("start_point"),
                        resultSet.getString("end_point"),
                        resultSet.getDouble("distance_km"),
                        resultSet.getInt("duration_minutes")
                );
                routes.add(route);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return routes;
    }
}
