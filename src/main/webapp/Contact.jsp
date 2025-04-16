<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.SAS.DTO.BankUserDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.SAS.DAO.AllBankUserDetailsImp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
</head>
<style>
	.contact-container {
	    width: 400px;
	    margin: auto;
	    background: white;
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0 0 8px rgba(0,0,0,0.1);
	    font-family: Arial;
	    background-color: #f4f4f4;
	}
	
	.contact-heading {
	    text-align: center;
	    margin-bottom: 15px;
	}
	
	.contact-form {
	    display: flex;
	    flex-direction: column;
	}
	
	.contact-input {
	    width: 90%;
	    padding: 10px;
	    margin-top: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
        margin-left: 15px;
	}
	
	.verified {
	    color: green;
	    margin-top: 10px;
	    display: flex;
	    align-items: center;
	}
	
	.verified img {
	    width: 20px;
	    height: 20px;
	    margin-right: 10px;
	}
	
	.submit-button {
	    background-color: #8e44ad;
	    color: white;
	    border: none;
        width: 80%;
        text-align: center;
	    margin-top: 15px;
	    padding: 10px;
	    border-radius: 5px;
	    margin-left: 30px;
	}

   .userNameBox {
    width: 400px;
    height: 50px;
    border-radius: 5px;
    background-color: #8e44ad;
    color: white;
    padding: 10px;
    margin-bottom: 10px;
    position: relative;
    cursor: pointer;
	}
	
	.userNameText {
	    float: left;
	    padding-left: 10px;
	    padding-top: 8px;
	}
	
	.userPhone {
	    width: fit-content;
	    height:10px;
	    float: right;
	    padding-right: 10px;
	    padding-top: 6px;  
	}
	   
	.userPhone :hover {
	text-decoration: underline;
	background-color: #D1E6DD;
	color:black;
    }
	.user-entry :hover {
	background-color: #D1E6DD;
	color:black;
   }
   .error-message-top {
	width: 300px;
    color: red;
    font-weight: bold;
    background-color: none;
    margin-bottom: -20px;
    margin-left: 650px;
    border-radius: 8px;
   }
</style>
<body>
<div class="navbar">
        <h3 class="BankingHeading" style="color: white">SAS Bank</h3>
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
    <br><br><br>
<div class="contact-container">
    <h2 class="contact-heading">Send Money via Contact</h2>
    <form action="CheckContactServlet" class="contact-form" id="phoneDisplay">
        <input type="text" id="searchInput" name="phone" class="contact-input" placeholder="Search by Name or Phone..." onkeyup="filterContacts()" autocomplete="off" required>
        <input type="submit" class="submit-button" value="Send Money">
    </form>
</div>
<br>
	<% String error = (String) request.getAttribute("error");
			 if (error != null) { %>
			    <div >
			        <p class="error-message-top"> &#10006;<%= error %></p>
			    </div>
			<% } %>
<br><br>

   <<div id="userList">
	<%
	    AllBankUserDetailsImp allBankUserDetailsImp = new AllBankUserDetailsImp();
	    List<BankUserDetails> list = allBankUserDetailsImp.SelectAllBankUserDetails();
	    for(BankUserDetails allDetails : list) {
	%>
    <center class="user-entry">
        <div class="userNameBox">
            <span class="userNameText"><%= allDetails.getUserName() %></span>
            <div class="userPhone" onclick="fillNumber('<%= allDetails.getPhoneNumber() %>')">
                <%= allDetails.getPhoneNumber() %>
            </div>
        </div>
    </center>
<% } %>

</div>

</body>
<script>
function fillNumber(phone) {
    const input = document.getElementById("searchInput");
    input.value = phone;
    input.focus();
}

function filterContacts() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const entries = document.querySelectorAll(".user-entry");

    entries.forEach(entry => {
        const name = entry.querySelector(".userNameText").textContent.toLowerCase();
        const phone = entry.querySelector(".userPhone").textContent.toLowerCase();

        if (name.includes(input) || phone.includes(input)) {
            entry.style.display = "";
        } else {
            entry.style.display = "none";
        }
    });
}
</script>



</html>
