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

import com.SAS.DAO.UpiVerifiedWithName;
import com.SAS.DAO.UpiVerifiedWithNameImp;
import com.SAS.DAO.UserRegistrationDAO;
import com.SAS.DAO.UserRegistrationImp;
import com.SAS.Service.AccountBalanceValidation;

@WebServlet("/VerifyPinServlet")
public class VerifyPinServlet extends HttpServlet {
    UpiVerifiedWithName upiVerifiedWithName = new UpiVerifiedWithNameImp();
	AccountBalanceValidation accountBalanceValidation = new AccountBalanceValidation();
	long number ;
	String mode;
	long accNumber;
	String selectedMode;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	UserRegistrationDAO userRegistrationDAO = new UserRegistrationImp();
        String temp_pin = request.getParameter("pin");
        int pin = Integer.parseInt(temp_pin);
        selectedMode = "UPI";       
        HttpSession session = request.getSession();
        String senderUpiid = (String) session.getAttribute("upiid");
        String recieverUpiid = (String) session.getAttribute("receiverUpiid");
        double amount = (double) session.getAttribute("enterAmount");
        mode = (String) session.getAttribute("Mode");
        if(mode.equals("contact")) {      
        number = (long) session.getAttribute("phoneNumber");
	        if(number != 0) {
	    		recieverUpiid = userRegistrationDAO.getReceiverUpiUsingPhoneNumber(number);
	    		selectedMode = "Contact";
	    	}        
        }
        
        if(mode.equals("AccountNumber")) {
        	accNumber = (long) session.getAttribute("accountNumber");
        	if(accNumber != 0) {
        		recieverUpiid = userRegistrationDAO.getReceiverUpiUsingAccountNumber(accNumber);
        		selectedMode ="Account Number";
        	}
        }
        
               
        String status = "";
        PrintWriter out = response.getWriter();
        
    		try {
    			
    	            // Database Connection
    	            Class.forName("com.mysql.cj.jdbc.Driver");  
    	            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12773883","sql12773883","r71iFqJHWT");
    	            
    	            // Query to check PIN
    	            PreparedStatement ps = con.prepareStatement("SELECT * FROM user_details WHERE Password = ?");
    	            ps.setInt(1, pin);
    	            ResultSet rs = ps.executeQuery();
   	            
    	            if (rs.next()) {    
    	            		status = accountBalanceValidation.accountBalance(senderUpiid,recieverUpiid, amount , selectedMode);
    	            	if(status.equals("valid")) {
    	            		out.print("valid"); 	            		
    	            	} else {
    	            		out.print("InSufficent Funds");
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
