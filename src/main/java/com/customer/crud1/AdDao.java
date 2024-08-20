package com.customer.crud1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdDao {

    // This method retrieves a list of customers by email
    public static List<Admin> getCustomerByEmail(String email) {
        List<Admin> ad = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket_system", "root", "200110904894@Vv");

            String sql = "SELECT * FROM customers WHERE email=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String customerEmail = rs.getString("email");
                String phoneNumber = rs.getString("phone_number");
                String address = rs.getString("address");

                Admin admin = new Admin(customerId, firstName, lastName, customerEmail);
                ad.add(admin);
            }
        } catch (SQLException e) {
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

        return ad;
    }
}
