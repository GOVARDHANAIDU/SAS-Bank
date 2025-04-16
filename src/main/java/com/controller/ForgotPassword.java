package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.SAS.DAO.ForgotPasswordImp;

@WebServlet("/newpassword")
public class ForgotPassword extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ForgotPasswordImp forgotPasswordImp = new ForgotPasswordImp();

         String newPassword = req.getParameter("newPassword");
         String confirmPassword = req.getParameter("confirmPassword");
         
         PrintWriter writer = resp.getWriter();
             if(newPassword.equals(confirmPassword)) { 
             	HttpSession httpSession = req.getSession();              
                  String email = (String) httpSession.getAttribute("email");
                  System.out.println(email);
                  if(forgotPasswordImp.UpdatePassword(email, confirmPassword)) { 
                	  RequestDispatcher dispatcher = req.getRequestDispatcher("Login.jsp");
                	  dispatcher.include(req, resp);
                	  writer.println("<script>");
          			   writer.println("alert('Updated Successfully')");
          			   writer.println("</script>");
                  } else {
                  RequestDispatcher dispatcher = req.getRequestDispatcher("NewPassword.jsp");
                  dispatcher.include(req, resp);
                   writer.println("<script>");
       			   writer.println("alert('Updated Failed')");
       			   writer.println("</script>");
                	           
                     }
             } else {
            	 RequestDispatcher dispatcher = req.getRequestDispatcher("NewPassword.jsp");
            	 dispatcher.include(req, resp);
               writer.println("<script>");
  			   writer.println("alert('Invalid Password')");
  			   writer.println("</script>");
             }

       
	 }
	}

