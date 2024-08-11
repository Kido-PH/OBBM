<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Reset Password</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css" />
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<style type="text/css">
.rsp-image {
    width: 55%;
    background:
        url("${pageContext.request.contextPath}/assets/images/Login-image.jpg")
        no-repeat center center/cover;
    cursor: pointer;
    position: absolute;
    top: 0;
    border-radius: 20px;
    bottom: 0;
    right: -12%;
}
</style>
</head>

<body>
    <div class="login-container">
        <div class="login-form" id="resetPasswordForm">
            <h1>Reset Password</h1>
            <!-- Step 2: Setup New Password -->
            <form novalidate="novalidate" id="validate_new_password_form" action="${pageContext.request.contextPath}/reset-password/${username}" method="post">
                <input type="password" placeholder="New Password"
                    name="password" required /> 
                        <c:if test="${not empty error_resetPassword_password}">
                           <div class="form-text text-danger">${error_resetPassword_password}</div>
                        </c:if>                    
                <input type="password" placeholder="Confirm New Password"
                    name="confirm" required /> 
                        <c:if test="${not empty error_resetPassword_confirm}">
                          <div class="form-text text-danger">${error_resetPassword_confirm}</div>
                        </c:if>
                        <c:if test="${not empty success_resetPassword}">
                          <div class="form-text text-success">${success_resetPassword}</div>
                        </c:if>
                <input type="submit" value="Reset Password" />
            </form>
            <div class="register-link"><a style="text-decoration: none" href="${pageContext.request.contextPath}/login">Return to Login</a></div>
        </div>

        <div class="rsp-image"
            style="
                    width: 55%;
                    background: url('${pageContext.request.contextPath}/assets/images/Login-image.jpg') no-repeat center
                    center/cover;
            "></div>
    </div>

    <script>
        // Function to switch form
        function toggleForm(formName) {
            if (formName === "login") {
                window.location.href = "login"; // Chuyển về trang Login.jsp
            }
        }
    </script>

</body>
</html>
