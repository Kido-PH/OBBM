package com.poly.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.Entities.Account;
import com.poly.Service.SessionService;

@Controller
public class AccountController {
    @Autowired
    SessionService session;
    
    @GetMapping("/account")
    public String account(Model model) {
        // Lấy thông tin người dùng từ session
        Account loggedInUser = (Account) session.get("user");
        if (loggedInUser != null) {
            // Đặt thông tin người dùng vào model để hiển thị trên trang account.jsp
            model.addAttribute("loggedInUsername", loggedInUser.getTendangnhap());
            model.addAttribute("loggedInEmail", loggedInUser.getEmail());
            return "/views/account";
        } else {
            // Nếu không có người dùng đã đăng nhập, chuyển hướng đến trang đăng nhập
            return "redirect:/login";
        }
    }
    
	@GetMapping("/account/logout")
	public String logout() {
		session.remove("user");
		session.remove("totalCart");
		session.remove("numberCart");
		return "redirect:/";
	}
}
