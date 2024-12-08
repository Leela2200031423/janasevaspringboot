<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Reports</title>
    <link rel="stylesheet" href="style7.css"> <!-- External CSS -->
    <style>
    /* Button Styling */
        .btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .btn:active {
            transform: translateY(0);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        overflow: hidden;
        transform: scale(1);
        transition: transform 0.3s ease-in-out;
    }

    table:hover {
        transform: scale(1.02);
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: lightgreen;
        color: white;
        font-size: 16px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    tr {
        background-color: #f9f9f9;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    tr:hover {
        background-color: #e3f2fd;
        transform: scale(1.02);
    }

    td {
        font-size: 14px;
        color: #333;
    }
</style>

</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h1><img src="Resources/images/LOGO.jpg" alt="Logo" class="logo" onclick="window.location.href='citizenhome'">Jana SevaAP</h1>
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
                <h1>Your Reports</h1>
            </header>

            <c:choose>
                <c:when test="${empty reports}">
                    <div class="message">You have not submitted any reports yet.</div>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>City</th>
                                <th>Location</th>
                                <th>Description</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${reports}" var="report">
                                <tr>
                                    <td>${report.title}</td>
                                    <td>${report.city}</td>
                                    <td>${report.location}</td>
                                    <td>${report.description}</td>
                                    <td>${report.status}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>

            <div style="text-align: center; margin: 20px;">
                <a href="reporthome" class="btn">Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>
