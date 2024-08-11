package com.poly.Entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
@Data
@Entity
@Table(name = "dichvu")
public class Service implements Serializable{
	@Id
	String madichvu;
	
	String tendichvu;
	
	Double gia;
	
	String mota;
	
	Boolean isdeleted;
	
}
