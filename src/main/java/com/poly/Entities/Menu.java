package com.poly.Entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "thucdon")
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer thucdonid;
	
	@ManyToOne
	@JoinColumn(name = "makhachhang")
	private Customer khachhang;
	
	private Date ngaytao;

	@OneToMany(mappedBy = "thucdon", cascade = CascadeType.ALL, orphanRemoval = true)
	List<MenuDetail> menudetail;
}
