<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jana SevaAP - Add Citizen</title>
    <link rel="stylesheet" href="style6.css">
    <script>
        function validateForm() {
            // Get form values
            const contact = document.getElementById("ccontact").value;
            const email = document.getElementById("cemail").value;
            const password = document.getElementById("cpwd").value;
            const aadhaar = document.getElementById("caadhaarno").value;

            // Regex patterns
            const contactPattern = /^[6-9]\d{9}$/;
            const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;
            const aadhaarPattern = /^\d{12}$/;

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

            // Validate Aadhaar number
            if (!aadhaarPattern.test(aadhaar)) {
                alert("Aadhaar number must be exactly 12 digits.");
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
            <a href="viewallcitizens" class="nav-item"><i class="icon">🙍</i>All Citizens</a>
            <a href="viewallpoliticians" class="nav-item"><i class="icon">👁️</i>All Politicians</a>
            <a href="adminlogin" class="nav-item"><i class="icon">➡️</i> Logout</a>
        </nav>
    </div>
    
    <div class="main-content">
        <div class="header">
            <h3>Hi Admin,</h3>
            <p>Now you can perform the actions on citizens.</p>
        </div>
        <div class="card-container">
            <div class="form-container">
        <div class="form-title">ADD CITIZEN</div>
        
        <form action="insertcitizens" method="post" onsubmit="return validateForm()">
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
                    <div class="button-group">
                        <button type="submit" class="register-btn">ADD</button>
                        <button type="reset" class="clear-btn">CLEAR</button>
                    </div>
                </form>
    </div>
        </div>
    </div>
</body>
</html>
