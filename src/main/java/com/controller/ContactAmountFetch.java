package com.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SetAmountServlet")
public class ContactAmountFetch extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("accamount");
        double enterAmount = Double.parseDouble(amount);
        HttpSession session = request.getSession();
        session.setAttribute("enterAmount", enterAmount);
        
        response.sendRedirect("Pin.jsp");
    }
}
