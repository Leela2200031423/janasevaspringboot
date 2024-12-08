<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Registration</title>
    <link rel="stylesheet" type="text/css" href="style1.css">
    <script>
        function validateForm() {
            // Contact validation: 10 digits and starting with 6, 7, 8, or 9
            var contact = document.getElementById("ccontact").value;
            var contactRegex = /^[6-9]\d{9}$/;
            if (!contactRegex.test(contact)) {
                alert("Contact number must be 10 digits and start with 6, 7, 8, or 9.");
                return false;
            }

            // Email validation: Valid email format
            var email = document.getElementById("cemail").value;
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            // Password validation: Minimum 5 characters, with special character, upper and lowercase letter, and digit
            var password = document.getElementById("cpwd").value;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{5,}$/;
            if (!passwordRegex.test(password)) {
                alert("Password must be at least 5 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character.");
                return false;
            }

            // Aadhaar number validation: Exactly 12 digits
            var aadhaar = document.getElementById("caadhaarno").value;
            if (aadhaar.length !== 12 || isNaN(aadhaar)) {
                alert("Aadhaar number must be exactly 12 digits.");
                return false;
            }

            return true; // If all validations pass
        }
    </script>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="logo">
            <img src="Resources/images/LOGO.jpg" alt="Jana SevaAP Logo" class="logo-img">
            <span>Jana SevaAP</span>
        </div>
        <div class="menu">
            <a href="/">Home</a>
            <a href="citizenlogin">Citizens</a>
            <a href="politicianlogin">Politicians</a>
            <a href="adminlogin">Admin</a>
            <a href="citizenreg">Registration</a>
            <a href="#">Contact Us</a>
        </div>
    </div>
    
    <!-- Registration Form -->
    <div class="form-container">
        <div class="form-title">CITIZEN REGISTRATION</div>
        <c:if test="${not empty message}">
            <div class="${messageType == 'success' ? 'message-success' : 'message-error'}">
                ${message}
            </div>
        </c:if>
        
         <form action="insertcitizen" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="cname">NAME</label>
                <input type="text" id="cname" name="cname" placeholder="Name" required>
            </div>
            <div class="form-group">
                <label for="cdob">DATE OF BIRTH</label>
                <input type="date" id="cdob" name="cdob" required>
            </div>
            <div class="form-group">
                <label for="cgender">GENDER</label>
                <div class="gender-options">
                    <input type="radio" id="male" name="cgender" value="Male" required>
                    <label for="male">Male</label>

                    <input type="radio" id="female" name="cgender" value="Female" required>
                    <label for="female">Female</label>

                    <input type="radio" id="other" name="cgender" value="Other" required>
                    <label for="other">Other</label>
                </div>
            </div>
            <div class="form-group">
                <label for="caadhaarno">AADHAAR NUMBER</label>
                <input type="text" id="caadhaarno" name="caadhaarno" placeholder="Aadhaar Number" required>
            </div>
            <div class="form-group">
                <label for="cemail">EMAIL ID</label>
                <input type="email" id="cemail" name="cemail" placeholder="Email ID" required>
            </div>
            <div class="form-group">
                <label for="ccontact">CONTACT NUMBER</label>
                <input type="text" id="ccontact" name="ccontact" placeholder="Contact Number" required>
            </div>
            <div class="form-group">
                <label for="cpwd">SET PASSWORD</label>
                <input type="password" id="cpwd" name="cpwd" placeholder="Password" required>
            </div>
            <div class="form-group">
                <a href="login.jsp">Already registered?</a>
            </div>
            <div class="button-group">
                <button type="submit" class="register-btn">REGISTER</button>
                <button type="reset" class="clear-btn">CLEAR</button>
            </div>
        </form>
        
    </div>
</body>
</html>
