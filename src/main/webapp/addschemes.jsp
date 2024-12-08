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
    <title>Add Schemes</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body, html {
            height: 100%;
            background: #f4f4f4;
            overflow-x: hidden;
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100%;
            width: 100%;
            background: linear-gradient(to right, #fff7e8, #fff7e8);
        }

        header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #ff9933;
            padding: 10px 20px;
            color: #fff;
            font-weight: bold;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 1.5em;
        }

        .logo-img {
            width: 40px;
            height: auto;
            margin-right: 10px;
        }

        .header-buttons button {
            background: #fff;
            color: #ff9933;
            border: none;
            padding: 8px;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
        }

        .content {
            display: flex;
            flex: 1;
        }

        .sidebar {
            background: #33cc99;
            width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
        }

        .sidebar button {
            background: none;
            border: none;
            color: #fff;
            font-size: 1.1em;
            padding: 15px;
            margin: 5px 0;
            cursor: pointer;
            width: 80%;
            text-align: center;
            border-radius: 5px;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .add-schemes-container {
            width: 80%;
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-out;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        h3 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="date"], textarea, input[type="file"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 5px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="date"]:focus, textarea:focus, input[type="file"]:focus {
            border-color: #007bff;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .message {
            text-align: center;
            font-weight: bold;
        }

        .message.success {
            color: green;
        }

        .message.error {
            color: red;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .submit-btn {
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    background-color: #007bff;
    color: white;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    transition: all 0.3s ease-in-out;
    width: 100%;
}

.submit-btn:hover {
    background-color: #0056b3;
    transform: scale(1.1);
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
}
        
    </style>
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
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button onclick="window.location.href='addschemes'">📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogout'">➡️ Logout</button>
            </nav>

            <!-- Main Content -->
            <div class="main-content">
                <div class="add-schemes-container">
                    <h2>Welcome, <%= p.getName() %>😊😊</h2>
                    <h3><u>Add New Scheme</u></h3>

                    <!-- Form to Add a Scheme -->
                    <form action="insertschemes" method="post" enctype="multipart/form-data">
                    <input type="text" name="title" placeholder="Scheme Title" required>
                        <textarea name="description" placeholder="Scheme Description" required></textarea>
                        <input type="text" name="eligibility" placeholder="Eligibility" required>
                        <input type="text" name="benifits" placeholder="Benefits" required>
                        <input type="date" name="date" placeholder="Date" required>
                        <input type="file" name="schemesimage"  required>
                        <input type="submit" value="Submit Scheme" class="submit-btn">

                    </form>

                    <br/>
                    <div class="message success">
                        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                    </div>
                    <div class="message error">
                        <%= request.getAttribute("messageType") != null && request.getAttribute("messageType").equals("error") ? "Please fill in all fields correctly." : "" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
