package com.devpro.shop13.controller.user;

import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.services.CategoriesService;
import com.devpro.shop13.services.ProductService;
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
public class CategoryController extends BaseController {
    @Autowired
    private ProductService productService;

    @Autowired
    CategoriesService categoriesService;

    @RequestMapping(value = {"/category/{id}"}, method = RequestMethod.GET)
    public String gridCategory(@PathVariable("id") String i, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("product", productService.searchProductSort(null, i, productSearch, 10));
        if (i != null && i.equals("all")) {
            model.addAttribute("categoriesName", "");
        } else {
            int id = Integer.parseInt(i);
            model.addAttribute("categoriesName", categoriesService.getById(id));
            model.addAttribute("idCategories", id);
        }

        model.addAttribute("productSearch", productSearch);
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("productBestSeller", productService.searchProductWithBestSeller());

        return "user/gridCategory";
    }

    @RequestMapping(value = {"/category/{id}/{sortby}"}, method = RequestMethod.GET)
    public String gridCategorySortBy(@PathVariable("id") String i, @PathVariable("sortby") String sortby, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {

        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("product", productService.searchProductSort(sortby, i, productSearch, 10));
        if (i != null && i.equals("all")) {
            model.addAttribute("categoriesName", "");
        } else {
            int id = Integer.parseInt(i);
            model.addAttribute("categoriesName", categoriesService.getById(id));
            model.addAttribute("idCategories", id);
        }

        model.addAttribute("productSearch", productSearch);
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("productBestSeller", productService.searchProductWithBestSeller());
        model.addAttribute("titleSort", categoriesService.getTitleSort(sortby));
        return "user/gridCategory";
    }

    @RequestMapping(value = {"/listCategory/{id}"}, method = RequestMethod.GET)
    public String listCategory(@PathVariable("id") String i, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("product", productService.searchProductSort(null, i, productSearch, 10));
        if (i != null && i.equals("all")) {
            model.addAttribute("categoriesName", "");
        } else {
            int id = Integer.parseInt(i);
            model.addAttribute("categoriesName", categoriesService.getById(id));
            model.addAttribute("idCategories", id);
        }

        model.addAttribute("productSearch", productSearch);
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("productBestSeller", productService.searchProductWithBestSeller());

        return "user/listCategory";

    }

    @RequestMapping(value = {"/listCategory/{id}/{sortby}"}, method = RequestMethod.GET)
    public String listCategorySortBy(@PathVariable("id") String i, @PathVariable("sortby") String sortby, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("product", productService.searchProductSort(sortby, i, productSearch, 10));
        if (i != null && i.equals("all")) {
            model.addAttribute("categoriesName", "");
        } else {
            int id = Integer.parseInt(i);
            model.addAttribute("categoriesName", categoriesService.getById(id));
            model.addAttribute("idCategories", id);
        }

        model.addAttribute("productSearch", productSearch);
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("productBestSeller", productService.searchProductWithBestSeller());
        model.addAttribute("titleSort", categoriesService.getTitleSort(sortby));
        return "user/listCategory";
    }
}

