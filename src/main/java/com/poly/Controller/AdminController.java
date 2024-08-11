package com.poly.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.Entities.Account;
import com.poly.Entities.Category;
import com.poly.Entities.Dishes;
import com.poly.Entities.Role;
import com.poly.Model.AccountDAO;
import com.poly.Model.CategoryDAO;
import com.poly.Model.DishesDAO;
import com.poly.Model.RoleDAO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.validation.Valid;

@Controller
@MultipartConfig
public class AdminController {

	@Autowired
	AccountDAO accDao;

	@Autowired
	CategoryDAO cateDao;

	@Autowired
	DishesDAO dishesDAO;

	@Autowired
	ServletContext app;

	@Autowired
	RoleDAO roleDao;

	@ModelAttribute("categories")
	public List<Category> categories() {
		return cateDao.findAll();
	}

	@ModelAttribute("accountList")
	public List<Account> accountList() {
		return accDao.findAll();
	}

	@ModelAttribute("dishes")
	public List<Dishes> dishes() {
		return dishesDAO.findAll();
	}

	@GetMapping("/admin/dishes")
	public String listDishes(Model model, @ModelAttribute("dishesEdit") Dishes dish,
			@RequestParam("name") Optional<String> name) {
		String searchName = name.orElse("");
		List<Dishes> list = dishesDAO.searchByTenmonan(searchName);
		model.addAttribute("dishes", list);
		model.addAttribute("name", searchName);

		List<Category> categories = cateDao.findAll();
		model.addAttribute("categories", categories);

		return "/views/admin/dishes-list";
	}

	@GetMapping("/admin/dishes-create")
	public String showCreateForm(Model model) {
		model.addAttribute("dishesCreate", new Dishes());
		List<Category> categories = cateDao.findAll();
		model.addAttribute("categories", categories);
		return "views/admin/dishes-create"; // or the appropriate view name
	}

