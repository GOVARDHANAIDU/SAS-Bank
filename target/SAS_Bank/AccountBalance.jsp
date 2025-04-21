<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Check Balance</title>
  <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
  <style>
    body {
      background: linear-gradient(135deg, #8e44ad, #3498db);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      font-family: Arial, sans-serif;
      color: white;
    }

    .container {
      width:350px;
      background: white;
      padding: 30px;
      border-radius: 10px;
      color: #333;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
      text-align: center;
    }

    .balance {
      font-size: 28px;
      margin-top: 20px;
      color: green;
    }

    .home-link {
      position: fixed;
      bottom: 20px;
      right: 20px;
      text-decoration: none;
      background: white;
      color: #8e44ad;
      padding: 10px 20px;
      border-radius: 5px;
      font-weight: bold;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }

    .home-link:hover {
      background: #8e44ad;
      color: white;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>SAS Bank</h2>
    <p>Your current balance is:</p>
    <div class="balance" id="balance">Loading...</div>
  </div>

  <a class="home-link" href="Home.jsp">🏠 Home</a>

  <%
    HttpSession session2 = request.getSession();
    String emailid = (String)session2.getAttribute("email");
    if (emailid == null) {
        response.sendRedirect("login.jsp");
        return;
    }
  %>

  <script>
    const email = "<%= emailid %>";

    fetch(`GetBalanceServlet?email=${encodeURIComponent(email)}`)
      .then(response => {
        if (!response.ok) throw new Error("Network response was not ok");
        return response.json();
      })
      .then(data => {
        if (data && typeof data.balance === "number") {
          document.getElementById("balance").textContent = `₹ ${data.balance.toFixed(2)}`;
        } else {
          document.getElementById("balance").textContent = "Balance not found.";
        }
      })
      .catch(error => {
        console.error("Error:", error);
        document.getElementById("balance").textContent = "Unable to fetch balance.";
      });
  </script> 
</body>
</html>
