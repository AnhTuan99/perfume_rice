package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "tbl_brands")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Brands extends BaseEntity {

	@Column(name = "name", nullable = true)
	private String name;

	@Column(name = "description", length = 100, nullable = true)
	private String description;

	@Column(name = "seo", length = 100, nullable = true)
	private String seo;

	@OneToMany(cascade = CascadeType.ALL ,mappedBy = "brands", fetch = FetchType.LAZY)
	private List<Products> productss = new ArrayList<Products>();
	
	@Column(name = "avatar" ,length = 3000, nullable = true)
	private String avatar;
}
