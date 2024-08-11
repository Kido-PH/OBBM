package com.poly.Controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.DocumentException;
import com.poly.Entities.Contract;
import com.poly.Entities.Location;
import com.poly.Model.AccountDAO;
import com.poly.Model.ContractDAO;
import com.poly.Model.ContractDetailDAO;
import com.poly.Model.LocationDAO;
import com.poly.Service.PdfContractService;
import com.poly.Service.SessionService;

import jakarta.servlet.annotation.MultipartConfig;

@Controller
@MultipartConfig
public class AdminContractController {
	@Autowired
	ContractDAO conDao;

	@Autowired
	ContractDetailDAO detailConDao;

	@Autowired
	AccountDAO accDao;
	
	@Autowired
	LocationDAO locaDao;

	@Autowired
	SessionService session;
	
	@Autowired
	PdfContractService pdfService;

	@ModelAttribute("contracts")
	public List<Contract> contracts() {
		return conDao.findAll();
	}

	@GetMapping("/admin/contract")
	public String contractPage(Model model, @RequestParam("sdt") Optional<String> sdt,
			@RequestParam(value = "status", required = false) String status) {
		List<Contract> list;
		String searchSDT = sdt.orElse("");
		if (status != null && status.equals("All")) {
			list = conDao.findAll();
		} else {
			list = conDao.filterByStatus(status);
		}

		if (!searchSDT.equals("")) {
			list = conDao.searchBySDT(searchSDT);
		}

		model.addAttribute("contractList", list);
		model.addAttribute("selectedStatus", status);
		model.addAttribute("sdt", searchSDT);

		return "/views/admin/contract-list";
	}

	@GetMapping("/admin/contract/detail/{id}")
	public String contractDetail(Model model, @PathVariable("id") String contractID,
			RedirectAttributes redirectAttributes) {

		Double totalAmount = detailConDao.getTotalAmountByContractId(contractID);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("account", session.get("user"));
		
		model.addAttribute("contract", conDao.findByMaHopDong(contractID));
		model.addAttribute("chiTietHopDong", detailConDao.findByMaHopDong(contractID));
		
		List<Location> locations = locaDao.findAll(); // Assume locationDao.findAll() returns List<Location>
	    model.addAttribute("locationList", locations);

		return "/views/admin/contract-detail";
	}

	@PostMapping("/admin/contract/detail/{id}")
	public String contractEdit(Model model, @PathVariable("id") String contractID,
			@Validated @ModelAttribute("contract") Contract contEdit,
			BindingResult result, RedirectAttributes redirectAttributes) {
		Contract existingContract = conDao.findByMaHopDong(contEdit.getMahopdong());
		if (result.hasErrors()) {
			System.out.println("Errors occurred: " + result.getAllErrors());
	        return "/views/admin/contract-detail";
	    } else {
	    	if (contEdit.getChiphiphatsinh() == null) {
	            contEdit.setChiphiphatsinh(0.0);
	        }
	    	if (contEdit.getTiencoc() == null) {
	            contEdit.setTiencoc(0.0);
	        }
	    	contEdit.setTrangthai(existingContract.getTrangthai());
	    	contEdit.setMakhachhang(existingContract.getMakhachhang());
	    	contEdit.setSodienthoai(existingContract.getSodienthoai());
	    	contEdit.setIsdeleted(existingContract.getIsdeleted());
	    	contEdit.setNguoixuly(existingContract.getNguoixuly());
	    	contEdit.setGhichu(existingContract.getGhichu());
	    	 // Save the updated contract
		    conDao.save(contEdit);
	    }

	  
	    redirectAttributes.addFlashAttribute("message", "Contract updated successfully");
	    return "redirect:/admin/contract/detail/" + contractID;		
	}
	
	@PostMapping("/admin/contract/detail/{status}/{id}")
	public String contractProgress(Model model, @PathVariable("id") String contractID,
			@PathVariable("status") String status,
			RedirectAttributes redirectAttributes) {
		Contract contract = conDao.findByMaHopDong(contractID);
		if(status.equalsIgnoreCase("progress")) {
			contract.setTrangthai("In Progress");
		} else if(status.equalsIgnoreCase("accept")){
			contract.setTrangthai("Accepted");
		} else if(status.equalsIgnoreCase("reject")) {
			contract.setTrangthai("Rejected");
		}
		
		conDao.save(contract);
		redirectAttributes.addFlashAttribute("success_alert", true);
		return "redirect:/admin/contract/detail/" + contractID;
	}
	
	@GetMapping("/admin/contract/detail/print/{id}")
    public ResponseEntity<?> printContract(@PathVariable("id") String id) {
        // Fetch contract by id
        Contract contract = conDao.findByMaHopDong(id); // Implement this method to get contract by ID

        ByteArrayInputStream bis;
        try {
            bis = pdfService.generateContractPDF(contract);
        } catch (DocumentException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error generating PDF: DocumentException");
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error generating PDF: IOException - " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Error generating PDF: " + e.getMessage());
        } 

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=contract.pdf");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_PDF)
                .body(new InputStreamResource(bis));
    }

    private Contract getContractById(Long id) {
        // Implement this method to fetch the contract by ID from your database
        return new Contract(); // Replace with actual implementation
    }
	

}
