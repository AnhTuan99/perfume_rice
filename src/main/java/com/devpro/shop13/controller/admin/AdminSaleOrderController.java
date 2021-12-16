package com.devpro.shop13.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.OrderProductCustom;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.dto.SaleOrderProducts;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Saleorder;
import com.devpro.shop13.entities.Saleorder_products;
import com.devpro.shop13.services.ProductService;
import com.devpro.shop13.services.SaleOrderProductsService;
import com.devpro.shop13.services.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Controller
public class AdminSaleOrderController {

	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderProductsService saleOrderProductsService;

	@RequestMapping(value = { "/admin/listSaleOrder" }, method = RequestMethod.GET)
	public String list(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		ProductSearch productSearch= new ProductSearch();
		productSearch.buildPaging(request);
		model.addAttribute("saleOrderService", saleOrderService.findAll(productSearch, 10));
		model.addAttribute("productSearch",productSearch);
		return "admin/listSaleOrder";
	}

	@RequestMapping(value = { "/admin/orderDetail/{id}" }, method = RequestMethod.GET)
	public String orderDetail(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		Saleorder saleorder = saleOrderService.getById(id);
		model.addAttribute("saleorder", saleorder);

		List<SaleOrderProducts> listSaleOrderProducts = new ArrayList<>();
		List<Saleorder_products> listOP = saleOrderProductsService.searchByIdSaleOrder(id);
		for (Saleorder_products item : listOP) {
			SaleOrderProducts p = new SaleOrderProducts();
			p.setSaleorder_products(item);
			Products products=productService.getById(item.getProducts().getId());
			p.setThanhTien(products.getPrice_sale().multiply(new BigDecimal(item.getQuality())));
			listSaleOrderProducts.add(p);
		}
		model.addAttribute("listSaleOrderProducts", listSaleOrderProducts);

		return "admin/listSaleOrderProducts";
	}

	@RequestMapping(value = { "/admin/confirmSaleOrder/{id}" }, method = RequestMethod.GET)
	public String confirm_sale(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
							   final HttpServletResponse response) throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String state = request.getParameter("state");
		Saleorder saleOrderInDB = saleOrderService.getById(id);
		if(state.equals("1")) {
			saleOrderInDB.setState(1);
		}
		if(state.equals("2")) {
			saleOrderInDB.setState(2);
		}
		if(state.equals("3")) {
			saleOrderInDB.setState(3);
			List<Saleorder_products> listSaleorder_products = saleOrderProductsService.searchByIdSaleOrder(id);
			for (Saleorder_products item : listSaleorder_products) {
				item.getProducts().setAmount(item.getQuality()+item.getProducts().getAmount());
			}
		}
		saleOrderInDB.setUpdatedDate(LocalDateTime.now());
		saleOrderInDB.setUpdatedBy(((MyUser)principal).getId());
		saleOrderService.save(saleOrderInDB);
		return "redirect:/admin/listSaleOrder";
	}
}
