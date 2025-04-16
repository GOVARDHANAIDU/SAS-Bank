<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.SAS.DAO.LoginImp"%>
<%@ page import="java.util.List" %>
<%@page import="com.SAS.DAO.TransactionHistoryImp"%>
<%@page import="com.SAS.DTO.AccountStatement"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPI ID Payment</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
</head>
<style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" 
	 integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">"
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    
     .wrapper {
	    min-height: 85%;
	    display: flex;
	    flex-direction: column;
		}
  	   .footer-buttons {
	    position: fixed;
	    bottom: 0;
	    left: 0;
	    width: 100%;
	    background-color: #f8f8f8;
	    padding: 15px 50px;
	    display: flex;
	    justify-content: space-between;
	    box-shadow: 0 -2px 5px rgba(0,0,0,0.1);
	    z-index: 1000;
		}

     #align{
       width:200px;
       margin-top: 5px;
       text-align: center;
       border:0px;
       color: #8e44ad ;
       margin-bottom: 5px;
       
     }
     #align1{
       width:200px;
       margin-top: 5px;
       margin-bottom: 5px;
       text-align: center;
       border: 0px;
       background-color: #8e44ad;
       color:white;
     }
     #tableContents{
     margin-bottom: -25px;
     }
     .home-btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            padding: 10px 20px;
            font-size: 18px;
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }
        .check-btn {
        position:absolute;
            bottom: 20px;
            left: 20px;
            padding: 10px 20px;
            font-size: 18px;
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.3s;
        }
        .home-btn :hover {
            background: #357ae8;
        }
        .check-btn:hover {
            background: #357ae8;
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
        //String temp_upi = (String) session2.getAttribute("userId");
        //int userId = Integer.parseInt(temp_upi);
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
            <a href="Login.jsp">Login</a>
            <a href="CreateAccount.jsp">Sign Up</a>
        </div>
    </div>
     <div class="wrapper">
    <center>
    <table  class="table-info" id="tablewidth">
            <tr >
                
                <th >Name</th>
                <th >Amount</th>
                <th >Date</th>
                <th >Time</th>
                <th >Type</th>
                <th >Mode</th>
            </tr>
            <br><br>
            <%
            
            int temp_userId = (int) session.getAttribute("userId");       
            TransactionHistoryImp transactionHistoryImp = new TransactionHistoryImp();
            List<AccountStatement> accountStatement = transactionHistoryImp.selectTotalHistory(temp_userId);

                // Iterate over the product list
                for (AccountStatement p : accountStatement) {
                int count = 1;
            %>           
                    <tr>
                        
                        
                        <th ><input value="<%= p.getRecieverUserName() %>" id="align1" name="prod_name" readonly="readonly"></th>
                        <th ><input value="<%= p.getTransactionAmount() %>" id="align1" name="prod_name" readonly="readonly"></th>
                        <td ><input value="<%= p.getDateOfTransaction() %>"  id="align1"  name="prod_price" readonly="readonly"></td>
                        <td ><input value="<%= p.getTimeOfTransaction() %>"  id="align1" name="prod_brand"readonly="readonly"></td>
                        <td ><input value="<%= p.getTypeOfTransaction() %>"  name="prod_discount" id="align1"readonly="readonly"></td>
                        <td ><input value="<%= p.getModeOfTransaction() %>"  name="prod_discount" id="align1"readonly="readonly"></td>
                        
                    </tr>
         
     <% 
    
     }
     %>
        </table>
	      </center>  
	       <div class="footer-buttons">
		      <a href="Home.jsp" class="home-btn">🏠 Home</a>
		      <a href="DisplayBalance.jsp" class="check-btn">🙈 Check Balance</a>
	      </div>
	      
	     </div>
</body>
</html>
