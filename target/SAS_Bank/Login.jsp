
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.SAS.DAO.LoginImp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAS BANK - Login</title>
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #3498db, #8e44ad);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 380px;
            text-align: center;
            float : left;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            font-weight: bold;
        }
        .input-group {
            position: relative;
            margin-bottom: 20px;
        }
        .input-group input {
            width: 90%;
            padding: 12px;
            border: 2px solid #8e44ad;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
            
        }
        .input-group input:focus {
            border-color: #5e3370;
        }
        .input-group label {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            font-size: 18px;
            color: #8e44ad;
            background: white;
            padding: 0 5px;
            
            transition: 0.3s ease;
        }
         .input-group input:hover{
        background: #f0f2f5;
         }
        .input-group input:focus + label,
        .input-group input:valid + label {
            top: 0;
            font-size: 12px;
            color: #5e3370;
        }
        .btn {
            width: 85%;
            left : 30px;
            padding: 12px;
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
            font-size: 16px;
        }
        .btn:hover {
            background: #5e3370;
        }
        .links {
            margin-top: 15px;
            font-size: 14px;
        }
        .links a {
            text-decoration: none;
            color: #8e44ad;
            transition: 0.3s;
        }
        .links a:hover {
            text-decoration: underline;
        }
        
        .spinner {
      border: 5px solid #f3f3f3;
      border-top: 5px solid teal;
      border-radius: 50%;
      width: 60px;
      height: 60px;
      animation: spin 1s linear infinite;
      margin-top:-19%;
      margin-left:44%;
      float: left;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    #loading {
      display: none;
      text-align: center;
    }
        
    </style>
</head>
<body>
    <div class="login-container">
        <h2>SAS BANK</h2>
        <form id="balanceForm" action = "loginpage" method="Post">
            <div class="input-group">
                <input type="email" required name = "emailid">
                <label>Email ID</label>
            </div>
            <div id="loading" style="display: none;">
             <div class="spinner">
             </div>
          </div>
            <div class="input-group">
                <input type="password" required name="password" maxlength="4">
                <label>Password</label>
            </div>
            <button type="button" class="btn" onclick="submitForm()">Login</button>
        </form>
        <div class="links">
            <a href="ForgotPassword.jsp">Forgot Password?</a> | <a href="CreateAccount.jsp">Create Account</a>
        </div>
    </div>
    

    <script>
    function submitForm() {
        // Show loading spinner
        document.getElementById("loading").style.display = "block";

        // Submit the form
        document.getElementById("balanceForm").submit();
      }
</script>
</body>
</html>
