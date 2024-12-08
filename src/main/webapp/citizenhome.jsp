<%@page import="com.klef.jfsd.project.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Citizen cit = (Citizen) session.getAttribute("citizen");
if(cit == null) {
    response.sendRedirect("citizensessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jana SevaAP - Citizen Dashboard</title>
    <link rel="stylesheet" href="style7.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h1><img src="Resources/images/LOGO.jpg" alt="Logo" class="logo">Jana SevaAP</h1>
            <nav>
                <a href="reporthome" class="nav-item"><i class="icon">📩</i> Report</a>
                <a href="feedbackform" class="nav-item"><i class="icon">📜</i> Feedback</a>
                <a href="citizenprofile" class="nav-item"><i class="icon">👤</i> Profile</a>
                <a href="viewreports" class="nav-item"><i class="icon">👁️</i>My Reports</a>
                <a href="viewallschemes" class="nav-item"><i class="icon">👍</i>All Posts</a>
                <a href="citizenlogin" class="nav-item"><i class="icon">➡️</i> Logout</a>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <header>
                <h2>Hi Citizen, Welcome <%= cit.getName() %></h2>
                <div class="header-icons">
                    <i class="icon-user"></i>
                </div>
            </header>

            <!-- Dashboard Cards -->
            <div class="dashboard">
                <div class="card report-card">
                    <h2>REPORTS</h2>
                    <span class="count"><c:out value="${reportCount}"></c:out></span>
                </div>
                
            </div>

            <!-- Complaint Cards -->
            <div class="complaints-section">
                <div class="complaint-card">
                    <img src="Resources/images/road.jpg" alt="Damaged Roads" class="complaint-image">
                    <div class="complaint-content">
                        <h3>Damaged Roads Everywhere</h3>
                        <p>Pavement failure depends on a number of causes including water intrusion, stress from heavy loads, and climate effects.</p>
                        <button class="details-button">Report</button>
                    </div>
                </div>

                <div class="complaint-card">
                    <img src="Resources/images/roal.jpg" alt="Medical Facilities" class="complaint-image">
                    <div class="complaint-content">
                        <h3>Medical Facilities in Hospitals are not good.</h3>
                        <p>One of the most common problems in hospitals is a lack of communication between staff members.</p>
                        <button class="details-button" >Report</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
