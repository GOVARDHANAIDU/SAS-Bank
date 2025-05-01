<%@page import="com.SAS.DTO.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credit Card Application</title>
      <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background: linear-gradient(135deg, #e0e7ff, #c3dafe); /* Gradient background */
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .form-container {
          
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 1rem;
            max-width: 80%;
            margin: 0 auto;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #1e3a8a; /* Darker blue */
            margin-bottom: 2rem;
            text-align: center;
            letter-spacing: -0.025em;
        }

        form {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        @media (min-width: 768px) {
            form {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .form-group {
            position: relative;
            margin-bottom: 10px;
        }

        label {
            display: block;
            color: #374151;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        input, select {
            background-color: #f9fafb;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem; /* Space for icon */
            color: #111827;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
            outline: none;
        }

        input::placeholder {
            color: #9ca3af;
        }

        .input-icon {
            position: absolute;
            left: 0.75rem;
            color: #6b7280;
            font-size: 1.1rem;
        }

        .error-message {
            color: #dc2626;
            font-size: 0.8rem;
            margin-top: 0.25rem;
            display: none;
        }

        .error input {
            border-color: #dc2626;
        }

        .error .error-message {
            display: block;
        }
        button {
            background: linear-gradient(90deg, #6366f1, #4f46e5);
            color: #ffffff;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            width: 100%;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            position: relative;
            overflow: hidden;
        }

        button:hover {
            background: linear-gradient(90deg, #4f46e5, #4338ca);
            transform: translateY(-2px);
        }

        button:focus {
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.3);
            outline: none;
        }

        button.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 3px solid #ffffff;
            border-top: 3px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        .col-span-full {
            grid-column: 1 / -1;
        }

        #success-message {
            display: none;
            text-align: center;
            color: #166534;
            font-weight: 500;
            margin-top: 1rem;
            background: #dcfce7;
            padding: 1rem;
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>

<div class="navbar">
       <h3 class="BankingHeading" style="color: white">SAS Bank</h2>
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
        String firstName = (String) session2.getAttribute("firstName");
        String lastName = (String) session2.getAttribute("lastName");
        long phoneNumber = (long) session2.getAttribute("phoneNumber");
        String emailid = (String) session2.getAttribute("email");
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

  
    <div class="form-container">
        <h2>Credit Card Application</h2>
        <form  action="applyforcreditcard" method="POST">
            <div class="form-group">
                <label for="first-name">First Name</label>
                <div class="input-wrapper">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text"  placeholder="John" value=<%=firstName%> name="firstName" required>
                </div>
                <span class="error-message">First name is required</span>
            </div>
            <div class="form-group">
                <label for="last-name">Last Name</label>
                <div class="input-wrapper">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" id="last-name" placeholder="Doe" required value=<%=lastName %> name="lastName">
                </div>
                <span class="error-message">Last name is required</span>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <div class="input-wrapper">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" id="email" placeholder="john@example.com" value=<%=emailid%>  name="emailid" required>
                </div>
                <span class="error-message">Please enter a valid email</span>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <div class="input-wrapper">
                    <i class="fas fa-phone input-icon"></i>
                    <input type="tel" id="phone" placeholder="(123) 456-7890"  value=<%=phoneNumber %> name="phoneNumber" required>
                </div>
                <span class="error-message">Format: (123) 456-7890</span>
            </div>
            <div class="form-group">
                <label for="date-of-birth">Date of Birth</label>
                <div class="input-wrapper">
                    <i class="fas fa-calendar-alt input-icon"></i>
                    <input type="date" id="date-of-birth" placeholder="dd-mm-yyyy" name="dob" required>
                </div>
                <span class="error-message">Format: dd-mm-yyyy</span>
            </div>
            <div class="form-group">
                <label for="account-number">Account Number</label>
                <div class="input-wrapper">
                    <i class="fas fa-credit-card input-icon"></i>
                    <input type="text" id="account-number" placeholder="XXX-XXX-XXXXX"  name="accNo" required>
                </div>
                <span class="error-message">Format: XXX-XXX-XXXXX</span>
            </div>
            <div class="form-group">
                <label for="employment-status">Employment Status</label>
                <div class="input-wrapper">
                    <i class="fas fa-briefcase input-icon"></i>
                    <select id="employment-status" required name="empStatus">
                        <option value="" disabled selected>Select status</option>
                        <option>Employed</option>
                        <option>Unemployed</option>
                        <option>Self-Employed</option>
                    </select>
                </div>
                <span class="error-message">Please select an employment status</span>
            </div>
            <div class="form-group">
                <label for="monthly-income">Monthly Income (₹)</label>
                    <input type="number" id="monthly-income" placeholder="₹ 5000" min="0" required name="monthlyincome">
                <span class="error-message">Please enter a valid income</span>
            </div>
            <div class="form-group col-span-full">
                <button type="submit" id="submit-btn">Submit Application</button>
            </div>
        </form>
        <div id="success-message">Application submitted successfully!</div>
    </div>

    <script>
        const form = document.getElementById('application-form');
        const submitBtn = document.getElementById('submit-btn');
        const successMessage = document.getElementById('success-message');

        form.addEventListener('submit', (e) => {
            e.preventDefault();
            let isValid = true;

            // Reset previous error states
            document.querySelectorAll('.form-group').forEach(group => {
                group.classList.remove('error');
            });

            // Validate inputs
            const inputs = form.querySelectorAll('input, select');
            inputs.forEach(input => {
                const group = input.closest('.form-group');
                if (!input.value) {
                    group.classList.add('error');
                    isValid = false;
                } else if (input.type === 'email' && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(input.value)) {
                    group.classList.add('error');
                    isValid = false;
                } else if (input.pattern && !new RegExp(input.pattern).test(input.value)) {
                    group.classList.add('error');
                    isValid = false;
                }
            });

            if (isValid) {
                submitBtn.classList.add('loading');
                submitBtn.disabled = true;

                // Simulate form submission
                setTimeout(() => {
                    submitBtn.classList.remove('loading');
                    submitBtn.disabled = false;
                    form.style.display = 'none';
                    successMessage.style.display = 'block';
                }, 1500);
            }
        });

        // Real-time validation
        form.querySelectorAll('input, select').forEach(input => {
            input.addEventListener('input', () => {
                const group = input.closest('.form-group');
                if (input.value && (!input.pattern || new RegExp(input.pattern).test(input.value))) {
                    group.classList.remove('error');
                }
            });
        });
    </script>
</body>
</html>