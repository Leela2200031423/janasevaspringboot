<%@page import="com.klef.jfsd.project.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Politician p = (Politician) session.getAttribute("politician");
if(p == null) {
    response.sendRedirect("politiciansessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Politician Profile</title>
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
            <!-- Sidebar -->
            <nav class="sidebar">
                <button class="back-btn" onclick="window.location.href='politicianhome'">🏠 Home</button>
                <button onclick="window.location.href='viewallreports'">📜 Reports</button>
                <button onclick="window.location.href='viewallfeedbacks'">📩 Feedback</button>
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button onclick="window.location.href='addschemes'">📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin.jsp'">➡️ Logout</button>
            </nav>

            <!-- Main Content -->
            <div class="main-content">
                <div class="profile-container">
                    <h2>Welcome, <%= p.getName() %>😊😊</h2>
                    <h3><u>My Profile</u></h3>
                    <div class="profile-card">
                        <img src="Resources/images/politician.jpg" alt="Politician Photo" class="profile-image">
                        <div class="profile-info">
                            <p><strong>ID:</strong> <%= p.getId() %></p>
                            <p><strong>NAME:</strong> <%= p.getName() %></p>
                            <p><strong>GENDER:</strong> <%= p.getGender() %></p>
                            <p><strong>DATE OF BIRTH:</strong> <%= p.getDataofbirth() %></p>
                            <p><strong>EMAIL:</strong> <%= p.getEmail() %></p>
                            <p><strong>CONSTITUENCY:</strong><%=p.getConstituency() %>
                            <p><strong>CATEGORY:</strong> <%= p.getCategory() %></p>
                            <p><strong>PARTY:</strong> <%= p.getParty() %></p>
                            <p><strong>CONTACT:</strong> <%= p.getContact() %></p>
                            <p><strong>STATUS:</strong> <%= p.getStatus() %></p>
                            <!-- Edit Profile Button -->
                            <a href="updatepoliticianprofile" class="edit-button">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
