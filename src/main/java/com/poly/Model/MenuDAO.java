package com.poly.Model;

import org.springframework.data.jpa.repository.JpaRepository;
import com.poly.Entities.Menu;

public interface MenuDAO extends JpaRepository<Menu, Integer> {
    // Custom query methods can be defined here if needed
}
