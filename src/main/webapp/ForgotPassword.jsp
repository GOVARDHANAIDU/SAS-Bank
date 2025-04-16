<%@page import="java.util.Set"%>
<%@page import="com.mysql.cj.Session"%>
<%@page import="com.SAS.DAO.ForgotPasswordImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <title>Forgot Password - SAS BANK</title>
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #3498db, #8e44ad);
            height: 710px;
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
            width: 90%;
            padding: 8px;
            border: 2px solid #8e44ad;
            border-radius: 5px;
            font-size: 14px;
            outline: none;
        }
         .input-group input:hover{
        background: #f0f2f5;
         }
        .btn {
            background: #8e44ad;
            color: white;
            padding: 10px;
            width: 85%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            
            
        }
        .btn:hover {
            background: #732d91;
        }
        .output {
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .error{
        color:red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Forgot Password - SAS BANK</h3>
        
        <!-- Form for Email Input -->
        <form  method="post">
            <div class="input-group">
                <label>Email ID</label>
                <input type="email" name="emailid" required>
            </div>
            <input type="submit" class="btn" Value="Submit" >
        </form>

        <!-- Displaying Entered Email -->
        <div class="output">
            <%
                ForgotPasswordImp forgotPasswordImp = new ForgotPasswordImp();
                String email = request.getParameter("emailid");
        		HttpSession httpSession = request.getSession();
        	    httpSession.setAttribute("email", email);
                if (email != null) {
                	if(forgotPasswordImp.checkingEmailID(email) == true) {
            %>
                 <p> Verified Successful</p>
                <p>Email Entered: <%= email %></p>
                <% 
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("NewPassword.jsp");
                    requestDispatcher.forward(request, response);
                } else {
            	%> 
            	 <p class=error> ❌ Invalid EmailID </p>
            	 <a href="CreateAccount.jsp" id="login">Create Account</a> 
             <% }
               }
            %>
        </div>
    </div>
</body>
</html>
