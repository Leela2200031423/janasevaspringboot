<%@ page import="com.klef.jfsd.project.model.Politician"%>
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
    <title>View All Feedbacks</title>
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
                td = tr[i].getElementsByTagName("td")[1]; // Column index for citizen name
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

        function displayPage(page) {
            var table = document.getElementById("myTable");
            var tr = table.getElementsByTagName("tr");
            var totalPages = Math.ceil((tr.length - 1) / rowsPerPage);

            if (page < 1) page = 1;
            if (page > totalPages) page = totalPages;

            currentPage = page;

            for (var i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";
            }
            for (var i = (page - 1) * rowsPerPage + 1; i <= page * rowsPerPage && i < tr.length; i++) {
                tr[i].style.display = "";
            }

            document.getElementById("page-number").innerHTML = "Page " + page + " of " + totalPages;
        }

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

        window.onload = function() {
            displayPage(1);
        };
    </script>
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

        <div class="content-flex">
            <nav class="sidebar">
                <button class="back-btn" onclick="window.location.href='politicianhome'">🏠 Home</button>
                <button onclick="window.location.href='viewallreports'">📜 Reports</button>
                <button onclick="window.location.href='viewallfeedbacks'">📩 Feedback</button>
                <button onclick="window.location.href='politicianprofile'">🌟 My Rating</button>
                <button>📪 My Posts</button>
                <button class="back-btn" onclick="window.location.href='politicianlogin.jsp'">➡️ Logout</button>
            </nav>

            <div class="main-content">
                <div class="profile-container">
                    <h2>Welcome, <%= p.getName() %> 😊😊</h2>
                    <h3><u>View All Feedbacks</u></h3>

                    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Citizen Name">
                    
                    <table align="center" border="2" id="myTable">
                        <tr class="header">
                            <th>ID</th>
                            <th>Citizen Name</th>
                            <th>Constituency</th>
                            <th>Issue Description</th>
                            <th>Rating</th>
                            <th>Suggestions</th>
                        </tr>
                        <c:forEach items="${feedbackList}" var="feedback">
                            <tr>
                                <td><c:out value="${feedback.id}"></c:out></td>
                                <td><c:out value="${feedback.citizenname}"></c:out></td>
                                <td><c:out value="${feedback.constituency}"></c:out></td>
                                <td><c:out value="${feedback.issue}"></c:out></td>
                                <td><c:out value="${feedback.rating}"></c:out></td>
                                <td><c:out value="${feedback.suggestions}"></c:out></td>
                            </tr>
                        </c:forEach>
                    </table>

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
