package com.devpro.shop13.controller.user;

import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.News;
import com.devpro.shop13.services.NewsService;
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
public class NewsController extends BaseController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = {"/news"}, method = RequestMethod.GET)
    public String news(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {

        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("news", newsService.search(productSearch, 10));
        model.addAttribute("productSearch", productSearch);
        model.addAttribute("searchByPopularPosts", newsService.searchByPopularPosts());
        return "user/news";
    }

    @RequestMapping(value = {"/newsDetails/{id}"}, method = RequestMethod.GET)
    public String newsDetails(@PathVariable("id") Integer id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        News news = newsService.getById(id);
        model.addAttribute("news", news);
        model.addAttribute("searchByPopularPosts", newsService.searchByPopularPosts());
        return "user/newsDetails";
    }


}

