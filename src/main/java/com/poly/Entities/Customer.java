package com.poly.Entities;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "khachhang")
public class Customer implements Serializable{
	@Id
	private String makhachhang;
	
	@OneToOne
	@JoinColumn(name = "taikhoanid")
	private Account taikhoanid;
	
	private String tenkhachhang;
	
	private String sodienthoai;
	
	private String diachi;
	
	private Date ngaysinh;
	
	private String gioitinh;
	
	private String cccd;
	
	private String hinhanh;
	
	private Date ngaytao;
	
	private Boolean isdeleted;
	
}
