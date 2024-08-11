package com.poly.Controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.Entities.Account;
import com.poly.Entities.Role;
import com.poly.Mail.MailerServiceImpl;
import com.poly.Model.AccountDAO;
import com.poly.Model.RoleDAO;
import com.poly.Service.SessionService;

import jakarta.mail.MessagingException;
import org.springframework.mail.MailSendException;

@Controller
public class LoginController {
	@Autowired
	AccountDAO dao;
	@Autowired
	RoleDAO Rdao;

	@Autowired
	SessionService session;

	@Autowired
	MailerServiceImpl mail;

	private int verificationCode;

	@GetMapping("/login")
	public String showLoginPage(Model model) {
		model.addAttribute("form", "login");
		return "/views/login";
	}

	@GetMapping("/sign-up")
	public String showSignUpPage(Model model) {
		model.addAttribute("account", new Account());
		model.addAttribute("form", "register");
		return "/views/login";
	}

	@GetMapping("/forgot-password")
	public String showForgotPasswordPage(Model model) {
		model.addAttribute("form", "forgotPassword");
		return "/views/login";
	}

	@PostMapping("/login")
	public String postLogin(Model model, @RequestParam("tenDangNhap") String tenDangNhap,
			@RequestParam("matKhau") String matKhau) {
		String forward = "index";

		if (tenDangNhap.isEmpty()) {
			forward = "/views/login";
			model.addAttribute("error_login_username", "Username cannot be empty!");
			model.addAttribute("tenDangNhap", tenDangNhap);
		} else if (matKhau.isEmpty()) {
			forward = "/views/login";
			model.addAttribute("error_login_password", "Password cannot be empty!");
			model.addAttribute("tenDangNhap", tenDangNhap);
		} else {
			List<Account> accounts = dao.findByTendangnhap(tenDangNhap);
			if (accounts.isEmpty()) {
				forward = "/views/login";
				model.addAttribute("error_login_username", "Username does not exist!");
				model.addAttribute("tenDangNhap", tenDangNhap);
			} else {
				Account account = accounts.get(0);
				if (!account.getMatkhau().equals(matKhau)) {
					forward = "/views/login";
					model.addAttribute("error_login_password", "Password is incorrect!");
					model.addAttribute("tenDangNhap", tenDangNhap);
				} else {
					session.set("user", account);
				}
			}
		}
		return forward;
	}

	@PostMapping("/forgot-password")
	public String postResetpass(Model model, @RequestParam("username") String username) throws MessagingException {
		List<Account> accounts = dao.findByTendangnhap(username);
		if (username.equals("")) {
			model.addAttribute("error_forgot_username", "Username cannot be empty!");
		} else if (accounts.isEmpty()) {
			model.addAttribute("username", username);
			model.addAttribute("error_forgot_username", "Username does not exist!");
		} else {
			Account account = accounts.get(0);
			verificationCode = new Random().nextInt(999999);
			String resetLink = "http://localhost:8080/reset-password/" + username + "/" + verificationCode;
			mail.queue(account.getEmail(), "Password change", resetLink);
			model.addAttribute("success_forgot_username", "Password change link has been sent to your email!");
			model.addAttribute("form", "forgotPassword");
		}

		return "/views/login";
	}

	@GetMapping("/reset-password/{username}/{otp}")
	public String getResetPassword(Model model, @PathVariable("username") String username,
			@PathVariable("otp") Integer otp) {
		List<Account> accounts = dao.findByTendangnhap(username);
		if (!accounts.isEmpty() && otp.equals(verificationCode)) {
			model.addAttribute("username", username);
			return "/views/resetpass";
		}

		return "/views/login";
	}

	@PostMapping("/reset-password/{username}")
	public String postResetPassword(Model model, @PathVariable("username") String username,
			@RequestParam("password") String password, @RequestParam("confirm") String confirm) {
		List<Account> accounts = dao.findByTendangnhap(username);
		if (!accounts.isEmpty()) {
			if (password.isEmpty()) {
				model.addAttribute("error_resetPassword_password", "Password cannot be empty!");
			} else if (confirm.isEmpty()) {
				model.addAttribute("error_resetPassword_confirm", "Confirm Password cannot be empty!");
			} else if (!confirm.equals(password)) {
				model.addAttribute("error_resetPassword_confirm", "Confirm password does not match!");
			} else {
				Account account = accounts.get(0);
				account.setMatkhau(password);
				dao.save(account);
				model.addAttribute("success_resetPassword", "Password reset successful!");
				verificationCode = 0;
			}
			return "/views/resetpass";
		}
		return "/views/login";
	}

	@PostMapping("/sign-up")
	public String postRegister(Model model, @Validated @ModelAttribute("account") Account account, BindingResult result,
			@RequestParam("confirm") String confirm, @RequestParam("email-code") int emailCode) {
		model.addAttribute("form", "register");

		if (result.hasErrors()) {
			return "/views/login";
		}

		if (emailCode != verificationCode) {
			model.addAttribute("error_signup_code", "Invalid verification code!");
			return "/views/login";
		}

		if (!account.getMatkhau().equals(confirm)) {
			model.addAttribute("error_signup_confirm", "Confirm password does not match!");
			return "/views/login";
		}

		List<Account> accounts = dao.findByTendangnhap(account.getTendangnhap());

		if (!accounts.isEmpty()) {
			model.addAttribute("error_signup_username", "Username already exists!");
			return "/views/login";
		}

		account.setNgaytao(new Date());

		Role defaultRole = Rdao.findById(2).orElse(null);
		account.setRole(defaultRole);
		account.setIsdeleted(false);
		dao.save(account);

		model.addAttribute("success_signup", "Registration successful! Please check your email for verification.");

		return "redirect:/login";
	}

	@PostMapping("/send-email-code")
	public String sendEmailCode(Model model, @RequestParam("email") String email) {
		if (email == null || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
			model.addAttribute("error_signup_email", "Invalid email address!");
			model.addAttribute("form", "register");
			return "/views/login";
		}

		try {
			verificationCode = new Random().nextInt(999999);
			mail.queue(email, "Your verification code", String.valueOf(verificationCode));
			model.addAttribute("form", "register");
			model.addAttribute("emailSent", true);
		} catch (MailSendException e) {
			model.addAttribute("error_signup_email", "Failed to send verification email. Please try again.");
			model.addAttribute("form", "register");
		}

		return "/views/login";
	}
}