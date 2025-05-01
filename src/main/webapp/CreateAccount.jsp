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
            padding: 20px;
        }
        .container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 900px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #8e44ad;
        }
        form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .input-group {
            display: flex;
            flex-direction: column;
        }
        .input-group label {
            font-weight: bold;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .input-group input,
        .input-group select {
            padding: 10px;
            border: 2px solid #8e44ad;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }
        .input-group input:hover,
        .input-group select:hover {
            background: #f0f2f5;
        }
        .btn {
            grid-column: span 2;
            background: #8e44ad;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background: #732d91;
        }
        .links {
            grid-column: span 2;
            text-align: center;
            margin-top: 10px;
        }
        .links a {
            text-decoration: none;
            color: #8e44ad;
            transition: 0.3s;
        }
        .links a:hover {
            text-decoration: underline;
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
                <label>Confirm Password*</label>
                <input type="text" name="ConfrimPassword" required maxlength="4">
            </div>
            <div class="input-group">
              <label>Date of Birth*</label>
              <input type="date" name="dob" id="dob" required>
              <small style="color: red; display: none;">You must be at least 18 years old</small>
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
                <select id="upiid" name="upiId">
                    <option value="" disabled selected>-- Select UPI ID --</option>
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
                <input type="text" name="address" required>
            </div>
            <div class="input-group">
                <label>Pincode*</label>
                <input type="text" name="pincode" required maxlength="6">
            </div>

            <button type="submit" class="btn">Create Account</button>
            <div class="links">
                <p>Already have an account? <a href="Login.jsp">Login</a></p>
            </div>
        </form>
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
            upiDropdown.innerHTML = '<option value="" disabled>-- Select UPI ID --</option>';

            [upi1, upi2, upi3].forEach(upi => {
                const option = document.createElement("option");
                option.value = upi;
                option.text = upi;
                upiDropdown.appendChild(option);
            });
        } else {
            upiDropdown.innerHTML = '<option value="" disabled selected>-- Select UPI ID --</option>';
        }
    });
    // Set max DOB to 18 years ago from today
window.addEventListener("DOMContentLoaded", function () {
    const dobInput = document.getElementById("dob");
    if (dobInput) {
        const today = new Date();
        const eighteenYearsAgo = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
        const maxDate = eighteenYearsAgo.toISOString().split("T")[0];
        dobInput.max = maxDate;
    }
});

    </script>
</body>
</html>
