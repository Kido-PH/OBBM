document.addEventListener("DOMContentLoaded", function() {
	var loginImage = document.querySelector(".login-image");

	loginImage.addEventListener("click", function() {
		toggleForm("login");
	});

	var createAccountLink = document.getElementById("createAccountLink");
	createAccountLink.addEventListener("click", function(e) {
		e.preventDefault();
		history.pushState({ form: "register" }, null, "/sign-up");
		toggleForm("register");
	});

	var forgotPasswordLink = document.getElementById("forgotPasswordLink");
	forgotPasswordLink.addEventListener("click", function(e) {
		e.preventDefault();
		history.pushState({ form: "forgotPassword" }, null, "/forgot-password");
		toggleForm("forgotPassword");
	});

	var loginLink = document.getElementById("loginLink");
	loginLink.addEventListener("click", function(e) {
		e.preventDefault();
		history.pushState({ form: "login" }, null, "/login");
		toggleForm("login");
	});

	var loginLinkFromForgot = document.getElementById("loginLinkFromForgot");
	loginLinkFromForgot.addEventListener("click", function(e) {
		e.preventDefault();
		history.pushState({ form: "login" }, null, "/login");
		toggleForm("login");
	});

	window.addEventListener("popstate", function(e) {
		if (e.state && e.state.form) {
			toggleForm(e.state.form, false);
		}
	});

	var currentPath = window.location.pathname;
	if (currentPath === "/sign-up") {
		toggleForm("register", false);
	} else if (currentPath === "/forgot-password") {
		toggleForm("forgotPassword", false);
	} else {
		toggleForm("login", false);
	}
});

function goToRegisterStep2() {
	var step1 = document.getElementById("registerStep1");
	var step2 = document.getElementById("registerStep2");

	var emailInput = document.querySelector('input[name="email"]').value;
	if (emailInput) {
		// Send email to backend for code generation
		fetch("/send-email-code", {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "email=" + encodeURIComponent(emailInput)
		}).then(response => {
			if (response.ok) {
				step1.style.display = "none";
				step2.style.display = "block";
			} else {
				response.json().then(data => {
					document.getElementById("error_receive_code_text").textContent = data.message;
					document.getElementById("error_receive_code").style.display = "block";
				});
			}
		}).catch(error => {
			console.error("Error:", error);
			document.getElementById("error_receive_code_text").textContent = "Failed to send verification code. Please try again.";
			document.getElementById("error_receive_code").style.display = "block";
		});
	}
}

function goToRegisterStep1() {
	var step1 = document.getElementById("registerStep1");
	var step2 = document.getElementById("registerStep2");

	step1.style.display = "block";
	step2.style.display = "none";
}

function toggleForm(targetForm, pushState = true) {
	var loginForm = document.getElementById("loginForm");
	var registerForm = document.getElementById("registerForm");
	var forgotPasswordForm = document.getElementById("forgotPasswordForm");
	var loginImage = document.querySelector(".login-image");

	if (targetForm === "login") {
		loginForm.style.display = "flex";
		registerForm.style.display = "none";
		forgotPasswordForm.style.display = "none";
		loginForm.style.transform = "translateX(77%)";
		loginImage.style.transform = "translateX(-125%)";
	} else if (targetForm === "register") {
		loginForm.style.display = "none";
		registerForm.style.display = "flex";
		forgotPasswordForm.style.display = "none";
		loginImage.style.transform = "translateX(0)";
	} else if (targetForm === "forgotPassword") {
		loginForm.style.display = "none";
		registerForm.style.display = "none";
		forgotPasswordForm.style.display = "flex";
		loginImage.style.transform = "translateX(0)";
	}

	if (pushState) {
		history.pushState({ form: targetForm }, null, `/${targetForm === 'register' ? 'sign-up' : targetForm === 'forgotPassword' ? 'forgot-password' : 'login'}`);
	}
}
