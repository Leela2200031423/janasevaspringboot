<%@page import="com.klef.jfsd.project.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Jana SevaAP - Citizen Feedback</title>
    <link rel="stylesheet" href="style12.css">
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

            <!-- Feedback Form Section -->
            <div class="complaints-section">
                <h3 align="center">Submit Feedback</h3>
                
                <!-- Success/Error Message -->
                <c:if test="${not empty message}">
                    <div class="${messageType == 'success' ? 'message-success' : 'message-error'}">
                        ${message}
                    </div>
                </c:if>

                <div class="form-container">
                    <form method="post" action="insertfeedback">
                        <table>
                            <tr>
                                <td><label for="citizenname">Citizen Name</label></td>
                                <td><input type="text" id="citizenname" name="citizenname" readonly value="<%= cit.getName() %>" required/></td>
                            </tr>
                            <tr>
                                <td><label for="constituency">Constituency</label></td>
                                <td><input type="text" id="constituency" name="constituency" placeholder="Enter Constituency" required/></td>
                            </tr>
                            <tr>
                                <td><label for="issue">Issue Description</label></td>
                                <td><textarea id="issue" name="issue" rows="4" placeholder="Describe the issue" required></textarea></td>
                            </tr>
                            <tr>
                                <td><label for="rating">Rating</label></td>
                                <td>
                                    <select id="rating" name="rating" required>
                                        <option value="">Select Rating</option>
                                        <option value="1">1 - Very Poor</option>
                                        <option value="2">2 - Poor</option>
                                        <option value="3">3 - Average</option>
                                        <option value="4">4 - Good</option>
                                        <option value="5">5 - Excellent</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="suggestions">Suggestions</label></td>
                                <td><textarea id="suggestions" name="suggestions" rows="3" placeholder="Provide suggestions" required></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="button-container">
                                    <input type="submit" value="Submit Feedback"/>
                                    <input type="reset" value="Clear"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
