package com.poly.Entities;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "taikhoan")
public class Account implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer taikhoanid;
	
	
	@NotBlank
	@Column(unique = true)
	private String tendangnhap;
	
	@NotBlank
	private String matkhau;
	@NotBlank
	private String email;
	private String hinhanh;
	private Date ngaytao;
	private Boolean isdeleted;
	@ManyToOne
	@JoinColumn(name = "vaitroid")
	private Role role;
}
