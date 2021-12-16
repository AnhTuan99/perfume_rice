package com.devpro.shop13.controller.user;

import com.devpro.shop13.entities.Products;
import com.devpro.shop13.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class DetailProductsController extends BaseController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private BrandsService brandsService;


    @Autowired
    private ProductService productService;

    @Autowired
    CategoriesService categoriesService;

    @Autowired
    private Products_imagesService products_imagesService;

    @RequestMapping(value = {"/detailProducts/{id}"}, method = RequestMethod.GET)
    public String detailsProduct(final ModelMap model, @PathVariable("id") Integer id, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        Products products = productService.getById(id);
        model.addAttribute("product", products);
        model.addAttribute("categoriesName", categoriesService.getById(products.getCategories().getId()));
        model.addAttribute("news", newsService.searchNewsWithNewArrival());
        model.addAttribute("productsImages", products_imagesService.searchByIdProducts(id));
        model.addAttribute("brandsName", brandsService.searchAdmin(products.getBrands().getId()));
        return "user/details";
    }
}

