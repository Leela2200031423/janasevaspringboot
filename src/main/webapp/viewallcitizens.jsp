<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Citizens</title>
    <link rel="stylesheet" href="style10.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">
                <img src="Resources/images/LOGO.jpg" alt="Jana SevaAP Logo" />
                <h2>Jana SevaAP</h2>
            </div>
            <ul>
                <li><a href="adminhome" class="nav-item"><i class="icon">📜</i> Feed</a></li>
                <li><a href="manager" class="nav-item"><i class="icon">⚙️</i> Manage</a></li>
                <li><a href="viewallcitizens" class="nav-item"><i class="icon">🙍</i> All Citizens</a></li>
                <li><a href="viewallpoliticians" class="nav-item"><i class="icon">👁️</i> All Politicians</a></li>
                <li><a href="adminlogin" class="nav-item"><i class="icon">➡️</i> Logout</a></li>
            </ul>
        </div>
        
        <div class="main-content">
           <h3><u>View All Citizens</u></h3>
           Total Citizens = <c:out value="${citizencount}"></c:out>
           
           <table>
               <tr>
                   <th>ID</th>
                   <th>NAME</th>
                   <th>DATE OF BIRTH</th>
                   <th>GENDER</th>
                   <th>AADHAAR NUMBER</th>
                   <th>EMAIL</th>
                   <th>CONTACT</th>
                   <th>STATUS</th>
                   <th>ACTION</th>
               </tr>
               <c:forEach items="${citlist}" var="citizen">
                   <tr>
                       <td><c:out value="${citizen.id}"></c:out></td>
                       <td><c:out value="${citizen.name}"></c:out></td>
                       <td><c:out value="${citizen.dataofbirth}"></c:out></td>
                       <td><c:out value="${citizen.gender}"></c:out></td>
                       <td><c:out value="${citizen.aadhaarnumber}"></c:out></td>
                       <td><c:out value="${citizen.email}"></c:out></td>
                       <td><c:out value="${citizen.contact}"></c:out></td>
                       <td><c:out value="${citizen.status}"></c:out></td>
                       <td>
    <a href='<c:url value="updatestatus?id=${citizen.id}&status=Accepted"></c:url>' class="accept-button">Accept</a>
    <a href='<c:url value="updatestatus?id=${citizen.id}&status=Rejected"></c:url>' class="reject-button">Reject</a>
</td>

                   </tr>
               </c:forEach>
           </table>
        </div>
    </div>
</body>
</html>
