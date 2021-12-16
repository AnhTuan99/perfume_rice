package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tbl_products")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Products extends BaseEntity {

    @Column(name = "title", length = 500, nullable = true)
    private String title;

    @Column(name = "price", precision = 13, scale = 2, nullable = true)
    private BigDecimal price = BigDecimal.ZERO;

    @Column(name = "short_description", length = 3000, nullable = true)
    private String short_description;

    @Lob
    @Column(name = "detail_description", nullable = true, columnDefinition = "LONGTEXT")
    private String detail_description;

    @Column(name = "seo", nullable = true)
    private String seo;

    @Column(name = "avatar", length = 3000, nullable = true)
    private String avatar;

    @Column(name = "is_hot", nullable = true)
    private Boolean is_hot = Boolean.TRUE;

    @Column(name = "selling", nullable = true)
    private int selling = 0;

    @Column(name = "amount")
    private int amount = 100;

    @Column(name = "saleoff", nullable = true)
    private int saleoff = 0;

    @Column(name = "price_sale", nullable = true)
    private BigDecimal price_sale = price.subtract(price).multiply(new BigDecimal(saleoff).divide(new BigDecimal(100)));

    public BigDecimal discount(BigDecimal gia, int giam) {
        return gia.subtract(gia.multiply(new BigDecimal(giam).divide(new BigDecimal(100))));
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Categories categories;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "brands_id")
    private Brands brands;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "products", orphanRemoval = true, fetch = FetchType.EAGER)
    private Set<Products_images> productImages = new HashSet<>();

    public void addProduct_images(Products_images products_imagess) {
        products_imagess.setProducts(this);
        productImages.add(products_imagess);
    }

    public void removeProduct_images(Products_images products_imagess) {
        products_imagess.setProducts(null);
        productImages.remove(products_imagess);
    }
}
