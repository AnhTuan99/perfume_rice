package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.services.BrandsService;
import com.devpro.shop13.services.CategoriesService;
import com.devpro.shop13.services.ProductService;
import com.github.slugify.Slugify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;


@Controller
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoriesService categoriesService;

    @Autowired
    private BrandsService brandsService;

    @RequestMapping(value = {"/admin/listProducts"}, method = RequestMethod.GET)
    public String list(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("product", productService.findAll(productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        return "admin/listProduct";
    }

    @RequestMapping(value = {"/admin/addProduct"}, method = RequestMethod.GET)
    public String addProduct_Get(final ModelMap model, final HttpServletRequest request,
                                 final HttpServletResponse response) throws Exception {
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("brands", brandsService.search());
        model.addAttribute("product", new Products());
        return "admin/addProduct";
    }

    @RequestMapping(value = {"/admin/addProduct"}, method = RequestMethod.POST)
    public String addProduct_Post(final ModelMap model, final HttpServletRequest request,
                                  final HttpServletResponse response,
                                  @ModelAttribute("product") Products products,
                                  @RequestParam("productAvatar") MultipartFile productAvatar,
                                  @RequestParam("productPictures") MultipartFile[] productPictures) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Slugify slg = new Slugify();
        String result = slg.slugify(products.getTitle() + "-" + System.currentTimeMillis());
        products.setSeo(result);

        products.setPrice_sale(products.discount(products.getPrice(), products.getSaleoff()));
        boolean check = false;
        List<Products> pro = productService.findAll();
        for (Products p : pro) {
            if (products.getId() == p.getId())
                check = true;
        }
        if (check == true) {
            Products productsOnDb = productService.getById(products.getId());
            products.setCreatedDate(productsOnDb.getCreatedDate());
            products.setCreatedBy(productsOnDb.getCreatedBy());
            products.setUpdatedDate(LocalDateTime.now());
            products.setUpdatedBy(((MyUser) principal).getId());
            productService.Update(products, productAvatar, productPictures);
        } else {
            products.setCreatedDate(LocalDateTime.now());
            products.setCreatedBy(((MyUser) principal).getId());
            productService.save(products, productAvatar, productPictures);
        }
        return "redirect:/admin/listProducts";
    }

    @RequestMapping(value = {"/admin/updateProduct/{id}"}, method = RequestMethod.GET)
    public String updateProduct(@PathVariable("id") Integer id,
                                final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        Products products = productService.getById(id);
        model.addAttribute("categories", categoriesService.search());
        model.addAttribute("brands", brandsService.search());
        model.addAttribute("product", products);
        return "admin/addProduct";
    }

    @RequestMapping(value = {"/deleteProduct"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteProduct(final ModelMap model, final HttpServletRequest request,
                                                      final HttpServletResponse response, @RequestBody Products products) {

        Products prod = productService.getById(products.getId());
        if (prod.getStatus())
            prod.setStatus(false);
        else
            prod.setStatus(true);
        productService.save(prod);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }
}
