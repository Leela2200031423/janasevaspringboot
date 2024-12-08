<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jana SevaAP</title>
    <link rel="stylesheet" href="style9.css">
</head>
<body>
    <div class="container">
       <header>
    <div class="logo">
        <img src="Resources/images/LOGO.jpg" alt="Logo" class="logo-img">
        Jana SevaAP
    </div>
    <div class="header-buttons">
        <button class="party-flag">🚩Party Flag</button>
        <button class="profile-icon" onclick="window.location.href='politicianprofile'">🙍Profile</button>
    </div>
</header>


        <div class="content">
            <nav class="sidebar">
                <button class="back-btn" onclick="window.location.href='politicianhome'">🏠 Home</button>
                <button onclick="window.location.href='viewallreports'">📜 Reports</button>
                <button onclick="window.location.href='viewallfeedbacks'">📩 Feedback</button>
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button onclick="window.location.href='addschemes'">📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin.jsp'">➡️ Logout</button>
            </nav>

            <main>
                <h1>Reports Received</h1>
                <div class="post-card">
                    <img src="Resources/images/road.jpg" alt="Damaged Roads">
                    <div class="post-content">
                        <h2>Damaged Roads Everywhere</h2>
                        <button class="action-btn">View Report</button>
                    </div>
                </div>
                <div class="post-card">
                    <img src="Resources/images/roal.jpg" alt="Medical Facilities">
                    <div class="post-content">
                        <h2>Medical Facilities in Hospitals are not good.</h2>
                        <button class="action-btn">View Report</button>
                    </div>
                </div>
                <button class="show-more">View All Reports</button>
            </main>
        </div>
    </div>
</body>
</html>
