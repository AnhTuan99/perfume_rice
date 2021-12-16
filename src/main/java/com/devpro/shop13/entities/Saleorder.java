package com.devpro.shop13.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tbl_saleorder")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Saleorder extends BaseEntity {

    @Column(name = "code", length = 45, nullable = true)
    private String code;

    @Column(name = "total", precision = 13, scale = 2, nullable = true)
    private BigDecimal total;

    @Column(name = "customer_name", length = 1000, nullable = true)
    private String customer_name;

    @Column(name = "customer_address", length = 1000, nullable = true)
    private String customer_address;

    @Column(name = "seo", length = 200, nullable = true)
    private String seo;

    @Column(name = "customer_phone", length = 100, nullable = true)
    private String customer_phone;

    @Column(name = "cutomer_email", length = 100, nullable = true)
    private String cutomer_email;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "saleorder", fetch = FetchType.LAZY)
    private List<Saleorder_products> saleorder_productss = new ArrayList<Saleorder_products>();

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private Users users;

    @Column(name = "state", nullable = true)
    private Integer state = 0;

    public void addSaleorder_products(Saleorder_products saleorder_products) {
        saleorder_products.setSaleorder(this);
        saleorder_productss.add(saleorder_products);
    }

    public void removeSaleorder_products(Saleorder_products saleorder_products) {
        saleorder_products.setSaleorder(this);
        saleorder_productss.remove(saleorder_products);

    }
}
