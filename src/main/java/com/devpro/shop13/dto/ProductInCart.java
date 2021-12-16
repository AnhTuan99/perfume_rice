package com.devpro.shop13.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductInCart {
    private int productId;
    private String tenSP;
    private int soLuong;
    private int tongSoLuong;
    private String avatar;
    private BigDecimal giaBan;
    private BigDecimal tongGia;
}
