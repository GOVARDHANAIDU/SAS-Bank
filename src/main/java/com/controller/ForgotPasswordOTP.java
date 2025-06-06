package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.ForgotPasswordImp;

@WebServlet("/forgotPasswordOTP")

public class ForgotPasswordOTP extends HttpServlet {
	private static List<String> list = new ArrayList<String>();
	  @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

          ForgotPasswordImp forgotPasswordImp = new ForgotPasswordImp();
  		TestEmailOtp testEmailOtp = new TestEmailOtp();
          String email = req.getParameter("emailid");
         
  		HttpSession httpSession = req.getSession();
  	    httpSession.setAttribute("email", email);
 	    
          if (email != null) {
          	if(forgotPasswordImp.checkingEmailID(email) == true) {        		
          		String sendedOtp = testEmailOtp.otpVerification(email);
          	    httpSession.setAttribute("sendedOtp",sendedOtp);
          	  list.add(email);
          		RequestDispatcher requestDispatcher = req.getRequestDispatcher("OTPPage.jsp");
              requestDispatcher.forward(req, resp);
              
          } else {
        	  RequestDispatcher requestDispatcher = req.getRequestDispatcher("ForgotPassword.jsp");
              requestDispatcher.forward(req, resp); 	 
         }
	  }	  
	 }	  
	  public static List<String> setEmail() {
		return list;		  
	  }
}

