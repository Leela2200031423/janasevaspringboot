<%@page import="com.klef.jfsd.project.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jana SevaAP</title>
    <link rel="stylesheet" href="style9.css">
</head>
<body>
    <div class="container">
        <!-- Header Section -->
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

        <!-- Sidebar Section -->
        <div class="content">
            <nav class="sidebar">
                <button class="back-btn" onclick="window.location.href='politicianhome'">🏠 Home</button>
                <button onclick="window.location.href='viewallreports'">📜 Reports</button>
                <button onclick="window.location.href='viewallfeedbacks'">📩 Feedback</button>
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button onclick="window.location.href='addschemes'">📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin.jsp'">➡️ Logout</button>
            </nav>

            <!-- Main Content Section -->
            <main>
                <h1>Welcome, <%= p.getName() %> 😊😊</h1>
                <div class="card-container">
    <!-- Total Reports Card -->
    <div class="info-card">
        <div class="card-header">
            <i class="fas fa-file-alt"></i> <!-- Icon -->
        </div>
        <h2>Total Reports</h2>
        <p><c:out value="${totalReports}"></c:out></p>
    </div>

    <!-- Reports Taken Care Card -->
    <div class="info-card">
        <div class="card-header">
            <i class="fas fa-check-circle"></i> <!-- Icon -->
        </div>
        <h2>Reports Taken Care</h2>
        <p><c:out value="${takenCareReports}"></c:out></p>
    </div>

    <!-- Pending Reports Card -->
    <div class="info-card">
        <div class="card-header">
            <i class="fas fa-clock"></i> <!-- Icon -->
        </div>
        <h2>Pending Reports</h2>
        <p><c:out value="${pendingReports}"></c:out></p>
    </div>
</div>

            </main>
        </div>
    </div>
</body>
</html>
