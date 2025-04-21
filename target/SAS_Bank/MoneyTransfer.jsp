<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Money Transfer</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
 </head>
    <style>
        .transfer-box {
            margin-top:100px;
            margin-left:550px;
            background: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 450px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #8e44ad;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #732d91;
        }
    </style>
<body>

    <div class="navbar">
      <div style="color:white; background-color: none; margin-top:23px;"> 
        <h2 class="BankingHeading" >SAS Bank</h2>
        </div>
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


    <div class="transfer-box">
        <h2>Send Money via Account</h2>
        <form action="TransferServlet" >
            <input type="number" id="accNo" name="accNo" placeholder="Account Number" onkeyup="fetchUserName()" required maxlength="11">
            <input type="text" id="ifsc" name="ifsc" placeholder="IFSC Code" onkeyup="fetchUserName()" required>
           <input type="text" id="userName" name="accName" placeholder="Account Name">
            <input type="number" name="amount" placeholder="Amount" required>
            <input type="submit" value="Send Money">
        </form>
    </div>
        <script>
        function fetchUserName() {
            var accNumber = document.getElementById("accNo").value;
            var ifsc = document.getElementById("ifsc").value;

            if (accNumber.length > 5 && ifsc.length > 3) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "VerifyUserServlet?accNo=" + accNumber + "&ifsc=" + ifsc, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("userName").value = xhr.responseText;
                    }
                };
                xhr.send();
            }
        }
    </script>
</body>
</html>
