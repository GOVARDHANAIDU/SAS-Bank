<%@page import="com.SAS.DAO.ForgotPasswordImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - SAS BANK</title>
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
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 15px;
            color: #333;
        }
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-group label {
            font-weight: bold;
            font-size: 14px;
        }
        .input-group input {
            width: 85%;
            padding: 8px;
            border: 2px solid #8e44ad;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
            margin-left:3%;
        }
         .input-group input:hover{
        background: #f0f2f5;
         }
        .btn {
            background: #8e44ad;
            color: white;
            padding: 10px;
            width: 80%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background: #732d91;
        }
        .output {
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reset Password - SAS BANK</h2>
        
        <!-- Form for New Password Input -->
        <form action ="newpassword">
            <div class="input-group">
                <label>New Password</label>
                <input type="text" name="newPassword" required maxlength="4">
            </div>
            <div class="input-group">
                <label>Confirm Password</label>
                <input type="text" name="confirmPassword" required maxlength="4">
            </div>
            <input type="submit" class="btn" Value="Reset Password">
            
            
        </form>

       
</body>
</html>
