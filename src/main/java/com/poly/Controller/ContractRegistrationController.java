package com.poly.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ContractRegistrationController {

	@GetMapping("/contract")
	public String getContractForm(Model model) {

		return "/views/contract_registration";
	}
	@GetMapping("/customerinfor")
	public String getCustomerIf(Model model) {

		return "/views/customer_info";
	}

}
