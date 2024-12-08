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
    <link rel="stylesheet" href="style11.css">
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

            <!-- Report Form Section -->
            <div class="complaints-section">
                <h3>Add Report</h3>
                <c:if test="${not empty message}">
            <div class="${messageType == 'success' ? 'message-success' : 'message-error'}">
                ${message}
            </div>
            
            <!-- Prompt for Feedback After Success -->
                    <c:if test="${messageType == 'success'}">
                        <div class="feedback-prompt">
                            <p>Thank you for submitting your report.Please submit the feedback after few days that helps use to address your issue efficiently</p>
                            
                        </div>
                    </c:if>
        </c:if>

                <form action="insertreport" method="post" enctype="multipart/form-data" class="form-container">
                    <table align="center">
    <tr>
        <td><label>Title</label></td>
        <td><input type="text" name="title" required="required"/></td>
    </tr>
    <tr>
        <td><label>City</label></td>
        <td><input type="text" name="city" required="required"/></td>
    </tr>
    <tr>
        <td><label>Location</label></td>
        <td><input type="text" name="location" required="required"/></td>
    </tr>
    <tr>
        <td><label>Description</label></td>
        <td><textarea name="description"></textarea></td>
    </tr>
    <tr>
        <td><label>PDF File</label></td>
        <td><input type="file" name="reportpdf" accept="application/pdf" required="required"/></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="submit" value="Add" class="button">
            <input type="reset" value="Clear" class="button reset-button">
        </td>
    </tr>
</table>

                </form>
            </div>
        </div>
    </div>
</body>
</html>
