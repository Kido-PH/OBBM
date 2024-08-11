package com.poly.Model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Role;

public interface RoleDAO extends JpaRepository<Role, Integer>{

}
