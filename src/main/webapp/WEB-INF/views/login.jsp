<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authentication</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css" />
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <div class="login-container">
        <div class="login-form" id="loginForm"
            style="display: ${form eq 'login' ? 'flex' : 'none'};">
            <h1>Log in</h1>
            <form novalidate="novalidate" id="validate_login_form"
                action="${pageContext.request.contextPath}/login" method="post">
                <input type="text" placeholder="Username" name="tenDangNhap"
                    value="${tenDangNhap != null ? tenDangNhap : ''}" />
                <c:if test="${not empty error_login_username}">
                    <div class="error">
                        <span class="custom-icon"></span>${error_login_username}</div>
                </c:if>
                <input type="password" placeholder="Password" name="matKhau" />
                <c:if test="${not empty error_login_password}">
                    <div class="error">
                        <span class="custom-icon"></span>${error_login_password}</div>
                </c:if>
                <input type="submit" value="Login" />
            </form>
            <div class="social-login">
                <a href="#" class="google-login"
                    style="background-image: url('${pageContext.request.contextPath}/assets/images/icon-google.png')">Sign
                    in with Google</a> <a href="#" class="facebook-login"
                    style="background-image: url('${pageContext.request.contextPath}/assets/images/icon-fb.webp')">Sign
                    in with Facebook</a>
            </div>
            <div class="forgot-password" id="forgotPasswordLink">Forgot
                Password</div>
            <div class="register-link">
                <a href="#" id="createAccountLink"
                    style="text-decoration: none; color: rgba(59, 89, 152, 0.8)">
                    Don't have an account? <span style="font-weight: 700">Create</span>
                    one
                </a>
            </div>
        </div>
        
        <div class="login-form" id="registerForm"
            style="display: ${form eq 'register' ? 'flex' : 'none'};">
            <h1>Register</h1>
            <form id="validate_register_form"
                action="${pageContext.request.contextPath}/sign-up" method="post">
                <div id="registerStep1">
                    <input type="text" placeholder="Username" name="tendangnhap"
                        required /> 
                    <input type="text" placeholder="Email" name="email"
                        required /> 
                    <input type="button" value="Receive Code"
                        onclick="goToRegisterStep2()" />
                    <c:if test="${not empty error_signup_username}">
                        <div class="error">
                            <span class="custom-icon"></span>${error_signup_username}</div>
                    </c:if>
                    <c:if test="${not empty error_signup_email}">
                        <div class="error">
                            <span class="custom-icon"></span>${error_signup_email}</div>
                    </c:if>
                    <!-- Error message div for Receive Code -->
                    <div class="error" id="error_receive_code" style="display:none;">
                        <span class="custom-icon"></span><span id="error_receive_code_text"></span>
                    </div>
                </div>
                <div id="registerStep2" style="display: none">
                    <input type="text" placeholder="Verification Code"
                        name="email-code" required
                        title="Please enter a 6-digit code" />
                    <c:if test="${not empty error_signup_code}">
                        <div class="error">
                            <span class="custom-icon"></span>${error_signup_code}</div>
                    </c:if>
                    <input type="password"
                        placeholder="Password" name="matkhau" required />
                    <input type="password" placeholder="Confirm Password" name="confirm"
                        required />
                    <c:if test="${not empty error_signup_confirm}">
                        <div class="error">
                            <span class="custom-icon"></span>${error_signup_confirm}</div>
                    </c:if>
                    <input type="submit" value="Register" />
                    <!-- Button to go back to step 1 -->
                    <input type="button" value="Back" onclick="goToRegisterStep1()" />
                </div>
            </form>
            <div class="social-login">
                <a href="#" class="google-login"
                    style="background-image: url('${pageContext.request.contextPath}/assets/images/icon-google.png')">Sign
                    up with Google</a> <a href="#" class="facebook-login"
                    style="background-image: url('${pageContext.request.contextPath}/assets/images/icon-fb.webp')">Sign
                    up with Facebook</a>
            </div>
            <div class="register-link" id="loginLink">Return to Login</div>
        </div>

        <div class="login-form" id="forgotPasswordForm"
            style="display: ${form eq 'forgotPassword' ? 'flex' : 'none'};">
            <h1>Forgot Password</h1>
            <h4>Enter your username.</h4>
            <form novalidate="novalidate" id="validate_password_reset_form"
                action="${pageContext.request.contextPath}/forgot-password"
                method="post">
                <input type="text" placeholder="Username" name="username" required />
                <c:if test="${not empty error_forgot_username}">
                    <div class="error">
                        <span class="custom-icon"></span>${error_forgot_username}</div>
                </c:if>
                <input type="submit" value="Find User" />
            </form>
            <div class="register-link" id="loginLinkFromForgot">
                <a style="text-decoration: none"
                    href="${pageContext.request.contextPath}/login">Return to Login</a>
            </div>
        </div>

        <div class="login-image"
            style="width: 55%; background: url('${pageContext.request.contextPath}/assets/images/Login-image.jpg') no-repeat center center/cover; cursor: pointer; transition: transform 0.5s; position: absolute; top: 0; border-radius: 20px; bottom: 0; right: -12%;"
            onclick="toggleForm()"></div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Kiểm tra nếu có thông báo thành công
            var successMessage = "<c:out value='${success_forgot_username}'/>";
            if (successMessage) {
                Swal.fire({
                    icon : 'success',
                    title : 'Success!',
                    text : successMessage
                });
            }
        });
    </script>
</body>
</html>
