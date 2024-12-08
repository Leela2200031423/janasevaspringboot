<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jana SevaAP</title>
    <link rel="stylesheet" type="text/css" href="style.css">
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
    
    <!-- Main Content with Background Image -->
    <div class="content">
        <!-- Leaders Section -->
        <div class="section leaders">
            <img src="Resources/images/leader.png" alt="Leaders Icon" class="icon">
            <h2>LEADERS</h2>
            <p>LEADERS SHAPE THE SOCIETY</p>
            <!-- Get Started Button -->
            <button class="get-started-btn"onclick="window.location.href='politicianlogin'">
                Get Started
                <img src="Resources/images/turn.png" alt="Arrow Icon"> <!-- Replace with actual arrow icon path -->
            </button>
        </div>
        
        <!-- Citizens Section -->
        <div class="section citizens">
            <img src="Resources/images/overpopulation.png" alt="Citizens Icon" class="icon">  
            <h2>CITIZENS</h2>
            <p>CITIZENS CREATE THE SOCIETY</p>
            <!-- Get Started Button -->
            <button class="get-started-btn" onclick="window.location.href='citizenlogin'">
                Get Started
                <img src="Resources/images/turn.png" alt="Arrow Icon"> <!-- Replace with actual arrow icon path -->
            </button>
        </div>
    </div>
</body>
</html>
