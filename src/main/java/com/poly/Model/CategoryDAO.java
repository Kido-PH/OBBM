package com.poly.Model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer> {
	@Query("SELECT c FROM Category c WHERE c.tendanhmuc LIKE %:name%")
    List<Category> searchByTendanhmuc(@Param("name") String name);
}
