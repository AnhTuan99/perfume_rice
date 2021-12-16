package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Brands;
import com.devpro.shop13.services.BrandsService;
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
public class AdminBrandsController {

    @Autowired
    private BrandsService brandsService;

    @RequestMapping(value = {"/admin/listBrands"}, method = RequestMethod.GET)
    public String listBrands(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("brands", brandsService.findAll(productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        return "admin/listBrands";
    }

    @RequestMapping(value = {"/admin/addBrands"}, method = RequestMethod.GET)
    public String addBrandsGet(final ModelMap model, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        model.addAttribute("brands", new Brands());
        return "admin/addBrands";
    }

    @RequestMapping(value = {"/admin/addBrands"}, method = RequestMethod.POST)
    public String addBrandsPost(final ModelMap model, final HttpServletRequest request,
                                final HttpServletResponse response,
                                @RequestParam("brandsAvatar") MultipartFile brandsAvatar,
                                @ModelAttribute("brands") Brands brands
    ) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Slugify slg = new Slugify();
        String result = slg.slugify(brands.getName() + "-" + System.currentTimeMillis());
        brands.setSeo(result);

        boolean check = false;
        List<Brands> br = brandsService.findAll();
        for (Brands b : br) {
            if (brands.getId() == b.getId())
                check = true;
        }
        if (check == true) {
            Brands brandsOnDb = brandsService.getById(brands.getId());
            brands.setCreatedDate(brandsOnDb.getCreatedDate());
            brands.setCreatedBy(brandsOnDb.getCreatedBy());
            brands.setUpdatedDate(LocalDateTime.now());
            brands.setUpdatedBy(((MyUser) principal).getId());
            brandsService.Update(brands, brandsAvatar);
        } else {
            brands.setCreatedDate(LocalDateTime.now());
            brands.setCreatedBy(((MyUser) principal).getId());
            brandsService.save(brands, brandsAvatar);
        }
        return "redirect:/admin/listBrands";
    }

    @RequestMapping(value = {"/admin/updateBrands/{id}"}, method = RequestMethod.GET)
    public String saveBrands(@PathVariable("id") Integer id,
                             final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        Brands brands = brandsService.getById(id);
        model.addAttribute("brands", brands);
        return "admin/addBrands";
    }

    @RequestMapping(value = {"/deleteBrands"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteCategory(final ModelMap model, final HttpServletRequest request,
                                                       final HttpServletResponse response, @RequestBody Brands brands) {

        Brands brand = brandsService.getById(brands.getId());
        if (brand.getStatus())
            brand.setStatus(false);
        else
            brand.setStatus(true);
        brandsService.save(brand);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }
}
