package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TransferServlet")
public class MoneyTransfer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp_accno = req.getParameter("accNo");
		long accNo = Long.parseLong(temp_accno);
		String ifsc = req.getParameter("ifsc");
		String accHolderName = req.getParameter("accName");
		String tempAmount = req.getParameter("amount");
		double enterAmount = Double.parseDouble(tempAmount);
		String mode = "AccountNumber";
		
		HttpSession session = req.getSession();
		session.setAttribute("accountNumber", accNo);
		session.setAttribute("enterAmount", enterAmount);
		session.setAttribute("Mode", mode);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("Pin.jsp");
		requestDispatcher.forward(req, resp);
		
		
	}

}
