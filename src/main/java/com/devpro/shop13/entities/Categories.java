package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "tbl_category")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Categories extends BaseEntity {

    @Column(name = "name", nullable = true)
    private String name;

    @Column(name = "description", length = 100, nullable = true)
    private String description;

    @Column(name = "seo", length = 100, nullable = true)
    private String seo;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "categories", fetch = FetchType.LAZY)
    private List<Products> productss = new ArrayList<Products>();

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "parent_id")
    private List<Categories> childs = new ArrayList<Categories>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Categories categories;

}
