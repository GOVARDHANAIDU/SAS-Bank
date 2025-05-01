<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Cards</title>
  <link rel="Stylesheet" href="HomePage.css">
  <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background: #f4f4f4;

      min-height: 100vh;
    }

    .card-container {
      background: white;
      padding: 40px;
      margin-left:350px;
      margin-top:200px;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
      width: 90%;
      max-width: 800px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #333;
    }

    .button-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 20px;
    }

    .card-link {
      text-decoration: none;
    }

    .card-btn {
      background-color: #f8f8f8;
      padding: 15px 20px;
      border-radius: 10px;
      text-align: center;
      font-weight: 600;
      font-size: 16px;
      color: #8e44ad;
      border: none;
      transition: all 0.3s ease;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      cursor: pointer;
      display: block;
    }

    .card-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 15px rgba(30, 105, 235, 0.2);
    }

    @media (max-width: 500px) {
      .card-container {
        padding: 25px 20px;
      }
    }
  </style>
</head>
<body>
<div class="navbar">
        <h3 class="BankingHeading" style="color: white">SAS Bank</h3>
        <div class="nav-links">
            <a href="Home.jsp">Home</a>
            <div class="dropdown">
                <a href="PersonalBanking.jsp">Services</a>
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
  <div class="card-container">
    <h2>Manage Your Cards</h2>
    <div class="button-grid">
      <a href="Credit.jsp" class="card-link"><div class="card-btn">Credit Card</div></a>
      <a href="DebitCard.jsp" class="card-link"><div class="card-btn">Debit Card</div></a>
      <a href="ApplyForCreditCard.jsp" class="card-link"><div class="card-btn">Apply for Credit Card</div></a>
      <a href="QR.jsp" class="card-link"><div class="card-btn">Apply for Debit Card</div></a>
      <a href="QR.jsp" class="card-link"><div class="card-btn">Apply for Virtual Card</div></a>
    </div>
  </div>
</body>
</html>
