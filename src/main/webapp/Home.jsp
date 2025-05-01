<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAS Bank - Home</title>
    <link rel="stylesheet" href="HomePage.css">
    <link rel="icon" href="https://i.pinimg.com/736x/2a/31/61/2a3161135f001e58c563ef3103221dcd.jpg" type="image/x-icon">
    <style>
		    /* Slideshow Styles */
		.slideshow-container {
		    position: absolute;
		    width: 85%;
		    height: 55%;
		    z-index: -1;
		    top: 0;
		    left: 0;
		    overflow: hidden;
		    margin-top: 80px;
		    margin-left: 130px;
		    background-image: url('https://img.freepik.com/premium-photo/online-banking-concept-with-digital-classic-bank-building-symbol-laptop-monitor-businessman-hands_670147-509.jpg');  
		    background-size: 100%;
		    background-position:center;
		    background-repeat: no-repeat;
		    
		}
		
		.slide {
		    position: absolute;
		    width: 100%;
		    height: 100%;
		    background-size: 100%;
		    background-repeat:no-repeat;
		    background-position: center;
		    border-radius:30px;
		    opacity: 0;
		    transition: opacity 1s ease-in-out;
		}
		
		.slide.active {
		    opacity: 1;
		}
		
		.slide-btn {
		    position: absolute;
		    top: 50%;
		    transform: translateY(-50%);
		    background: rgba(255,255,255,0.7);
		    border: none;
		    border-radius: 50%;
		    width: 40px;
		    height: 40px;
		    font-size: 18px;
		    cursor: pointer;
		    z-index: 2;
		}
		
		.prev-btn {
		    left: 20px;
		}
		
		.next-btn {
		    right: 20px;
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
            animation: typing 7s steps(30, end) forwards;
        }

        .hero {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
            text-align: center;
            margin-top: 280px;
            margin-bottom: 0px;
        }
        .hero { background: url('https://source.unsplash.com/1600x600/?bank') no-repeat center/cover; height: 400px; display: flex; align-items: center; justify-content: center; color: white; font-size: 2em; text-shadow: 2px 2px 5px rgba(0,0,0,0.3); }
        .services, .about, .footer { padding: 40px; text-align: center; }
        .services h2, .about h2 { color: #8e44ad; margin-bottom: 20px; }
        .footer { background: #8e44ad; color: white; height: 0px;}
        
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
           }
        .hero{
        text-shadow: lime;
        }
       
    </style>
</head>
<body>
    <div class="navbar" >
       <h2 class="BankingHeading" style="color: white">SAS Bank</h2>
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
    <div class="slideshow-container">
    <div class="slide active" style="background-size: 100%;"></div>
    <div class="slide" style="background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230322/pngtree-online-banking-concept-with-the-businessman-online-banking-concept-with-businessman-photo-image_2065161.jpg');"></div>
    <div class="slide" style="background-image: url('https://media.istockphoto.com/id/1368593225/photo/businessman-touching-virtual-screen-with-icon-online-banking-online-payments-cyber-security.jpg?s=612x612&w=0&k=20&c=ZaQih8Yl5W6DfBnFsV6-XVWhSIVOBXLeJlmgY2w73SA=');"></div>
    <div class="slide" style="background-image: url('https://thumbs.dreamstime.com/b/business-technology-internet-network-concept-young-man-working-tablet-future-select-virtual-screen-digital-banking-115228806.jpg');"></div>

    <button class="slide-btn prev-btn" onclick="changeSlide(-1)">&#10094;</button>
    <button class="slide-btn next-btn" onclick="changeSlide(1)">&#10095;</button>
</div>
    
    <div class="hero" style="color: #8e44ad;">
    <h2 class="typing-text">Welcome to SAS Bank - Secure & Reliable Banking</h2>
    </div>
    <h2 style="text-align: center; color:#8e44ad; margin-top: -100px;">Our Services</h2>
     <div class="extra-services">
            <div class="service-box"><a href="PersonalBanking.jsp">Personal Banking</a></div>
            <div class="service-box"><a href="">Corporate Banking</a></div>
            <div class="service-box"><a href="#">Additional Service</a></div>
      </div>
    
    <div class="about">
        <h2>About Us</h2>
        <p>SAS Bank is committed to providing secure and innovative banking solutions. Our goal is to make banking seamless and efficient for everyone.</p>
    </div>
        
    <div class="footer">
        <p>&copy; 2025 SAS Bank | All Rights Reserved</p>
    </div>
    
    <script>
    let slides = document.querySelectorAll('.slide');
    let currentSlide = 0;
    let slideInterval = setInterval(nextSlide, 4000);

    function nextSlide() {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % slides.length;
        slides[currentSlide].classList.add('active');
    }

    function changeSlide(n) {
        clearInterval(slideInterval);
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
        slideInterval = setInterval(nextSlide, 4000);
    }
</script>
    
</body>
</html>
