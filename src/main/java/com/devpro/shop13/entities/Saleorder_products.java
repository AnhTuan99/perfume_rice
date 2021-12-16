package com.devpro.shop13.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tbl_saleorder_products")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Saleorder_products extends BaseEntity {

    @Column(name = "quality", nullable = true)
    private int quality;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "saleorder_id")
    private Saleorder saleorder;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Products products;
}
