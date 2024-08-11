package com.poly.Entities;

import java.io.Serializable;
import java.time.LocalDateTime;
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
@Table(name = "hoadon")
public class Invoice implements Serializable {	
	@Id
	private String mahoadon;
	
	private LocalDateTime ngaylap;
	
	private Double tongtien;
	
	private Boolean isdeleted;
	
	@ManyToOne
	@JoinColumn(name = "mahopdong")
	private Contract hopdong;
}
