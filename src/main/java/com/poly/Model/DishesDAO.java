package com.poly.Model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.Entities.ContractDetail;
import com.poly.Entities.Dishes;

@Repository
public interface DishesDAO extends JpaRepository<Dishes, String> {
	@Query("SELECT d FROM Dishes d WHERE d.danhmucid.tendanhmuc = :tendanhmuc")
	Page<Dishes> findByDanhmuc_Tendanhmuc(@Param("tendanhmuc") String tendanhmuc, Pageable pageable);

	@Query("SELECT d FROM Dishes d WHERE d.danhmucid.tendanhmuc NOT IN ('Món Chính', 'Khai Vị', 'Tráng Miệng', 'Đồ Uống')")
	Page<Dishes> findOthers(Pageable pageable);
	
	@Query("SELECT d FROM Dishes d WHERE d.mamonan LIKE :mamonan")
    List<Dishes> findByMaMonAn(@Param("mamonan") String mamonan);
	
	@Query("SELECT d FROM Dishes d WHERE d.tenmonan LIKE %:name%")
    List<Dishes> searchByTenmonan(@Param("name") String name);
}
