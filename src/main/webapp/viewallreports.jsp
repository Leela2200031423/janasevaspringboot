<%@page import="com.klef.jfsd.project.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Politician p = (Politician) session.getAttribute("politician");
if (p == null) {
    response.sendRedirect("politiciansessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Reports</title>
    <link rel="stylesheet" href="style13.css">
    <script>
        // Filter function for the search input
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        // Pagination settings
        const rowsPerPage = 5;
        let currentPage = 1;

        // Function to display rows based on the current page
        function displayPage(page) {
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            var totalPages = Math.ceil((tr.length - 1) / rowsPerPage);
            
            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;

            currentPage = page;

            // Hide all rows, then display only the relevant ones for the current page
            for (var i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
            }
            for (var i = (page - 1) * rowsPerPage + 1; i <= page * rowsPerPage && i < tr.length; i++) {
                tr[i].style.display = "";
            }

            // Update pagination controls
            document.getElementById("page-number").innerHTML = "Page " + page + " of " + totalPages;
        }

        // Function to handle page navigation
        function prevPage() {
            if (currentPage > 1) {
                displayPage(currentPage - 1);
            }
        }

        function nextPage() {
            var table = document.getElementById("myTable");
            var totalPages = Math.ceil((table.getElementsByTagName("tr").length - 1) / rowsPerPage);
            if (currentPage < totalPages) {
                displayPage(currentPage + 1);
            }
        }

        // Initialize pagination on page load
        window.onload = function() {
            displayPage(1);
        };
    </script>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
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

        <!-- Flex container to align sidebar and main content -->
        <div class="content-flex">
            <!-- Sidebar Section -->
            <nav class="sidebar">
                <button class="back-btn" onclick="window.location.href='politicianhome'">🏠 Home</button>
                <button onclick="window.location.href='viewallreports'">📜 Reports</button>
                <button onclick="window.location.href='viewallfeedbacks'">📩 Feedback</button>
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button onclick="window.location.href='addschemes'">📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin.jsp'">➡️ Logout</button>
            </nav>

            <!-- Main Content Section -->
            <div class="main-content">
                <div class="profile-container">
                    <h2>Welcome, <%= p.getName() %>😊😊</h2>
                    <h3><u>View All Reports</u></h3>
                    
                    <!-- Search Input Field -->
                    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Report Location">
                    
                    <!-- Table to Display Reports -->
                    <table align="center" border="2" id="myTable">
                        <tr class="header">
                            <th>ID</th>
                            <th>Title</th>
                            <th>City</th>
                            <th>Location</th>
                            <th>Description</th>
                            <th>PDF</th>
                            <th>STATUS</th>
                            <th>CHARGE</th>
                        </tr>
                        
                        <!-- Loop through each report and display its details -->
                        <c:forEach items="${reportlist}" var="report">
                            <tr>
                                <td><c:out value="${report.id}"></c:out></td>
                                <td><c:out value="${report.title}"></c:out></td>
                                <td><c:out value="${report.city}"></c:out></td>
                                <td><c:out value="${report.location}"></c:out></td>
                                <td><c:out value="${report.description}"></c:out></td>
                                <td>
                                    <a href="displayreportpdf?id=${report.id}" target="_blank">
                                        <img src="Resources/images/pdf.png" width="20" height="20" alt="Download PDF">
                                    </a>
                                </td>
                                <td><c:out value="${report.status}"></c:out></td>
                                <td>
    <a href='<c:url value="updaterstatus?id=${report.id}&status=Accepted"></c:url>' class="accept-button">Take Care</a>
</td>
                            </tr>
                        </c:forEach>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="pagination-controls">
                        <button onclick="prevPage()">Previous</button>
                        <span id="page-number"></span>
                        <button onclick="nextPage()">Next</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
