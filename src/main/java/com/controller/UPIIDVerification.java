package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.UpiVerifiedWithName;
import com.SAS.DAO.UpiVerifiedWithNameImp;
import com.SAS.DAO.UserRegistrationDAO;
import com.SAS.DAO.UserRegistrationImp;
import com.SAS.DTO.BankUserDetails;
import com.SAS.Service.UpiVerification;

@WebServlet("/upiverfication")
public class UPIIDVerification extends HttpServlet{
	BankUserDetails bankUserDetails = new BankUserDetails();
	UserRegistrationDAO userRegistration = new UserRegistrationImp();
	List<BankUserDetails> list = new ArrayList<BankUserDetails>();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String upi = request.getParameter("UPIID");
	    String temp_amount = request.getParameter("accamount");
	    double amount = Double.parseDouble(temp_amount);
	    System.out.println("Hello madam");
	    HttpSession session = request.getSession();
	    session.setAttribute("receiverUpiid", upi);
	    String userName = (String) session.getAttribute("userName");
	    session.setAttribute("enterAmount", amount);
	    UpiVerification upiVerification = new UpiVerification();
	    UpiVerifiedWithName upiVerifiedWithName = new UpiVerifiedWithNameImp();
	    PrintWriter writer = response.getWriter();
	    if(upiVerification.validUPIID(upi)) {   	
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("Pin.jsp");
	    	dispatcher.include(request, response);	
	    	writer.println("<script>"); 
	    	writer.println("alert('UPI Verified - " + upiVerifiedWithName.NameVerification(upi) + "');");			  
			 writer.println("</script>"); 
	     } else {	  	   
	    	 RequestDispatcher dispatcher = request.getRequestDispatcher("UPIID.jsp");
		     dispatcher.include(request, response);
		     writer.println("<script>"); 
			 writer.println("alert('invalid UPI')"); 			  
			 writer.println("</script>");   	  
	    }
	}	    
}
