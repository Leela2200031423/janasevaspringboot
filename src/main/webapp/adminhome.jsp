<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jana SevaAP - Admin Dashboard</title>
    <link rel="stylesheet" href="style4.css">
</head>
<body>
    <div class="sidebar">
         <h1><img src="Resources/images/LOGO.jpg" alt="Logo" class="logo"> Jana SevaAP</h1>
        <nav>
            <a href="adminhome" class="nav-item"><i class="icon">📜</i> Feed</a>
            <a href="manager" class="nav-item"><i class="icon">⚙️</i> Manage</a>
            <a href="viewallcitizens" class="nav-item"><i class="icon">🙍</i>All Citizens</a>
            <a href="viewallpoliticians" class="nav-item"><i class="icon">👁️</i>All Politicians</a>
            <a href="adminlogin" class="nav-item"><i class="icon">➡️</i> Logout</a>
        </nav>
    </div>
    
    <div class="main-content">
        <div class="header">
            <h2>Hi Admin,</h2>
            <p>Now you can perform the actions between politicians and citizens.</p>
           <!-- Dashboard Cards -->
            <div class="dashboard">
                <div class="card report-card">
                    <h2>CITIZENS</h2>
                    <span class="count"><c:out value="${citizencount}"></c:out></span>
                </div>
                <div class="card feedback-card">
                    <h2>POLITICIANS</h2>
                    <span class="count"><c:out value="${politiciancount}"></c:out></span>
                </div>
            </div>
        </div>
        
        <div class="complaint-card">
            <img src="Resources/images/road.jpg" alt="Damaged Roads" class="complaint-image">
            <div class="complaint-content">
                <h3>Damaged Roads Everywhere</h3>
                <p>Pavement failure depends on a number of causes including water intrusion, stress from heavy loads, and all the climate effects.</p>
                <button class="details-button">View Details</button>
            </div>
        </div>

        <div class="complaint-card">
            <img src="Resources/images/roal.jpg" alt="Medical Facilities" class="complaint-image">
            <div class="complaint-content">
                <h3>Medical Facilities in Hospitals are not good.</h3>
                <p>One of the most common problems in hospitals is a lack of communication between staff members.</p>
                <button class="details-button">View Details</button>
            </div>
        </div>
    </div>
</body>
</html>
