<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Login</title>
    <link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="logo">
            <img src="Resources/images/LOGO.jpg" alt="Jana SevaAP Logo" class="logo-img">
            <span>Jana SevaAP</span>
        </div>
        <div class="menu">
            <a href="/">Home</a>
            <a href="citizenlogin">Citizens</a>
            <a href="politicianlogin">Politicians</a>
            <a href="adminlogin">Admin</a>
            <a href="citizenreg">Registration</a>
            <a href="#">Contact Us</a>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Login Form -->
        <div class="form-container">
            <div class="form-title">CITIZEN LOGIN</div>
            <form action="checkcitizenlogin" method="post">
    <div class="form-group">
        <label for="cemail">EMAIL ID</label>
        <span class="icon">&#128231;</span>
        <input type="email" id="cemail" name="cemail" placeholder="Email ID" required />
    </div>
    <div class="form-group">
        <label for="cpwd">PASSWORD</label>
        <span class="icon">&#128274;</span>
        <input type="password" id="cpwd" name="cpwd" placeholder="Password" required />
    </div>
    <div class="form-links">
        <a href="forgotPassword.jsp">Forgot Password?</a>
        <a href="citizenreg.jsp">Don’t have an account?</a>
    </div>
    <div class="button-group">
        <button type="submit" class="login-btn">LOGIN</button>
        <button type="reset" class="clear-btn">CLEAR</button>
    </div>
</form>

        </div>

        <!-- Right Side Image -->
        <div class="right-image">
            <img src="Resources/images/citizen.jpg" alt="Political Meeting">
        </div>
    </div>
</body>
</html>
