package com.poly.Model;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Contract;
import com.poly.Entities.ContractDetail;
import com.poly.Entities.Service;

public interface ServiceDAO extends JpaRepository<Service, String>{

}
