package com.devpro.shop13.dto;

import com.devpro.shop13.entities.Products;
import com.devpro.shop13.services.ProductService;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<ProductInCart> sanPhamTrongGioHangs = new ArrayList<ProductInCart>();

	public List<ProductInCart> getSanPhamTrongGioHangs() {
		return sanPhamTrongGioHangs;

	}

	public void setSanPhamTrongGioHangs(List<ProductInCart> sanPhamTrongGioHangs) {
		this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
	}
	
	public BigDecimal getTotal(ProductService productService) {
		BigDecimal decimal = BigDecimal.ZERO;
		for(ProductInCart phamTrongGioHang : sanPhamTrongGioHangs) {
			Products product = productService.getById(phamTrongGioHang.getProductId());
			if(product.getSaleoff()==0)
				decimal = decimal.add(product.getPrice());
			else
				decimal = decimal.add(product.discount(product.getPrice(), product.getSaleoff()));
		}
		return decimal;
	}
}
