package com.poly.Model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Contract;

public interface ContractDAO extends JpaRepository<Contract, String> {

	@Override
	@Query("SELECT c FROM Contract c order by c.ngaylap desc")
	List<Contract> findAll();

	@Query("SELECT c FROM Contract c WHERE c.sodienthoai LIKE %:sdt% order by c.ngaylap desc")
	List<Contract> searchBySDT(@Param("sdt") String sdt);

	@Query("SELECT c FROM Contract c WHERE c.trangthai LIKE %:status% order by c.ngaylap desc")
	List<Contract> filterByStatus(@Param("status") String status);

	@Query("SELECT c FROM Contract c WHERE c.mahopdong LIKE :mahopdong")
	Contract findByMaHopDong(@Param("mahopdong") String mahopdong);

	

}
