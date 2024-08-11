package com.poly.Entities;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name = "hopdong")
public class Contract implements Serializable{
	@Id
	private String mahopdong;
	
	@ManyToOne
	@JoinColumn(name = "makhachhang")
	Customer makhachhang;
	
	private String sodienthoai;
	
	@ManyToOne
	@JoinColumn(name = "diadiemid")
	private Location diadiemid;
	
	private Date ngaylap;
	
	private Date ngaytochuc;
	
	private Double tongtien;
	
	private String ghichu;
	
	private String trangthai;
	
	private Double chiphidukien;
	
	private Double chiphiphatsinh;
	
	private String nguoixuly;
	
	private Double tiencoc;
	
	private Boolean isdeleted;
	
}
