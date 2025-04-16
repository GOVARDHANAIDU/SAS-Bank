package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PaymentRouterServlet")

public class PaymentSelection extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("paymentMode");
	    System.out.println("Selected Payment Mode: " + mode);
	    HttpSession session = req.getSession();
	    session.setAttribute("Mode", mode);
	    if(mode.equals("upiid")) {
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("UPIID.jsp");
	    	dispatcher.forward(req, resp);
	    } else if(mode.equals("contact")) {
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("Contact.jsp");
	    	dispatcher.forward(req, resp);
	    } else {
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("QR.jsp");
	    	dispatcher.forward(req, resp);
	    }
	}
}
