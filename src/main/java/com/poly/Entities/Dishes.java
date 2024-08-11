package com.poly.Entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "monan")
public class Dishes implements Serializable {

	@Id
	String mamonan;

	String tenmonan;

	Double gia;

	String mota;

	@ManyToOne
	@JoinColumn(name = "danhmucid")
	Category danhmucid;

	String hinhanh;

	Boolean isdeleted;
}
