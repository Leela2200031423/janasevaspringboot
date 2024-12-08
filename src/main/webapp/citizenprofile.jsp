<%@page import="com.klef.jfsd.project.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Citizen cit = (Citizen) session.getAttribute("citizen");
if(cit == null) {
    response.sendRedirect("citizensessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Citizen Profile</title>
    <link rel="stylesheet" href="style7.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <h1><img src="Resources/images/LOGO.jpg" alt="Logo" style="width: 50px;">Jana SevaAP</h1>
                
            </div>
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
            </header>
            
            <h3><u>My Profile</u></h3>
            <div class="profile-card">
                <img src="Resources/images/citizen.jpg" alt="Citizen Photo" class="profile-image">
                <div class="profile-info">
                    <p><strong>ID:</strong> <%= cit.getId() %></p>
                    <p><strong>NAME:</strong> <%= cit.getName() %></p>
                    <p><strong>GENDER:</strong> <%= cit.getGender() %></p>
                    <p><strong>DATE OF BIRTH:</strong> <%= cit.getDataofbirth() %></p>
                    <p><strong>EMAIL:</strong> <%= cit.getEmail() %></p>
                    <p><strong>AADHAAR:</strong> <%= cit.getAadhaarnumber() %></p>
                    <p><strong>CONTACT:</strong> <%= cit.getContact() %></p>
                    <p><strong>STATUS:</strong> <%= cit.getStatus() %></p>
                    
                    <a href="updatecitizenprofile" class="edit-button"  >Edit Profile</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
