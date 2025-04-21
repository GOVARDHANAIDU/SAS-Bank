<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.SAS.DAO.LoginImp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Payment</title>
    <link rel="Stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
</head>
<style>
    .keypad {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
        justify-content: center;
        margin-top: 20px;
    }

    .keypad button {
        width: 60px;
        height: 60px;
        font-size: 22px;
        border: none;
        background: white;
        color: navy;
        cursor: pointer;
        border-radius: 10px;
        box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
    }

    .keypad button:active {
        background: lightgray;
    }

    .tick-btn {
        width: 60px;
        height: 60px;
        background: white;
        color: navy;
        border-radius: 10px;
        width: 60px;
        height: 60px;
        box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
        font-size: 24px;
        font-weight:bolder;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 50px;
        flex-direction: column;
    }
    .verified {
    color: green;
    margin-top: 10px;
    margin-left: 30px;
    display: flex;
    align-items: center;
}
</style>
<body>
    <div class="navbar">
        <h3 class="BankingHeading" style="color: white">SAS Bank</h3>
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
        <div style=" color: white; width: fit-content; float:left; margin-left: 650px; ">
            <p>Hello! <%=userName%></p>
        </div>
        <a href="Login.jsp">
            <img alt="" src="https://icons.veryicon.com/png/o/miscellaneous/domain-icons/my-account-login.png" style="width:30px;margin-left: 10px; margin-right:15px;">
        </a>
        <div class="auth-links">
            <a href="Login.jsp">Login</a>
            <a href="CreateAccount.jsp">Sign Up</a>
        </div>
    </div>

    <div class="container">
        
                
            <h2>Pay via Phone Number</h2>
    <form action="SetAmountServlet"> 
            <div class="amountDisplay">
                <input type="number" id="amountDisplay" placeholder="₹ Amount" name="accamount" required>
            </div>
        <%
    HttpSession verifiedSession = request.getSession(false);
    String verifiedUser = (verifiedSession != null) ? (String) verifiedSession.getAttribute("verifiedUser") : null;
	%>
	<% if (verifiedUser != null) { %>
	    <div class="verified">
	        <span><%= verifiedUser %> &#x2705;</span>
	    </div>
	<% } %>
            <div class="keypad">
                <button type="button" onclick="enterPin('1')">1</button>
                <button type="button" onclick="enterPin('2')">2</button>
                <button type="button" onclick="enterPin('3')">3</button>
                <button type="button" onclick="enterPin('4')">4</button>
                <button type="button" onclick="enterPin('5')">5</button>
                <button type="button" onclick="enterPin('6')">6</button>
                <button type="button" onclick="enterPin('7')">7</button>
                <button type="button" onclick="enterPin('8')">8</button>
                <button type="button" onclick="enterPin('9')">9</button>
                <button type="button" onclick="deletePin()">&#9003;</button>
                <button type="button" onclick="enterPin('0')">0</button>
                <input type="submit" class="tick-btn" value="&#10003;" > 
            </div>
        </form>
    </div>

<script>
    const input = document.getElementById("amountDisplay");

    function enterPin(value) {
        input.value += value;
    }

    function deletePin() {
        input.value = input.value.slice(0, -1);
    }

</script>

</body>
</html>
