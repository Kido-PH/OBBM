package com.poly.Entities;

import java.io.Serializable;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "chitietthucdon")
public class MenuDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer chitietthucdonid;
	
	@ManyToOne
	@JoinColumn(name = "thucdonid")
	private Menu thucdon;
	
	@ManyToOne
	@JoinColumn(name = "mamonan")
	private Dishes monan;
	
	private Integer soluongmonan;
	private Double dongiamonan;
}
