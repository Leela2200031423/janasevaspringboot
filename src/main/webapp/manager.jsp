<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jana SevaAP - Admin Dashboard</title>
    <link rel="stylesheet" href="style5.css">
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
        </div>
        
        <div class="card-container">
            <div class="card">
                <img src="Resources/images/citizen1.png" alt="Add Citizen" class="card-image">
                <h3>Add Citizen</h3>
                <button class="card-button" onclick="window.location.href='addcitizen.jsp'">Add Citizen</button>
            </div>
            <div class="card">
                <img src="Resources/images/candidate.png" alt="Add Politician" class="card-image">
                <h3>Add Politician</h3>
                <button class="card-button" onclick="window.location.href='addpolitician.jsp'">Add Politician</button>
            </div>
            <div class="card">
                <img src="Resources/images/speaker.png" alt="Add Moderator" class="card-image">
                <h3>Add Moderator</h3>
                <button class="card-button" onclick="window.location.href='addmoderator.jsp'">Add Moderator</button>
            </div>
        </div>
    </div>
</body>
</html>
