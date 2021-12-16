package com.devpro.shop13.controller.admin;

import com.devpro.shop13.dto.AjaxResponse;
import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.News;
import com.devpro.shop13.services.NewsService;
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
public class AdminNewsController {

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = {"/admin/listNews"}, method = RequestMethod.GET)
    public String list(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        ProductSearch productSearch = new ProductSearch();
        productSearch.buildPaging(request);
        model.addAttribute("news", newsService.findAll(productSearch, 10));
        model.addAttribute("productSearch", productSearch);

        return "admin/listNews";
    }

    @RequestMapping(value = {"/admin/addNews"}, method = RequestMethod.GET)
    public String addNewsGet(final ModelMap model, final HttpServletRequest request,
                             final HttpServletResponse response) throws Exception {
        model.addAttribute("news", new News());
        return "admin/addNews";
    }

    @RequestMapping(value = {"/admin/addNews"}, method = RequestMethod.POST)
    public String addNewsPost(final ModelMap model, final HttpServletRequest request,
                              final HttpServletResponse response,
                              @ModelAttribute("news") News news,
                              @RequestParam("newsAvatar") MultipartFile newsAvatar) throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Slugify slg = new Slugify();
        String result = slg.slugify(news.getTitle() + "-" + System.currentTimeMillis());
        news.setSeo(result);

        boolean check = false;
        List<News> ne = newsService.findAll();
        for (News n : ne) {
            if (news.getId() == n.getId())
                check = true;
        }
        if (check == true) {
            News newsOnDb = newsService.getById(news.getId());
            news.setCreatedBy(newsOnDb.getCreatedBy());
            news.setCreatedDate(newsOnDb.getCreatedDate());
            news.setUpdatedDate(LocalDateTime.now());
            news.setUpdatedBy(((MyUser) principal).getId());
            newsService.Update(news, newsAvatar);
        } else {
            news.setCreatedDate(LocalDateTime.now());
            news.setCreatedBy(((MyUser) principal).getId());
            newsService.save(news, newsAvatar);
        }
        return "redirect:/admin/listNews";
    }

    @RequestMapping(value = {"/admin/updateNews/{id}"}, method = RequestMethod.GET)
    public String updateProduct(@PathVariable("id") Integer id,
                                final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
        News news = newsService.getById(id);
        model.addAttribute("news", news);
        return "admin/addNews";
    }

    @RequestMapping(value = {"/deleteNews"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> deleteProduct(final ModelMap model, final HttpServletRequest request,
                                                      final HttpServletResponse response, @RequestBody News news) {

        News ne = newsService.getById(news.getId());
        if (ne.getStatus())
            ne.setStatus(false);
        else
            ne.setStatus(true);
        newsService.save(ne);
        return ResponseEntity.ok(new AjaxResponse(200, "Xóa thành công"));
    }
}
