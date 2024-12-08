<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Politician</title>
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
           <h3><u>View All Politician</u></h3>
           Total Politicians = <c:out value="${politiciancount}"></c:out>
           <table>
               <tr>
                   <th>ID</th>
                   <th>NAME</th>
                   <th>DATE OF BIRTH</th>
                   <th>GENDER</th>
                   <th>EMAIL</th>
                   <th>CONSTITUENCY</th>
                   <th>CATEGORY</th>
                   <th>PARTY</th>
                   <th>CONTACT</th>
                   <th>STATUS</th>
                   <th>ACTION</th>
               </tr>
               <c:forEach items="${polilist}" var="politician">
                   <tr>
                       <td><c:out value="${politician.id}"></c:out></td>
                       <td><c:out value="${politician.name}"></c:out></td>
                       <td><c:out value="${politician.dataofbirth}"></c:out></td>
                       <td><c:out value="${politician.gender}"></c:out></td>
                       <td><c:out value="${politician.email}"></c:out></td>
                       <td><c:out value="${politician.constituency}"></c:out></td>
                       <td><c:out value="${politician.category}"></c:out></td>
                       <td><c:out value="${politician.party}"></c:out></td>
                       <td><c:out value="${politician.contact}"></c:out></td>
                       <td><c:out value="${politician.status}"></c:out></td>
                       <td>
       
       <a href='<c:url value="updatepstatus?id=${politician.id}&status=Active"></c:url>'class="accept-button">Active</a>
       <a href='<c:url value="updatepstatus?id=${politician.id}&status=Inactive"></c:url>'class="reject-button">Inactive</a>
         
           </td>
                   </tr>
               </c:forEach>
           </table>
        </div>
    </div>
</body>
</html>
