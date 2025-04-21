<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAS Bank - Personal Banking</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
</head>
    <style>
 
        .container {
            margin-top:200px;
            
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 900px;
            height: 300px;
        }
        .services-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            align-items: center;
            width: 800px;
        }
        .service-box {
            width: 250px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: 0.3s;
        }
        .service-box:hover {
            transform: scale(1.05);
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15);
        }
        .service-box a { text-decoration: none; color: #8e44ad; font-weight: bold; }
    </style>
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
        <h2>Personal Banking Services</h2><br><br>
        
        <div class="services-container">
            <div class="service-box"><a href="upiPayment.jsp">UPI Payment</a></div>
            <div class="service-box"><a href="MoneyTransfer.jsp">Money Transfer</a></div>
            <div class="service-box"><a href="Cards.jsp">Cards</a></div>
            <div class="service-box"><a href="#">Recharge</a></div>
            <div class="service-box"><a href="DisplayBalance.jsp">Check Balance</a></div>
            <div class="service-box"><a href="TransactionHistory.jsp">Transaction History</a></div>
        </div>
    </div>
</body>
</html>
