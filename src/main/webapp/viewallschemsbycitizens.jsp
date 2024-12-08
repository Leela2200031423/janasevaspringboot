<%@page import="com.klef.jfsd.project.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Citizen cit = (Citizen) session.getAttribute("Citizen");
if (cit == null) {
    response.sendRedirect("citizensessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>View All Schemes</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #ffffff;
            overflow-x: hidden;
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100%;
            width: 100%;
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

        .content-flex {
            display: flex;
        }

        .sidebar {
            background: #33cc99;
            width: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            height: 100vh;
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
            flex-direction: column;
            background: #f9f9f9;
        }

        .main-content h2 {
            color: #333;
        }

        #myInput {
            width: 60%;
            padding: 10px;
            margin: 20px auto;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
        }

        #myInput:focus {
            border-color: #ff9933;
        }

        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 15px;
        }

        .card h3 {
            margin: 10px 0;
            color: #333;
        }

        .card p {
            margin: 5px 0;
            color: #555;
        }

        .pagination {
            margin: 20px 0;
            text-align: center;
        }

        .pagination button {
            padding: 8px 16px;
            margin: 0 5px;
            font-size: 1em;
            color: #0056b3;
            background-color: #fff;
            border: 1px solid #0056b3;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .pagination button:hover {
            background-color: #0056b3;
            color: white;
        }
    </style>
    <script>
        let currentPage = 1;
        const rowsPerPage = 6;

        function paginate() {
            const cards = document.querySelectorAll(".card");
            const totalPages = Math.ceil(cards.length / rowsPerPage);

            if (currentPage < 1) currentPage = 1;
            if (currentPage > totalPages) currentPage = totalPages;

            for (let i = 0; i < cards.length; i++) {
                cards[i].style.display =
                    i >= (currentPage - 1) * rowsPerPage && i < currentPage * rowsPerPage
                        ? "block"
                        : "none";
            }

            document.getElementById("page-number").innerText = `Page ${currentPage} of ${totalPages}`;
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                paginate();
            }
        }

        function nextPage() {
            const cards = document.querySelectorAll(".card");
            const totalPages = Math.ceil(cards.length / rowsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                paginate();
            }
        }

        window.onload = paginate;
    </script>
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
                <a href="citizenlogin" class="nav-item"><i class="icon">➡️</i> Logout</a>
            </nav>
        </div>

        <div class="main-content">
            <h2>Welcome, <%= cit.getName() %></h2>
            <input type="text" id="myInput" onkeyup="filterCards()" placeholder="Search Schemes...">

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
                            <a href="viewallschemesbycitizen" class="btn">Apply</a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="pagination">
                <button onclick="prevPage()">Previous</button>
                <span id="page-number"></span>
                <button onclick="nextPage()">Next</button>
            </div>
        </div>
    </div>
</body>
</html>