	@PostMapping("/admin/dishes/create")
	public String createDish(@Validated @ModelAttribute("dishesCreate") Dishes dish, BindingResult result,
			@RequestParam("image") Optional<MultipartFile> file, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("error_dish_create", true);
			return "redirect:/admin/dishes";
		} else {
			if (file.isPresent() && !file.get().getOriginalFilename().equals("")) {
				String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
				try {
					// Lấy đường dẫn thực tế đến thư mục webapp/assets/images
					Path path = Paths
							.get("src/main/webapp/assets/images/" + fileName);

					// Tạo thư mục nếu không tồn tại
					if (Files.notExists(path.getParent())) {
						Files.createDirectories(path.getParent());
					}

					// Ghi file vào thư mục
					Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					dish.setHinhanh(fileName);
					System.out.println("Image uploaded: " + fileName);
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("Failed to upload image: " + fileName);
				}
			} else {
				dish.setHinhanh("default.jpg"); // Set a default image if no file is provided
				System.out.println("No image uploaded, set to default.jpg");
			}

			try {
				dishesDAO.save(dish);
				System.out.println("Dish saved: " + dish.toString());
				redirectAttributes.addFlashAttribute("success_dish_create", true);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Failed to save dish: " + dish.toString());
			}
		}
		return "redirect:/admin/dishes";
	}

	@GetMapping("/admin/dishes/delete/{id}")
	public String deleteDish(@PathVariable("id") String id, RedirectAttributes redirectAttributes) {
		if (dishesDAO.existsById(id)) {
			Dishes dish = dishesDAO.findById(id).get();
			dish.setIsdeleted(true);
			dishesDAO.save(dish);
			redirectAttributes.addFlashAttribute("success_dish_delete", true);
		} else {
			redirectAttributes.addFlashAttribute("error_dish_delete", true);
		}
		return "redirect:/admin/dishes";
	}

	@PostMapping("/admin/dishes/edit")
	public String editDish(@Validated @ModelAttribute("dishesEdit") Dishes dish, BindingResult result,
			@RequestParam("image") Optional<MultipartFile> file, RedirectAttributes redirectAttributes) {
		if (!dishesDAO.existsById(dish.getMamonan())) {
			redirectAttributes.addFlashAttribute("error_dish_update", true);
			return "redirect:/admin/dishes";
		} else {
			Dishes existingDish = dishesDAO.findById(dish.getMamonan()).get();

			if (file.isPresent() && !file.get().getOriginalFilename().equals("")) {
				String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
				try {
					Path path = Paths.get(app.getRealPath("/assets/images/" + fileName));
					Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					dish.setHinhanh(fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				dish.setHinhanh(existingDish.getHinhanh());
			}

			dishesDAO.save(dish);
			redirectAttributes.addFlashAttribute("success_dish_update", true);
		}
		return "redirect:/admin/dishes";
	}

	@GetMapping("/admin/user")
	public String user(Model model, @ModelAttribute("userEdit") Account account,
			@RequestParam("name") Optional<String> name) {
		String searchName = name.orElse("");
		List<Account> list = accDao.searchByTendangnhap(searchName);

		model.addAttribute("accountList", list);
		model.addAttribute("name", searchName);

		List<Role> roles = roleDao.findAll();
		model.addAttribute("roles", roles);

		return "/views/admin/user-list";
	}

	@GetMapping("/admin/user-create")
	public String showCreateUserForm(Model model) {
		model.addAttribute("userCreate", new Account());
		List<Role> roles = roleDao.findAll();
		model.addAttribute("roles", roles);
		return "/views/admin/user-create";
	}

	@PostMapping("/admin/user/create")
	public String createUser(@Valid @ModelAttribute("userCreate") Account account, BindingResult result,
			@RequestParam("image") Optional<MultipartFile> file, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("error_user_create", true);
			return "redirect:/admin/user/create";
		} else {
			// Xử lý ảnh
			if (file.isPresent() && !file.get().getOriginalFilename().equals("")) {
				String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
				try {
					// Lấy đường dẫn thực tế đến thư mục webapp/assets/images/avatars
					Path uploadPath = Paths
							.get("src/main/webapp/assets/images/avatars/"+fileName);

					// Tạo thư mục nếu không tồn tại
					if (!Files.exists(uploadPath)) {
						Files.createDirectories(uploadPath);
					}

					Path filePath = uploadPath.resolve(fileName);

					// Ghi file vào thư mục
					Files.copy(file.get().getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
					account.setHinhanh(fileName);
					System.out.println("Image uploaded: " + fileName);
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("Failed to upload image: " + fileName);
				}
			} else {
				// Đặt ảnh mặc định nếu không có ảnh được upload
				account.setHinhanh("default.jpg");
				System.out.println("No image uploaded, set to default.jpg");
			}

			// Đặt ngày tạo là ngày hiện tại
			account.setNgaytao(new Date());

			try {
				// Lưu thông tin người dùng
				accDao.save(account);
				System.out.println("User saved: " + account.toString());
				redirectAttributes.addFlashAttribute("success_user_create", true);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Failed to save user: " + account.toString());
			}
		}
		return "redirect:/admin/user";
	}

	@GetMapping("/admin/user/delete/{id}")
	public String user_delete(@ModelAttribute("userEdit") Account account, @PathVariable("id") Integer id, Model model,
			RedirectAttributes redirectAttributes) {
		if (accDao.existsById(id)) {
			Account acc = accDao.findById(id).get();
			acc.setIsdeleted(true);
			accDao.save(acc);
			redirectAttributes.addFlashAttribute("success_user_delete", true);
		} else {
			redirectAttributes.addFlashAttribute("error_user_delete", true);
		}
		return "redirect:/admin/user";
	}

	@PostMapping("/admin/user/edit")
	public String user_update(@Validated @ModelAttribute("userEdit") Account account, BindingResult result,
			@RequestParam("image") Optional<MultipartFile> file, RedirectAttributes redirectAttributes) {
		if (!accDao.existsById(account.getTaikhoanid())) {
			redirectAttributes.addFlashAttribute("error_user_update", true);
			return "redirect:/admin/user";
		} else {
			// Lấy thông tin hiện tại của người dùng từ cơ sở dữ liệu
			Account existingAccount = accDao.findById(account.getTaikhoanid()).get();

			// Giữ lại ngày tạo hiện tại
			account.setNgaytao(existingAccount.getNgaytao());

			// Xử lý ảnh
			if (file.isPresent() && !file.get().getOriginalFilename().equals("")) {
				String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
				// save the file on the local file system
				try {
					Path path = Paths.get(app.getRealPath("assets/avatars/" + fileName));
					Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					account.setHinhanh(fileName); // Đặt lại tên file cho tài khoản
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				// Giữ lại ảnh hiện tại nếu không có ảnh mới được upload
				account.setHinhanh(existingAccount.getHinhanh());
			}

			// Lưu thông tin người dùng
			accDao.save(account);
			redirectAttributes.addFlashAttribute("success_user_update", true);
		}
		return "redirect:/admin/user";
	}

	@GetMapping("/admin/category")
	public String product(Model model, @ModelAttribute("categoryEdit") Category category,
			@RequestParam("name") Optional<String> name) {
		String searchName = name.orElse("");
		List<Category> list = cateDao.searchByTendanhmuc(searchName);

		model.addAttribute("categoryList", list);
		model.addAttribute("name", searchName);

		return "/views/admin/category-list";
	}

	@PostMapping("/admin/category/delete/{id}")
	public String deleteCategory(@PathVariable("id") Integer categoryId, RedirectAttributes redirectAttributes) {
		try {
			if (cateDao.existsById(categoryId)) {
				cateDao.deleteById(categoryId);
				redirectAttributes.addFlashAttribute("success_category_delete", true);
			} else {
				redirectAttributes.addFlashAttribute("error_category_delete", true);
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("warning_category_delete", true);
		}

		return "redirect:/admin/category";
	}

	@PostMapping("/admin/category/edit")
	public String updateCategory(@ModelAttribute("categoryEdit") @Validated Category category, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			// Nếu có lỗi, quay lại form chỉnh sửa category để sửa lỗi
			return "category-edit";
		}
		// Lưu thông tin category vào cơ sở dữ liệu
		cateDao.save(category);
		redirectAttributes.addFlashAttribute("success_category_update", true);
		return "redirect:/admin/category";
	}

	@GetMapping("/admin/category-create")
	public String add_category(Model model) {
		model.addAttribute("categoryCreate", new Category());
		return "/views/admin/category-create";
	}

	@PostMapping("/admin/category-create")
	public String createCategory(@Valid @ModelAttribute("categoryCreate") Category category, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			redirectAttributes.addFlashAttribute("error_category_create", true);
			return "redirect:/admin/category";
		} else {
			try {
				cateDao.save(category);
				redirectAttributes.addFlashAttribute("success_category_create", true);
			} catch (Exception e) {
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("error_category_create", true);
			}
		}
		return "redirect:/admin/category";
	}

//
//	@GetMapping("/admin/product/delete/{id}")
//	public String product_delete(@ModelAttribute("productEdit") Product product, @PathVariable("id") Integer id,
//			Model model) {
//		if (proDao.existsById(id)) {
//			Product pro = proDao.findById(id).get();
//			pro.setIsDelete(true);
//			proDao.save(pro);
//			model.addAttribute("success_product_delete", true);
//		} else
//			model.addAttribute("error_product_delete", true);
//		return "admin/product-list";
//	}
//
//	@PostMapping("/admin/product/edit")
//	public String product_update(@Validated @ModelAttribute("productEdit") Product product, BindingResult result,
//			Model model, @RequestParam("categoryId") String caId) {
//		if (!proDao.existsById(product.getId()))
//			model.addAttribute("error_product_update", true);
//		else {
//			product.setImage(proDao.findById(product.getId()).get().getImage());
//			product.setCategory(caDao.findById(caId).get());
//			product.setIsDelete(!product.getIsDelete());
//			proDao.save(product);
//			model.addAttribute("success_product_update", true);
//		}
//		return "admin/product-list";
//	}
//
//	@GetMapping("/admin/order")
//	public String order(Model model, @RequestParam("id") Optional<Long> id) {
//		if (id.orElse((long) 0) != 0) {
//			List<Order> list = new ArrayList<>();
//			list.add(orDao.findById(id.orElse((long) 0)).get());
//			model.addAttribute("orderList", list);
//		}
//		model.addAttribute("id", (id.orElse((long) 0) == 0) ? "" : id.orElse((long) 0));
//		return "admin/order-list";
//	}
//

//
//	@PostMapping("/admin/add-product")
//	public String add_product_post(Model model, @ModelAttribute("productAdd") Product product,
//			@RequestParam("images") MultipartFile[] files, @RequestParam("categoryId") String categoryId) {
//		String imgs = "";
//		for (MultipartFile file : files) {
//			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
//			// save the file on the local file system
//			try {
//				Path path = Paths.get(app.getRealPath("/assets/img/product/" + fileName));
//				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//				imgs += (fileName + ",");
//			} catch (IOException e) {
//				e.printStackTrace();
//				model.addAttribute("error_product_add", true);
//			}
//		}
//		product.setCategory(caDao.findById(categoryId).get());
//		product.setImage(imgs.substring(0, imgs.length() - 1));
//		proDao.save(product);
//		model.addAttribute("success_product_add", true);
//		return "admin/add-product";
//	}
//

//	@ModelAttribute("productList")
//	public List<Product> productList() {
//		return proDao.findAll();
//	}
//
//	@ModelAttribute("orderList")
//	public List<Order> orderList() {
//		return orDao.findAll();
//	}
}
