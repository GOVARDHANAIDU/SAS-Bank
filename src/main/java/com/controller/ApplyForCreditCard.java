package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.CardDetailsImp;
import com.SAS.DTO.CardDetailsClass;
import com.SAS.Service.CreditCardValidation;

@WebServlet("/applyforcreditcard")
public class ApplyForCreditCard extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String temp_accNo = req.getParameter("accNo");
		long accNo = Long.parseLong(temp_accNo);
		String empStatus = req.getParameter("empStatus");
		String tempAmount = req.getParameter("monthlyincome");
		double monthlyincome = Double.parseDouble(tempAmount);
		
		CreditCardValidation cardValidation = new CreditCardValidation();
		CardDetailsImp cardDetailsImp = new CardDetailsImp();
		  String amount = cardValidation.cardApplicable(accNo, empStatus, monthlyincome);
		  
		  int lastSpaceIndex = amount.lastIndexOf(" ");
		  
		 String firstPart = amount.substring(0, lastSpaceIndex);
		  
  	     String lastPart = amount.substring(lastSpaceIndex + 1);
  	     
  	     double range = Double.parseDouble(lastPart);
  	     
  	     HttpSession session = req.getSession();
  	     String name = (String) session.getAttribute("userName");
  	     int id = (Integer)session.getAttribute("userId");
  	     
  	     CardDetailsClass cardDetails = new CardDetailsClass();
  	     if(monthlyincome >= 20000.00 && (empStatus.equalsIgnoreCase("employed") 
  	    		 || empStatus.equalsIgnoreCase("self-employed")) ) {
  	    	 cardDetails.setCreditCardNumber(cardValidation.generateCreditCardNumber());
  	    	 cardDetails.setDebitCardNumber(cardValidation.generateCreditCardNumber());
  	    	 cardDetails.setExpMonth(cardValidation.expMonth());
  	    	 cardDetails.setExpYear(cardValidation.expYear());
  	    	 cardDetails.setUserId(id);
  	    	 cardDetails.setUserName(name);
  	    	 cardDetails.setCvv(cardValidation.cvv());
  	    	 cardDetails.setEmpStatus(empStatus);
  	    	 cardDetails.setAccNo(accNo);
  	    	 if(cardDetailsImp.insertCardDetails(cardDetails)) {
  	    		 RequestDispatcher dispatcher = req.getRequestDispatcher("PaymentSuccess.jsp");
  	    		 dispatcher.forward(req, resp);
  	    	 } else {
  	    		RequestDispatcher dispatcher = req.getRequestDispatcher("Home.jsp");
 	    		 dispatcher.forward(req, resp);
  	    	 }
  	     } 
	        
		  
	}
}
