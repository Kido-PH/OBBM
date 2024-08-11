package com.poly.Entities;

import java.io.Serializable;

import org.hibernate.annotations.ManyToAny;

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
@Table(name = "chitiethopdong")
public class ContractDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer chitiethopdongid;
	
	@ManyToOne
	@JoinColumn(name = "mahopdong")
	Contract mahopdong;
	
	@ManyToOne
	@JoinColumn(name = "mamonan")
	Dishes mamonan;
	
	@ManyToOne
	@JoinColumn(name = "madichvu")
	Service madichvu;
	
	Integer soluongdichvu;
	
	Integer soluongmonan;
	
	Double dongiadichvu;
	
	Double dongiamonan;
	
	Boolean isdeleted;
	
}
