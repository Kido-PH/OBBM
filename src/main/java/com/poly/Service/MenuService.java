package com.poly.Service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.Entities.Customer;
import com.poly.Entities.Dishes;
import com.poly.Entities.Menu;
import com.poly.Entities.MenuDetail;
import com.poly.Model.DishesDAO;
import com.poly.Model.MenuDAO;
import com.poly.Model.MenuDetailDAO;

@Service
public class MenuService {
	@Autowired
	private MenuDAO menuDAO;
	
	@Autowired
	private MenuDetailDAO menuDetailDAO;
	
	@Autowired
	private DishesDAO dishesDAO;
	
	@Autowired
	private SessionService session;
	
	public void addToMenu(String mamonan) {
		Menu currentMenu = (Menu) session.get("currentMenu", Menu.class);
		
		if(currentMenu == null) {
			currentMenu = new Menu();
			currentMenu.setNgaytao(new Date());
			currentMenu.setKhachhang(session.get("user", Customer.class)); // Liên kết với khách hàng
			menuDAO.save(currentMenu);
			session.set("currentMenu", currentMenu);
		}
		
		Dishes dish = dishesDAO.findById(mamonan).orElseThrow(() -> new IllegalArgumentException("Invalid dish ID: " + mamonan));
		
		MenuDetail detail = new MenuDetail();
		detail.setThucdon(currentMenu);
		detail.setMonan(dish);
		detail.setSoluongmonan(1);
		detail.setDongiamonan(dish.getGia());
		
		menuDetailDAO.save(detail);
	}
}
