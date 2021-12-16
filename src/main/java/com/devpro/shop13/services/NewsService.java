package com.devpro.shop13.services;

import com.devpro.shop13.conf.MVCConf;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.News;
import com.devpro.shop13.taglibs.PaginationTaglib;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class NewsService extends BaseService<News> {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<News> clazz() {
        return News.class;
    }

    public List<News> search(ProductSearch productSearch, int max) {
        String sql = "SELECT * FROM tbl_news c WHERE status=true";
        Query query = entityManager.createNativeQuery(sql, News.class);
        if (productSearch.getOffset() != null) {
            productSearch.setCount(query.getResultList().size());
            query.setFirstResult(productSearch.getOffset());
            query.setMaxResults(PaginationTaglib.MAX = max);
        }
        return query.getResultList();
    }

    public List<News> searchByPopularPosts() {
        String sql = "SELECT * FROM tbl_news c WHERE status=true ORDER BY RAND() LIMIT 4";
        Query query = entityManager.createNativeQuery(sql, News.class);
        return query.getResultList();
    }


    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    @Transactional(rollbackOn = Exception.class)
    public News save(News news, MultipartFile avatar) throws IOException {
        try {
            if (!isEmptyUploadFile(avatar)) {
                avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "news/avatar/" + avatar.getOriginalFilename()));
                news.setAvatar("news/avatar/" + avatar.getOriginalFilename());
            }
            return super.save(news);
        } catch (Exception e) {
            throw e;
        }
    }

    @Transactional(rollbackOn = Exception.class)
    public News Update(News news, MultipartFile avatar) throws IOException {
        try {
            News newsOnDb = super.getById(news.getId());
            news.setCreatedDate(newsOnDb.getCreatedDate());
            if (!isEmptyUploadFile(avatar)) {
                new File(MVCConf.ROOT_UPLOAD_PATH + newsOnDb.getAvatar()).delete();
                avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "news/avatar/" + avatar.getOriginalFilename()));
                news.setAvatar("news/avatar/" + avatar.getOriginalFilename());
            } else {
                news.setAvatar(newsOnDb.getAvatar());
            }
            return super.save(news);
        } catch (Exception e) {
            throw e;
        }
    }

    public List<News> searchNewsWithNewArrival() {

        String sql = "SELECT * FROM tbl_news WHERE status=true ORDER BY created_date DESC  LIMIT 4";
        Query query = entityManager.createNativeQuery(sql, News.class);
        return query.getResultList();
    }
}
