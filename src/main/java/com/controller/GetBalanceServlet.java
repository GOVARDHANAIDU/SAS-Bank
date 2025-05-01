package com.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
@WebServlet("/GetBalanceServlet")
public class GetBalanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String balance = "0.0";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SAS_Bank","root","W7301@jqir#");
            PreparedStatement stmt = conn.prepareStatement("SELECT Account_Balance FROM user_details WHERE Email_ID=?");
                      
            stmt.setString(1, email); 
            ResultSet resultSet = stmt.executeQuery();
            if(resultSet.next())
            {          	
            	balance = resultSet.getString("Account_Balance");
            }
	
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"balance\": " + balance + "}");
    }
}
