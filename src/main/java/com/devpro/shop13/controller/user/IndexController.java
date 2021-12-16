package com.devpro.shop13.controller.user;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop13.entities.Categories;
import com.devpro.shop13.entities.Contact;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.CategoriesService;
import com.devpro.shop13.services.NewsService;
import com.devpro.shop13.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop13.dto.AjaxResponse;

@Controller
public class IndexController extends BaseController{

	@Autowired
	CategoriesService categoriesService;

	@Autowired
	private ProductService productService;

	@Autowired
	private NewsService newsService;

	@RequestMapping(value = { "/", "/home", "/index", "/trangchu" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("productBestSeller", productService.searchProductWithBestSeller());
		model.addAttribute("productNewArrival", productService.searchProductWithNewArrival());
		model.addAttribute("news", newsService.searchNewsWithNewArrival());
		model.addAttribute("productWithDiscount", productService.searchProductWithDiscount());
		model.addAttribute("highestDiscount", productService.highestDiscount());
		return "user/index";
	}

	
	@RequestMapping(value = {"/", "/home", "/index", "/trangchu" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response, @RequestBody Contact contact) {
		return ResponseEntity.ok(new AjaxResponse(200, "Success"));
	}


}
