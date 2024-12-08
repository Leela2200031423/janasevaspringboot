<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jana SevaAP - Add Politician</title>
    <link rel="stylesheet" href="style6.css">
    <script>
        function validateForm() {
            // Get form values
            const contact = document.getElementById("pcontact").value;
            const email = document.getElementById("pemail").value;
            const password = document.getElementById("ppwd").value;

            // Regex patterns
            const contactPattern = /^[6-9]\d{9}$/;
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;

            // Validate contact number
            if (!contactPattern.test(contact)) {
                alert("Contact number must be 10 digits and start with 6, 7, 8, or 9.");
                return false;
            }

            // Validate email
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Validate password
            if (!passwordPattern.test(password)) {
                alert("Password must be at least 5 characters long and include an uppercase letter, lowercase letter, digit, and special character.");
                return false;
            }

            // All validations passed
            return true;
        }
    </script>
</head>
<body>
    <div class="sidebar">
         <h1><img src="Resources/images/LOGO.jpg" alt="Logo" class="logo"> Jana SevaAP</h1>
        <nav>
            <a href="#feed" class="nav-item"><i class="icon">📜</i> Feed</a>
            <a href="manager.jsp" class="nav-item"><i class="icon">⚙️</i> Manage</a>
            <a href="viewallcitizens." class="nav-item"><i class="icon">🙍</i>All Citizens</a>
            <a href="viewallpoliticians" class="nav-item"><i class="icon">👁️</i>All Politicians</a>
            <a href="adminlogin" class="nav-item"><i class="icon">➡️</i> Logout</a>
        </nav>
    </div>
    
    <div class="main-content">
        <div class="header">
            <h3>Hi Admin,</h3>
            <p>Now you can perform the actions on politician.</p>
        </div>
        <div class="card-container">
            <div class="form-container">
        <div class="form-title">ADD POLITICIAN</div>
        
        <form:form modelAttribute="politician" method="post" action="insertpolitician" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="pname">NAME</label>
                        <input type="text" id="pname" name="pname" placeholder="Name" required>
                    </div>
                    <div class="form-group">
                        <label for="pdob">DATE OF BIRTH</label>
                        <input type="date" id="pdob" name="pdob" required>
                    </div>
                    <div class="form-group">
                        <label for="pgender">GENDER</label>
                        <div class="gender-options">
                            <input type="radio" id="male" name="pgender" value="Male" required>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="pgender" value="Female" required>
                            <label for="female">Female</label>
                            <input type="radio" id="other" name="pgender" value="Other" required>
                            <label for="other">Other</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pconstituency">CONSTITUENCY</label>
                        <input type="text" id="pconstituency" name="pconstituency" placeholder="Constituency" required>
                    </div>
                    <div class="form-group">
                        <label for="pparty">PARTY</label>
                        <input type="text" id="pparty" name="pparty" placeholder="Party" required>
                    </div>
                    <div class="form-group">
                        <label for="pcategory">CATEGORY</label>
                        <input type="text" id="pcategory" name="pcategory" placeholder="Category" required>
                    </div>
                    <div class="form-group">
                        <label for="pemail">EMAIL ID</label>
                        <input type="email" id="pemail" name="pemail" placeholder="Email ID" required>
                    </div>
                    <div class="form-group">
                        <label for="pcontact">CONTACT NUMBER</label>
                        <input type="text" id="pcontact" name="pcontact" placeholder="Contact Number" required>
                    </div>
                    <div class="form-group">
                        <label for="ppwd">SET PASSWORD</label>
                        <input type="password" id="ppwd" name="ppwd" placeholder="Password" required>
                    </div>
                    <div class="button-group">
                        <button type="submit" class="register-btn">ADD</button>
                        <button type="reset" class="clear-btn">CLEAR</button>
                    </div>
                </form:form>
    </div>
        </div>
    </div>
</body>
</html>
