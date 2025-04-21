<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Feature Under Progress</title>
  <link rel="stylesheet" href="HomePage.css">
  <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
  </head>
  <style>
    .message-box {
     margin-top: 30px;
     margin-left:400px;
      width: 800px;
      text-align: center;
      background: #ffffff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      animation: comboEffect 2s ease-in-out;
    }

    .message-box h2 {
      margin-bottom: 20px;
      color: #333;
    }

    .btn-home {
            position: absolute;
            bottom: 300px;
            right: 20px;
            padding: 10px 20px;
            font-size: 18px;
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
            width:150px;
        }
        .btn-home:hover {
            background: white;
            color: black;
        }

    .btn-back {
      position: absolute;
      bottom: 300px;
      left: 20px;
      background-color: #8e44ad;
      color: white;
      padding: 8px 20px;
      font-size: 14px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.5s ease;
      width: 150px;
    }

    .btn-back:hover {
      background: white;
      color: black;
      transition: background-color 0.3s ease;
    }
    @keyframes comboEffect {
      0% {
        opacity: 0;
        background-color: white;
        color: #999;
        transform: scale(0.9);
      }
      50% {
        background-color: white;
        color: #007BFF;
      }
      100% {
        opacity: 1;
        background-color: white;
        color: #333;
        transform: scale(1);
      }
    }
  </style>

<body>
  <div class="navbar">
        <h3>SAS Bank</h3>
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
  <div class="message-box">
   <span style='font-size:100px;'>&#128679;</span>
    <h2>This feature is under progress.<br>It will be available shortly.</h2>
   
  </div>
  <button class="btn-home" onclick="location.href='Home.jsp'">🏡 Home</button>
  <button class="btn-back" onclick="history.back()">← Back</button>

</body>
</html>
