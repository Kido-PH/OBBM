package com.poly.Entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "diadiem")
public class Location implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer diadiemid;
	
	private String tendiadiem;
	
	private Integer succhua;
	
	private Integer soban;
	
	private Double giathue;
	
	private String mota;
	
	private String hinhanh;
	
	private Boolean isdeleted;
}
