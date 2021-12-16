package com.devpro.shop13.controller.user;

import com.devpro.shop13.entities.Brands;
import com.devpro.shop13.entities.Categories;
import com.devpro.shop13.services.BrandsService;
import com.devpro.shop13.services.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public abstract class BaseController {
    @Autowired
    private CategoriesService categoriesService;

    @Autowired
    private BrandsService brandsService;

    @ModelAttribute("categories")
    public List<Categories> getCategories() {
        return categoriesService.search();
    }

    @ModelAttribute("brands")
    public List<Brands> getBrands() {
        return brandsService.search();
    }
}
