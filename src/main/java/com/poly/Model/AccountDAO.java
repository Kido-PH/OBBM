package com.poly.Model;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Account;

public interface AccountDAO extends JpaRepository<Account, Integer>{
	List<Account> findByTendangnhap(String tendangnhap);
	
	@Query("SELECT a FROM Account a WHERE a.tendangnhap LIKE %:name%")
    List<Account> searchByTendangnhap(@Param("name") String name);
}
