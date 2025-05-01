package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.SAS.DAO.UserRegistrationDAO;
import com.SAS.DAO.UserRegistrationImp;
import com.SAS.DTO.BankUserDetails;

@WebServlet("/createaccount")
public class UserRegistration  extends HttpServlet{
	
	
	BankUserDetails bankUserDetails = new BankUserDetails();
	UserRegistrationDAO userRegistrationDAO = new UserRegistrationImp();
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String emailid = req.getParameter("emailid");
		String temp_phNumber = req.getParameter("phoneNumber");
		long phNumber = Long.parseLong(temp_phNumber);
		String temp_aadhar = req.getParameter("aadharNumber");
		long aadharNumber = Long.parseLong(temp_aadhar);
		String panNumber = req.getParameter("panNumber");
		String address = req.getParameter("address");
		String temp_pincode = req.getParameter("pincode");
		int pincode = Integer.parseInt(temp_pincode);
		String password = req.getParameter("password");
		System.out.println(password);
		String confrim_password = req.getParameter("ConfrimPassword");
		System.out.println(confrim_password);
		String temp_accountNumber = req.getParameter("accountNumber");
		long accountNumber = Long.parseLong(temp_accountNumber);
		String ifscCode = req.getParameter("ifsccode");
		String upiid = req.getParameter("upiId");
		PrintWriter writer = resp.getWriter();
		String temp_date = req.getParameter("dob");
		LocalDate DOB = LocalDate.parse(temp_date);
		if(password.equals(confrim_password)) {
			bankUserDetails.setUserName(name);
			bankUserDetails.setEmailid(emailid);
			bankUserDetails.setPhoneNumber(phNumber);
			bankUserDetails.setAadharNumber(aadharNumber);
			bankUserDetails.setPanNumber(panNumber);
			bankUserDetails.setAddress(address);
			bankUserDetails.setPincode(pincode);
			bankUserDetails.setPassword(confrim_password);
			bankUserDetails.setAccountNumber(accountNumber);
			bankUserDetails.setIFSCCode(ifscCode);
			bankUserDetails.setUpiid(upiid);
			bankUserDetails.setDob(DOB);
			if(userRegistrationDAO.insertDetails(bankUserDetails))
			{
				RequestDispatcher dispatcher = req.getRequestDispatcher("PaymentSuccess.jsp");
				dispatcher.forward(req, resp);
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("CreateAccount.jsp");
				dispatcher.forward(req, resp);
				 writer.println("<script>"); 
				  writer.println("alert('invalid data')"); 			  
				  writer.println("</script>");
			}
		} else {
			 writer.println("<script>"); 
			  writer.println("alert('invalid data')"); 			  
			  writer.println("</script>");
		}
		
	}
}
