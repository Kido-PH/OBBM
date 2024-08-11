package com.poly.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.Service.InvoiceService;

@Controller
public class ReportController {
	@Autowired
    private InvoiceService invoiceService;

    @GetMapping("/admin/revenue/year")
    public String getRevenueByYear(Model model) {
        List<Object[]> data = invoiceService.getRevenueByYear();
        model.addAttribute("data", data);
        return "views/admin/revenue-by-year";
    }
    
    @GetMapping("/admin/revenue/month")
    public String getRevenueByMonth(Model model) {
        List<Object[]> data = invoiceService.getRevenueByMonth();
        model.addAttribute("data", data);
        return "views/admin/revenue-by-month";
    }
    
    @GetMapping("/admin/revenue/quarter")
    public String getRevenueByQuarter(Model model) {
        List<Object[]> data = invoiceService.getRevenueByQuarter();
        model.addAttribute("data", data);
        return "views/admin/revenue-by-quarter";
    }
}
