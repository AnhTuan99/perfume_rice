package com.devpro.shop13.controller.user;

import com.devpro.shop13.entities.Products;
import com.devpro.shop13.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class SearchController extends BaseController {
    @Autowired
    ProductService productService;

    @RequestMapping(value = {"/search"})
    public String viewHomePage(ModelMap model, final HttpServletRequest request,
                               final HttpServletResponse response) throws Exception {
        String keyword = request.getParameter("keyword");
        List<Products> products = productService.searchByKeyWord(keyword);
        model.addAttribute("products", products);
        model.addAttribute("key", keyword);
        return "user/search";
    }
}
