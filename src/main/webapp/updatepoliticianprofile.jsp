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
                <button onclick="window.location.href='viewallreports'">📜 Report</button>
                <button>🌟 My Rating</button>
                <button>📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin'">➡️ Logout</button>
            </nav>

            <!-- Main Content -->
            <div class="main-content">
                <div class="profile-container">
                    <h2>Welcome, <%= p.getName() %>😊😊</h2>
                    <h3><u>My Profile</u></h3>

                    <!-- Profile Form to Update Profile Information -->
                    <form action="updatepoliticianprofile" method="post" class="profile-form">
                        <input type="number" name="pid" value="<%= p.getId() %>" />

                        <label>Name:</label>
                        <input type="text" name="pname" value="<%= p.getName() %>" /><br/>

                        <label>Constituency:</label>
                        <input type="text" name="pconstituency" value="<%= p.getConstituency() %>" /><br/>

                        <label>Category:</label>
                        <input type="text" name="pcategory" value="<%= p.getCategory() %>" /><br/>

                        <label>Party:</label>
                        <input type="text" name="pparty" value="<%= p.getParty() %>" /><br/>

                        <label>Email:</label>
                        <input type="email" name="pemail" value="<%= p.getEmail() %>" /><br/>

                        <label>Password:</label>
                        <input type="password" name="ppwd" value="<%= p.getPassword() %>" /><br/>

                        <label>Contact:</label>
                        <input type="text" name="pcontact" value="<%= p.getContact() %>" /><br/>

                        <input type="submit" value="Update Profile" class="submit-btn"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
