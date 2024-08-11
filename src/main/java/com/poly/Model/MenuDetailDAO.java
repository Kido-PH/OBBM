package com.poly.Model;

import org.springframework.data.jpa.repository.JpaRepository;
import com.poly.Entities.MenuDetail;

public interface MenuDetailDAO extends JpaRepository<MenuDetail, Integer> {
    // Custom query methods can be defined here if needed
}
