package com.controller;

import java.awt.print.Printable;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.AllPermission;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.AllBankUserDetailsDAO;
import com.SAS.DAO.AllBankUserDetailsImp;
import com.SAS.DAO.LoginImp;
import com.SAS.DTO.BankUserDetails;
import com.google.protobuf.TextFormat.Printer;

@WebServlet("/loginpage")
public class LoginPage extends HttpServlet {
	private static String name ="";
	private static String upi = "";
	private static double accamount;
	private static int userId;
	AllBankUserDetailsDAO allBankUserDetailsDAO = new AllBankUserDetailsImp(); 
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LoginImp login = new LoginImp();
	     String emailid = req.getParameter("emailid");
	     String password = req.getParameter("password");
	     
	     PrintWriter writer = resp.getWriter();
	     
	     if(login.selectLoginDetails(emailid , password))
	     { 
	    	allBankUserDetailsDAO.SelectAllBankUserDetails();
	    	HttpSession session = req.getSession();
	    	session.setAttribute("email", emailid);
	    	session.setAttribute("userName", name );
	    	session.setAttribute("upiid", upi);
	    	session.setAttribute("amount", accamount);
	    	session.setAttribute("userId", userId);
	        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Home.jsp");
	        requestDispatcher.include(req, resp);
	     }
	     else {	    	 
	    	 RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
			  dispatcher.include(req, resp);
			  writer.println("<script>"); 
			  writer.println("alert('invalid data')"); 			  
			  writer.println("</script>"); 
	     }
	}
	public static void userName(String userName, String upiid, double amount, int id) {
			name = userName;
			upi = upiid;
			accamount = amount;
			userId = id;
	}
	
}
