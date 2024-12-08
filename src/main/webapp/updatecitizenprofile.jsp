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
    <title>Jana SevaAP - Citizen Dashboard</title>
    <link rel="stylesheet" href="style12.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h1><img src="Resources/images/LOGO.jpg" alt="Logo" class="logo">Jana SevaAP</h1>
            <nav>
                <a href="reporthome" class="nav-item"><i class="icon">📩</i> Report</a>
                <a href="#" class="nav-item"><i class="icon">📜</i> Feedback</a>
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


            <!-- Report Form Section -->
            <div class="complaints-section">
                <h3 align="center">Update Profile</h3>
                
                <!-- Success/Error Message -->
                <c:if test="${not empty message}">
    <div class="${messageType == 'success' ? 'message-success' : 'message-error'}">
        ${message}
    </div>
</c:if>

                 
        <div class="form-container" >
                <form method="post" action="updatecitizenprofile" >
          <table>
              <tr>
                  <td><label for="cid">Citizen ID</label></td>
                  <td><input type="number" id="cid" name="cid" readonly value="<%= cit.getId() %>" required/></td>
              </tr>
              <tr>
                  <td><label for="cname">Citizen Name</label></td>
                  <td><input type="text" id="cname" name="cname" value="<%= cit.getName() %>" required/></td>
              </tr>
              <tr>
                  <td><label>Select Gender</label></td>
                  <td>
                      <input type="radio" id="male" name="cgender" value="MALE" <%= cit.getGender().equals("MALE") ? "checked" : "" %> required/>
                      <label for="male">Male</label>
                      <input type="radio" id="female" name="cgender" value="FEMALE" <%= cit.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                      <label for="female">Female</label>
                      <input type="radio" id="others" name="cgender" value="OTHERS" <%= cit.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                      <label for="others">Others</label>
                  </td>
              </tr>
              <tr>
                  <td><label for="cdob">Enter Date of Birth</label></td>
                  <td><input type="date" id="cdob" name="cdob" value="<%= cit.getDataofbirth() %>" required/></td>
              </tr>
      
              <tr>
                  <td><label for="caadhaar">Enter Aadhaar</label></td>
                  <td><input type="text" id="caadhaar" name="caadhaar" value="<%= cit.getAadhaarnumber() %>"  readonly required/></td>
              </tr>
              <tr>
                  <td><label for="cemail">Enter Email ID</label></td>
                  <td><input type="email" id="cemail" name="cemail" readonly value="<%= cit.getEmail() %>" required/></td>
              </tr>
              <tr>
                  <td><label for="cpwd">Enter Password</label></td>
                  <td><input type="password" id="cpwd" name="cpwd" value="<%= cit.getPassword() %>" required/></td>
              </tr>
              <tr>
                  <td><label for="ccontact">Enter Contact</label></td>
                  <td><input type="number" id="ccontact" name="ccontact" value="<%= cit.getContact() %>" required/></td>
              </tr>
              <tr>
                  <td colspan="2" class="button-container">
                      <input type="submit" value="Update"/>
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
