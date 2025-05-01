<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SAS Bank Credit Card</title>
  <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
  <style>
    * {
      box-sizing: border-box;     
    }

    .main-container {
      font-family: 'Segoe UI', sans-serif;
      background: white;
      min-height: 100vh;
      display: flex;
      margin-top:-60px;
      flex-direction: column;
      align-items: center;
      padding: 2rem;
    }

    h1 {
      color: white;
      margin-bottom: 1rem;
    }

    .card-container {
      width: 350px;
      height: 200px;
      perspective: 1000px;
      margin-bottom: 2rem;
    }

    .credit-card {
      width: 100%;
      height: 100%;
      border-radius: 16px;
      position: relative;
      transition: transform 0.8s;
      transform-style: preserve-3d;
    }

    .credit-card.flip {
      transform: rotateY(180deg);
    }

    .card-side {
      position: absolute;
      width: 100%;
      height: 100%;
      border-radius: 16px;
      backface-visibility: hidden;
      padding: 20px;
      color: white;
      background: linear-gradient(135deg, #4e0bc2, #822cc2);
    }

    .card-back {
      transform: rotateY(180deg);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      font-size: 14px;
    }

    .card-bank {
      font-size: 20px;
      font-weight:400;
      margin-bottom: 20px;
      text-align: end;
    }

    .card-number {
      font-size: 18px;
      letter-spacing: 2px;
      margin-bottom: 20px;
    }

    .card-details {
      display: flex;
      justify-content: space-between;
      font-size: 14px;
    }

    .form-box {
      background-color: white;
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
      width: 35%;
      display: grid;
      gap: 15px;
      grid-template-columns: 1fr;
    }

    .form-box .field-group {
      display: grid;
      grid-template-columns: 1fr;
    }

    .form-box label {
      font-weight: 600;
      margin-bottom: 5px;
    }

    .form-box input {
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .form-box .row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .form-box button {
      padding: 10px;
      background: #4e0bc2;
      color: white;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }

    .cvv-info {
      text-align: center;
      color: #eee;
      font-size: 12px;
      margin-top: 10px;
      padding: 0 10px;
    }

    .black-strip {
      background: black;
      width: 100%;
      height: 40px;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<div class="navbar">
       <h2 class="BankingHeading" style="color: white">SAS Bank</h2>
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
           
           <div style="background-color: transparent; float: left; "> <a href="Login.jsp" style=" align-content: center;">Login</a> </div>
           <div style="background-color: transparent; float: left;"> <a href="CreateAccount.jsp"style="margin-top:30px" >Sign Up</a>  </div>
        </div>
    </div>
      <div class="main-container">
    <h1>Credit Card Application</h1>

    <div class="card-container">
    
      <div class="credit-card" id="credit-card">
        <div class="card-side card-front">
          <div class="card-bank">SAS Bank</div>
          <div class="card-number" id="card-number-display">#### #### #### ####</div>
          <div class="card-details">
            <div id="card-name-display">FULL NAME</div>
            <div id="card-expiry-display">MM/YY</div>
          </div>
        </div>
        <div class="card-side card-back">
          <div class="black-strip"></div>
          <div><strong>CVV:</strong> <span id="cvv-display">###</span></div>
          <div class="cvv-info">This is your Card Verification Value. Do not share it with anyone.</div>
        </div>
      </div>
    </div>

    <div class="form-box">
    
    <form action="proceedwithdetails" method="POST">
      <div class="field-group">
        <label>Card Number</label>
        <input type="text" inputmode="numeric" pattern="\d*" maxlength="16"
               oninput="formatCardNumber(this)" name="cardNumber" required="required"/>
      </div>

      <div class="field-group">
        <label>Card Holder</label>
        <input type="text" oninput="updateCardName(this.value)"  name="holderName" required="required" />
      </div>

      <div class="row">
        <div class="field-group">
          <label>Expiry Date</label>
          <input type="text" inputmode="numeric" maxlength="5" placeholder="MM/YY"
                 oninput="formatExpiry(this)"  name="expDate" required="required"/>
        </div>
        <div class="field-group">
          <label>CVV</label>
          <input type="text" inputmode="numeric" maxlength="3" placeholder="123"
                 onfocus="flipCard(true)" onblur="flipCard(false)" oninput="filterCVV(this)"  name="cvv" required="required"/>
        </div>
      </div>

         <button type="submit">Proceed</button>
      </form>
    </div>
  </div>

  <script>
    function formatCardNumber(input) {
      input.value = input.value.replace(/\D/g, '').substring(0, 16);
      const formatted = input.value.replace(/(.{4})/g, '$1 ').trim();
      document.getElementById('card-number-display').textContent = formatted || '#### #### #### ####';
    }

    function updateCardName(val) {
      document.getElementById('card-name-display').textContent = val || 'FULL NAME';
    }

    function formatExpiry(input) {
      let value = input.value.replace(/\D/g, '').substring(0, 4);
      if (value.length >= 3) {
        value = value.substring(0, 2) + '/' + value.substring(2);
      }
      input.value = value;
      document.getElementById('card-expiry-display').textContent = value || 'MM/YY';
    }

    function filterCVV(input) {
      input.value = input.value.replace(/\D/g, '').substring(0, 3);
      document.getElementById('cvv-display').textContent = input.value || '###';
    }

    function flipCard(flip) {
      document.getElementById('credit-card').classList.toggle('flip', flip);
    }
  </script>
</body>
</html>
