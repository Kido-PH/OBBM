package com.poly.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.Model.DishesDAO;
import com.poly.Service.MenuService;
import com.poly.Entities.Dishes;

@Controller
public class DishesController {
	@Autowired
	DishesDAO dishesDAO;
	@Autowired
	MenuService menuService;

	@GetMapping("/dishes")
	public String dishes(Model model, @RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "category", required = false) String category) {
		// Số phần tử trên mỗi trang
		int pageSize = 6;
		// Tạo trang mới dựa trên số trang và kích thước trang
		Pageable pageable = PageRequest.of(page, pageSize);
		Page<Dishes> listDishes;

		if (category != null && !category.isEmpty() && !category.equalsIgnoreCase("All")) {
			if (category.equalsIgnoreCase("Others")) {
				listDishes = dishesDAO.findOthers(pageable);
			} else {
				listDishes = dishesDAO.findByDanhmuc_Tendanhmuc(category, pageable);
			}
		} else {
			// Lấy danh sách món ăn theo trang
			listDishes = dishesDAO.findAll(pageable);
		}
		// Gán danh sách món ăn vào model
		model.addAttribute("listMonAn", listDishes);
		model.addAttribute("selectedCategory", category);

		return "views/dishes";
	}

	@PostMapping("/dishes/addToMenu")
	public String addToMenu(@RequestParam("mamonan") String mamonan) {
		menuService.addToMenu(mamonan);
		return "redirect:/dishes";
	}
}