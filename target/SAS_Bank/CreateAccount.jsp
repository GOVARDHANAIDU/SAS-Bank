<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account - SAS BANK</title>
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
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 10px;
            text-align: left;
        }
        .input-group label {
            font-weight: bold;
            font-size: 14px;
        }
        .input-group input {
            width: 95%;
            padding: 8px;  /* Reduced padding */
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
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover {
            background: #732d91;
        }
         .links a {
            text-decoration: none;
            color: #8e44ad;
            transition: 0.3s;
        }
        .links a:hover {
            text-decoration: underline;
        }
        p {
        margin-left : -80px; 
        margin-right:0px;
        }
        #login{
        margin-left:65%;
        margin-top:50%;
        margin-bottom: 0px;
        
        }
        .login{
        width:100px;
        
        float:left;
        margin-top:-35px;
        margin-left: 48%;
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h2>Create Account - <b>SAS BANK</b></h2>
        <form action="createaccount">
            <div class="input-group">
                <label>Full Name*</label>
                <input type="text" name="name" required>
            </div>
            <div class="input-group">
                <label>Email ID*</label>
                <input type="email" name="emailid" required>
            </div>
            <div class="input-group">
                <label>Password*</label>
                <input type="text" name="password" required maxlength="4">
            </div>
            <div class="input-group">
                <label>Confrim Password*</label>
                <input type="text" name="ConfrimPassword" required maxlength="4">
            </div>
            <div class="input-group">
                <label>Account Number*</label>
                <input type="text" name="accountNumber">
            </div>
            <div class="input-group">
                <label>IFSC Code*</label>
                <input type="text" name="ifsccode">
            </div>
            <div class="input-group">
			    <label>Phone Number*</label>
			    <input type="tel" name="phoneNumber" id="phonenumber" required maxlength="10">
			</div>
			
			<div class="input-group">
			    <label>UPI ID</label>
			    <select id="upiid" name="upiId" >
			        <option value="" disabled style= "width:350px">-- Select UPI ID --</option>
			    </select>
			</div>
            <div class="input-group">
                <label>Aadhar Number*</label>
                <input type="text" name="aadharNumber" required maxlength="12">
            </div>
            
            <div class="input-group">
                <label>PAN Number*</label>
                <input type="text" name="panNumber" required maxlength="10">
            </div>
            <div class="input-group">
                <label>City*</label>
                <input type="text" name="address" required >
            </div>
            <div class="input-group">
                <label>Pincode*</label>
                <input type="text" name="pincode" required maxlength="6">
            </div>
            
            <button type="submit" class="btn">Create Account</button>
            
        </form>
         <div class="links">
            <p>Already have an account?</p> <div class="login"> <a href="Login.jsp" id="login">Login</a> </div>        
        </div>
    </div>
    
    <script>
    document.getElementById("phonenumber").addEventListener("input", function () {
        const phone = this.value;
        const upiDropdown = document.getElementById("upiid");

        if (phone.length === 10) {
            const upi1 = `${phone}@axl`;
            const upi2 = `${phone}@ybl`;
            const upi3 = `${phone}@ibl`;

            // Clear existing options
            upiDropdown.innerHTML = '<option value="">-- Select UPI ID --</option>';

            // Add the 3 UPI options
            [upi1, upi2, upi3].forEach(upi => {
                const option = document.createElement("option");
                option.value = upi;
                option.text = upi;
                upiDropdown.appendChild(option);
            });
        } else {
            // Reset if phone number is not 10 digits
            upiDropdown.innerHTML = '<option value="">-- Select UPI ID --</option>';
        }
    });
</script>
</body>
</html>
