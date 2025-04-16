<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.SAS.DAO.LoginImp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPI ID Payment</title>
    <link rel="Stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">  
</head>
<body>
    <div class="navbar">
        <h2 class="BankingHeading" style="color: white">SAS Bank</h2>
        <div class="nav-links">
            <a href="Home.jsp">Home</a>
            <div class="dropdown">
                <a href="?">Services</a>
                <div class="dropdown-content">
                    <a href="PersonalBanking.jsp">Personal Banking</a>
                    <a href="#">Corporate Banking</a>
                    <a href="#">Payments</a>
                    <a href="#">Online Tax</a>
                </div>
            </div>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
        </div>
        <%
        
        HttpSession session2 = request.getSession();
        String name = (String) session2.getAttribute("userName");
        String userName = "";
        for(int i= 0 ; i<=name.length()-1 ; i++)
        {
        	char ch = name.charAt(i);
        	if(ch == ' ' )
        	{
        		break;
        	}
        	else
        	{
        		userName = userName+ch;
        	}
        }
        %>
        
        <div style=" color: white; width: fit-content; float:left; margin-left: 650px; "><p>Hello! <%=userName%></p></div>
        <a href ="Login.jsp">
        <img alt="" src="https://icons.veryicon.com/png/o/miscellaneous/domain-icons/my-account-login.png" style="width:30px;margin-left: 10px; margin-right:15px;">
        </a>
        <div class="auth-links">
            <a href="Login.jsp">Login</a>
            <a href="CreateAccount.jsp">Sign Up</a>
        </div>
    </div>
    
	    <div class="container">
	    <form action="upiverfication">	         
	        <h2>Pay via UPI ID</h2>
	        <input type="text" id="upiId" placeholder="Enter UPI ID (example@upi)" name="UPIID">
	        <input type="number" id="amount" placeholder="₹ Amount" name="accamount" required="required">
	        <input type="submit" value="Proceed" class="proceed">
	     </form>
	    </div>
    

</body>
</html>
