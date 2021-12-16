package com.devpro.shop13.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products_images")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Products_images extends BaseEntity{
	@Column(name = "title",length = 500, nullable = true)
	private String title;
	
	@Column(name = "path",length = 200, nullable = true)
	private String path;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name= "product_id")
	private Products products;
}
