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
     

    <link rel="stylesheet" href="style14.css">
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
            </header>

            <!-- Schemes Section -->
            <div class="cards-container">
                <c:forEach var="scheme" items="${schemeslist}">
                    <div class="card">
                        <img src="displayprodimage?id=${scheme.id}" alt="Scheme Image">
                        <div class="card-content">
                            <h3>${scheme.title}</h3>
                            <p><strong>Description:</strong> ${scheme.description}</p>
                            <p><strong>Eligibility:</strong> ${scheme.eligibility}</p>
                            <p><strong>Benefits:</strong> ${scheme.benifits}</p>
                            <p><strong>Date:</strong> ${scheme.date}</p>
                            <p><strong>Status:</strong> ${scheme.status}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
