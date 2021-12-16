package com.devpro.shop13.dto;

import com.devpro.shop13.entities.Saleorder_products;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderProductCustom {
    private Saleorder_products saleorder_products;
    private BigDecimal thanhTien;
}
