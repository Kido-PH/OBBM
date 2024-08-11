package com.poly.Model;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.ContractDetail;

public interface ContractDetailDAO extends JpaRepository<ContractDetail, Integer>{
	@Query("SELECT c FROM ContractDetail c WHERE c.mahopdong.mahopdong = :mahopdong")
    List<ContractDetail> findByMaHopDong(@Param("mahopdong") String mahopdong);
	
	@Query("SELECT SUM(cd.soluongmonan * cd.dongiamonan + cd.soluongdichvu * cd.dongiadichvu + c.diadiemid.giathue) "
			+ "FROM ContractDetail cd " + "JOIN cd.mahopdong c " + "WHERE c.mahopdong = :mahopdong "
			+ "AND cd.isdeleted = false " + "AND c.isdeleted = false")
	Double getTotalAmountByContractId(@Param("mahopdong") String mahopdong);
}
