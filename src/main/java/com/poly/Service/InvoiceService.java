package com.poly.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.Model.InvoiceRepository;

import java.util.List;

@Service
public class InvoiceService {

    @Autowired
    private InvoiceRepository invoiceRepository;

    public List<Object[]> getRevenueByYear() {
        return invoiceRepository.revenueByYear();
    }
    
    public List<Object[]> getRevenueByMonth() {
        return invoiceRepository.revenueByMonth();
    }
    
    public List<Object[]> getRevenueByQuarter() {
        return invoiceRepository.revenueByQuarter();
    }
}

