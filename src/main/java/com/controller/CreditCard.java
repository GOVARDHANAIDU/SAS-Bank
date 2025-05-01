package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.CardDetails;
import com.SAS.DAO.CardDetailsImp;

@WebServlet("/proceedwithdetails")
public class CreditCard extends HttpServlet {
	String finalOtp ;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String temp_cardNumber = req.getParameter("cardNumber");
		long cardnumber = Long.parseLong(temp_cardNumber);
		String holderName = req.getParameter("holderName");
		String expDate = req.getParameter("expDate");
		
		String temp_cvv = req.getParameter("cvv");
		int cvv = Integer.parseInt(temp_cvv);
	
		CardDetails cardDetails = new CardDetailsImp();
		PrintWriter writer = resp.getWriter();
		if(cardDetails.validLoginDetails(cardnumber, cvv)) {
			for(String otp : CardDetailsImp.setOtp()) {
				finalOtp = otp;
			}
			HttpSession session = req.getSession();
			session.setAttribute("sendedOtp", finalOtp);
			System.out.println("final otp: "+finalOtp);
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("OTPPage.jsp");
			requestDispatcher.forward(req, resp);
		} else {
			writer.print("<script>");
			writer.print("<alert('Invalid data')>");
			writer.print("</script>");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("Credit.jsp");
			requestDispatcher.forward(req, resp);
		}	 
	}	
}
