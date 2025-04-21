package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/CheckContactServlet")
public class CheckContactServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phoneNumber = req.getParameter("phone");
		long phone = Long.parseLong(phoneNumber);
		HttpSession session = req.getSession();
		session.setAttribute("phoneNumber", phone);
		PrintWriter writer = resp.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = 
					DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883","sql12773883","r71iFqJHWT");
			PreparedStatement preparedStatement = connection.prepareStatement("Select User_Name from user_details where Phone_Number = ?");
			preparedStatement.setLong(1, phone);
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			   if (resultSet.next()) {
				   String userName = resultSet.getString("User_Name");
				   session.setAttribute("verifiedUser", userName);
				   RequestDispatcher dispatcher = req.getRequestDispatcher("ContactAmount.jsp");
				   dispatcher.forward(req, resp); // Use forward instead of include

	            }  else {
	            	req.setAttribute("error", " Invalid number. Try again.");
	            	RequestDispatcher dispatcher = req.getRequestDispatcher("Contact.jsp");
	            	dispatcher.forward(req, resp); // forward instead of include
	            }

		}catch (NumberFormatException e) {
            writer.println("<div class='error-message'>Please enter a valid number.</div>");
        } catch (Exception e) {
            e.printStackTrace();
            writer.println("<div class='error-message'>Something went wrong. Please try again later.</div>");
        }
	}
}
