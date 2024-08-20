package com.customer.crud1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // This method retrieves a list of all admins from the database
    public static List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket_system", "root", "200110904894@Vv");

            String sql = "SELECT * FROM admins";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int adminId = rs.getInt("admin_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");

                Admin admin = new Admin(adminId, firstName, lastName, email);
                admins.add(admin);
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

        return admins;
    }
}

