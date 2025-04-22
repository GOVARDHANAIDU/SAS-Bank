<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAS Bank - Secure Login</title>
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
        body { background: #f4f4f4; }
        
        .navbar { 
            background: #8e44ad; 
            padding: 15px; 
            display: flex; 
            align-items: center; 
        }
        .navbar h1 { color: white; margin-right: 30px; }
        .nav-links { 
            display: flex; 
            align-items: center;
            gap: 20px;
        }
        .nav-links a { 
            color: white; 
            text-decoration: none; 
            font-weight: bold; 
            padding: 8px;
        }
        .nav-links a:hover {
            text-decoration: underline;
        }
        
        /* PIN Entry */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
        }
        .pin-display {
            font-size: 24px;
            letter-spacing: 8px;
            margin-bottom: 20px;
        }
        .keypad {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            width: 220px;
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
            background: navy;
            color: white;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            font-size: 24px;
        }
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
        .spinner {
	      border: 5px solid #f3f3f3;
	      border-top: 5px solid teal;
	      border-radius: 50%;
	      width: 60px;
	      height: 60px;
	      animation: spin 1s linear infinite;
	      margin-top:-19%;
	      margin-left:48%;
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
    </div>

    <div class="container">
        <h2>Enter Your PIN</h2>
        <div class="pin-display" id="pinDisplay">_ _ _ _</div>
        <div class="keypad">
            <button onclick="enterPin('1')">1</button>
            <button onclick="enterPin('2')">2</button>
            <button onclick="enterPin('3')">3</button>
            <button onclick="enterPin('4')">4</button>
            <button onclick="enterPin('5')">5</button>
            <button onclick="enterPin('6')">6</button>
            <button onclick="enterPin('7')">7</button>
            <button onclick="enterPin('8')">8</button>
            <button onclick="enterPin('9')">9</button>
            <button onclick="deletePin()">&#9003;</button>
            <button onclick="enterPin('0')">0</button>
            <button class="tick-btn" onclick="submitPin()">&#8626;</button>
        </div>
    </div>
    <div id="loading">
    <div class="spinner"></div>
    </div>
    <script>
    let pin = "";
    function enterPin(num) {
        if (pin.length < 4) {
            pin += num;
            updateDisplay();
        }
    }
    function deletePin() {
        pin = pin.slice(0, -1);
        updateDisplay();
    }
    function updateDisplay() {
        let dots = "";
        for (let i = 0; i < 4; i++) {
            dots += i < pin.length ? ". " : "_ ";
        }
        document.getElementById("pinDisplay").innerHTML = dots;
    }
    function submitPin() {
        if (pin.length === 4) {
            // Show the spinner
            document.getElementById("loading").style.display = "block";

            fetch('CheckBalance', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'pin=' + encodeURIComponent(pin)
            })
            .then(response => response.text())
            .then(data => {
                // Hide the spinner once we get a response
                document.getElementById("loading").style.display = "none";

                console.log(data.trim());
                if (data.trim() === 'valid') {
                    window.location.href = "AccountBalance.jsp";
                } else {
                    alert("Invalid PIN. Please try again.");
                    pin = "";
                    updateDisplay();
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById("loading").style.display = "none";
                alert("Something went wrong. Please try again.");
            });
        } else {
            alert("Please enter a 4-digit PIN");
        }
    }
    
</script>
    
</body>
</html>
