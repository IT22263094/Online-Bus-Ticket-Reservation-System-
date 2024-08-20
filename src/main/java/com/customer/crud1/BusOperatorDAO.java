package com.customer.crud1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BusOperatorDAO {

    // This method retrieves a list of all bus operators from the database
    public static List<BusOperator> getAllOperators() {
        List<BusOperator> operators = new ArrayList<>();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket_system", "root", "200110904894@Vv");
            String sql = "SELECT * FROM bus_operators";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int operatorId = rs.getInt("operator_id");
                String firstName = rs.getString("operator_name");
                String email = rs.getString("operator_email");

                BusOperator operator = new BusOperator(operatorId, firstName, email);
                operators.add(operator);
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

        return operators;
    }
}

