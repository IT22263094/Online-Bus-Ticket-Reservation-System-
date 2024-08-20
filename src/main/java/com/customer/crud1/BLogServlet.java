package com.customer.crud1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//... (existing imports)

public class BLogServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String email = request.getParameter("email");
     String id = request.getParameter("userId");

     Connection conn = null;
     PreparedStatement stmt = null;
     ResultSet rs = null;

     try {
         // Establish a database connection
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus_ticket_system", "root", "200110904894@Vv");

         String sql = "SELECT * FROM bus_operators WHERE operator_email=? AND operator_id=?";
         stmt = conn.prepareStatement(sql);
         stmt.setString(1, email);
         stmt.setString(2, id);
         rs = stmt.executeQuery();

         if (rs.next()) {
             // Authentication successful
             HttpSession session = request.getSession();
             session.setAttribute("loginEmail", email);
             session.setAttribute("customer", rs); // Store customer details in session

             System.out.println( "this is" + email);
             response.sendRedirect("busOperator.jsp"); // Redirect to profile page
         } else {
             // Authentication failed
             request.setAttribute("message", "Invalid email or password.");
             RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
             dispatcher.forward(request, response);
         }
     } catch (SQLException e) {
         e.printStackTrace();
         // Handle the exception appropriately (e.g., show an error page)
     } finally {
         try {
             if (rs != null) rs.close();
             if (stmt != null) stmt.close();
             if (conn != null) conn.close();
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
 }
}
