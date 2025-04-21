package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckBalance")
public class CheckBalanceFetch extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String temp_pin = request.getParameter("pin");
        int pin = Integer.parseInt(temp_pin);
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("email");
        PrintWriter out = response.getWriter();

    		try {   			
    	            // Database Connection
    	            Class.forName("com.mysql.cj.jdbc.Driver");  
    	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas_bank","root","W7301@jqir#");
    	            
    	            // Query to check PIN
    	            PreparedStatement ps = con.prepareStatement("SELECT Password FROM user_details WHERE Email_ID = ?");
    	            ps.setString(1, name);
    	            ResultSet rs = ps.executeQuery();
    	            
    	            if (rs.next()) { 
    	            	
    	            	if(rs.getInt("Password") == pin) {
    	            		out.print("valid");
    	            	} else {
    	            		out.print("Invalid");
    	            	}
    	            } else {
    	            	out.print("Invalid");
    	            }	            
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	            out.print("Invalid");
    	        }
    }
}
