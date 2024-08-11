package com.poly.Model;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Contract;
import com.poly.Entities.ContractDetail;
import com.poly.Entities.Location;

public interface LocationDAO extends JpaRepository<Location, Integer>{
	
}
