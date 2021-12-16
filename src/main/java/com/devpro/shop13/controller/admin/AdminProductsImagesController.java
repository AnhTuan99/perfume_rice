package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Products_images;
import com.devpro.shop13.services.BrandsService;
import com.devpro.shop13.services.CategoriesService;
import com.devpro.shop13.services.ProductService;
import com.devpro.shop13.services.Products_imagesService;
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
public class AdminProductsImagesController {

    @Autowired
    private Products_imagesService productsImagesService;

    @RequestMapping(value = {"/admin/listProductsImages/{id}"}, method = RequestMethod.GET)
    public String list(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        model.addAttribute("idProduct", id);
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("productsImages", productsImagesService.searchByIdProductsImages(id, productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        return "admin/listProductImages";
    }

    @RequestMapping(value = {"/admin/addProductImages/{id}"}, method = RequestMethod.GET)
    public String addProductImagesGet(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
                                      final HttpServletResponse response) throws Exception {
        model.addAttribute("productsImages", new Products_images());
        model.addAttribute("idProduct", id);
        return "admin/addProductsImages";
    }

    @RequestMapping(value = {"/admin/addProductImages/{id}"}, method = RequestMethod.POST)
    public String addProductsImagesPost(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request,
                                        final HttpServletResponse response,
                                        @ModelAttribute("productsImages") Products_images productsImages,
                                        @RequestParam("imagesPro") MultipartFile imagesPro) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        boolean check = false;
        List<Products_images> proImg = productsImagesService.searchByIdProductsImages(id);
        Products products = new Products();
        for (Products_images p : proImg) {
            if (productsImages.getId() == p.getId())
                check = true;
            products = p.getProducts();
        }
        if (check == true) {
            Products_images productsImagesOnDb = productsImagesService.getById(productsImages.getId());
            productsImages.setCreatedBy(productsImagesOnDb.getCreatedBy());
            productsImages.setCreatedDate(productsImagesOnDb.getCreatedDate());
            productsImages.setUpdatedDate(LocalDateTime.now());
            productsImages.setUpdatedBy(((MyUser) principal).getId());
            productsImagesService.Update(productsImages, imagesPro, products);
        } else {
            productsImages.setCreatedDate(LocalDateTime.now());
            productsImages.setCreatedBy(((MyUser) principal).getId());
            productsImagesService.save(productsImages, imagesPro, products);
        }
        return "redirect:/admin/listProductsImages/{id}";
    }

    @RequestMapping(value = {"/admin/updateProductsImages/{id}"}, method = RequestMethod.GET)
    public String updateProduct(@PathVariable("id") Integer id,
                                final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Products_images productsImages = productsImagesService.getById(id);
        model.addAttribute("productsImages", productsImages);
        model.addAttribute("idProduct", idProduct);
        return "admin/addProductsImages";
    }

    @RequestMapping(value = {"/deleteProductsImages"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteProductsImages(final ModelMap model, final HttpServletRequest request,
                                                             final HttpServletResponse response, @RequestBody Products_images productsImages) {

        Products_images proImages = productsImagesService.getById(productsImages.getId());
        if (proImages.getStatus())
            proImages.setStatus(false);
        else
            proImages.setStatus(true);
        productsImagesService.save(proImages);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }

}
