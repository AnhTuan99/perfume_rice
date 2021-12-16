package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Categories;
import com.devpro.shop13.services.CategoriesService;
import com.github.slugify.Slugify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;


@Controller
public class AdminCategoryController {

    @Autowired
    private CategoriesService categoriesService;

    @RequestMapping(value = {"/admin/listCategory"}, method = RequestMethod.GET)
    public String listCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("categories", categoriesService.findAll(productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        return "admin/listCategory";
    }

    @RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.GET)
    public String addCategoryGet(final ModelMap model, final HttpServletRequest request,
                                 final HttpServletResponse response) throws Exception {
        model.addAttribute("categories", new Categories());
        return "admin/addCategory";
    }

    @RequestMapping(value = {"/admin/addCategory"}, method = RequestMethod.POST)
    public String addCategoryPost(final ModelMap model, final HttpServletRequest request,
                                  final HttpServletResponse response, @ModelAttribute("categories") Categories categories) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Slugify slg = new Slugify();
        String result = slg.slugify(categories.getName() + "-" + System.currentTimeMillis());
        categories.setSeo(result);

        boolean check = false;
        List<Categories> re = categoriesService.findAll();
        for (Categories r : re) {
            if (categories.getId() == r.getId())
                check = true;
        }
        if (check == true) {
            Categories categoriesOnDb = categoriesService.getById(categories.getId());
            categories.setCreatedDate(categoriesOnDb.getCreatedDate());
            categories.setCreatedBy(categoriesOnDb.getCreatedBy());
            categories.setUpdatedDate(LocalDateTime.now());
            categories.setUpdatedBy(((MyUser) principal).getId());
        } else {
            categories.setCreatedDate(LocalDateTime.now());
            categories.setCreatedBy(((MyUser) principal).getId());
        }
        categoriesService.save(categories);
        return "redirect:/admin/listCategory";
    }

    @RequestMapping(value = {"/admin/updateCategory/{id}"}, method = RequestMethod.GET)
    public String saveCategory(@PathVariable("id") Integer id,
                               final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        Categories categories = categoriesService.getById(id);
        model.addAttribute("categories", categories);
        return "admin/addCategory";
    }

    @RequestMapping(value = {"/deleteCategory"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteCategory(final ModelMap model, final HttpServletRequest request,
                                                       final HttpServletResponse response, @RequestBody Categories categories) {

        Categories category = categoriesService.getById(categories.getId());
        if (category.getStatus())
            category.setStatus(false);
        else
            category.setStatus(true);
        categoriesService.save(category);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }
}
