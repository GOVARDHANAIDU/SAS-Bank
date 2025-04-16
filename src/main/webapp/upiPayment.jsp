<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPI Payment</title>
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5-qrcode/2.3.8/html5-qrcode.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; text-align: center; }
        .container { max-width: 400px; margin: 50px auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        select, button { width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: 1px solid #ccc; }
        button { background: #8e44ad; color: white; border: none; cursor: pointer; }
        button:hover { background: #732d91; }
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
        body { background: #f4f4f4; }
        .navbar { background: #8e44ad; padding: 15px; display: flex; justify-content: space-between; align-items: center; position: relative; }
        .navbar h1 { color: white; }
        .nav-links { display: flex; align-items: center; }
        .nav-links a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; position: relative; }
        .auth-links { margin-left: auto; }
        .auth-links a { color: white; text-decoration: none; margin: 0 10px; font-weight: bold; }
        
        /* Dropdown Menu */
        .dropdown {
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background: white;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            border-radius: 5px;
            top: 30px;
            left: 0;
            width: 180px;
            z-index: 1;
        }
        .dropdown-content a {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            transition: 0.3s;
        }
        .dropdown-content a:hover {
            background: #8e44ad;
            color: white;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
       /* Typing Effect */
        @keyframes typing {
            from { width: 0; }
            to { width: 100%; }
        }

        .typing-text {
            font-size: 25px;
            font-weight: bold;
            white-space: nowrap;
            overflow: hidden;
            width: 0;
            display: inline-block;
            text-align: center;
            animation: typing 3s steps(30, end) forwards;
        }

        .hero {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
            text-align: center;
        }
        .hero { background: url('https://source.unsplash.com/1600x600/?bank') no-repeat center/cover; height: 400px; display: flex; align-items: center; justify-content: center; color: white; font-size: 2em; text-shadow: 2px 2px 5px rgba(0,0,0,0.3); }
        .services, .about, .footer { padding: 40px; text-align: center; }
        .services h2, .about h2 { color: #8e44ad; margin-bottom: 20px; }
        .footer { background: #8e44ad; color: white; }
        
          .services-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            align-items: center;
            max-width: 800px;
        }
        .service-box {
            width: 250px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: 0.3s;
        }
        .service-box:hover {
            transform: scale(1.05);
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.15);
        }
        .service-box a { text-decoration: none; color: #8e44ad; font-weight: bold; }
        .extra-services {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        .navbar{
        width: 100%;
        height: 50px;
        }
        .hero{
        text-shadow: lime;
        }
        
    </style>
</head>
<body>
<div class="navbar">
        <h2 class="BankingHeading" style="color: white">SAS Bank</h2>
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
           
           <div style="background-color: transparent; float: left; "> <a href="Login.jsp" style=" align-content: center;">Login</a> </div>
           <div style="background-color: transparent; float: left;"> <a href="CreateAccount.jsp"style="margin-top:30px" >Sign Up</a>  </div>
        </div>
    </div>
    
    <div class="container">
    <h2>Select Payment Mode</h2>
    <form id="paymentForm" action="PaymentRouterServlet">
        <select name="paymentMode" id="paymentMode">
            <option value="upiid">UPI ID</option>
            <option value="contact">Contact</option>
            <option value="qr">QR Code</option>
        </select>
        <button type="submit">Proceed</button>
    </form>

    </div>   
    
</body>
</html>
