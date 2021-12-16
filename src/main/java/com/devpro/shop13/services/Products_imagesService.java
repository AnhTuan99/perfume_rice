package com.devpro.shop13.services;

import com.devpro.shop13.conf.MVCConf;
import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Products_images;
import com.devpro.shop13.taglibs.PaginationTaglib;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class Products_imagesService extends BaseService<Products_images> {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<Products_images> clazz() {
        return Products_images.class;
    }

    public List<Products_images> search() {
        String sql = "SELECT * FROM tbl_products_images c WHERE status=true";
        return executeNativeSql(sql);
    }

    public List<Products_images> searchByIdProducts(int id) {
        String sql = "SELECT * FROM tbl_products_images c WHERE status=true AND product_id='" + id + "'";
        return executeNativeSql(sql);
    }

    public List<Products_images> searchByIdProductsImages(int id) {
        String sql = "SELECT * FROM tbl_products_images c WHERE product_id='" + id + "'";
        return executeNativeSql(sql);
    }

    public List<Products_images> searchByIdProductsImages(int id, ProductSearch productSearch, int max) {
        String sql = "SELECT * FROM tbl_products_images c WHERE product_id='" + id + "'";
        Query query = entityManager.createNativeQuery(sql, Products_images.class);
        // paging
        if (productSearch.getOffset() != null) {
            productSearch.setCount(query.getResultList().size());

            query.setFirstResult(productSearch.getOffset());
            query.setMaxResults(PaginationTaglib.MAX = max);
        }
        return query.getResultList();
    }


    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    @Transactional(rollbackOn = Exception.class)
    public Products_images save(Products_images productsImages, MultipartFile proImages, Products products) throws IOException {
        try {
            if (!isEmptyUploadFile(proImages)) {
                proImages.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/picture/" + proImages.getOriginalFilename()));
                productsImages.setPath("product/picture/" + proImages.getOriginalFilename());
                productsImages.setTitle(proImages.getOriginalFilename());
                productsImages.setProducts(products);
                productsImages.setCreatedDate(LocalDateTime.now());
            }
            return super.save(productsImages);
        } catch (Exception e) {
            throw e;
        }
    }


    @Transactional(rollbackOn = Exception.class)
    public Products_images Update(Products_images productImages, MultipartFile proImgages, Products products)
            throws Exception {
        try {
            Products_images productsImagesOnDb = super.getById(productImages.getId());
            productImages.setCreatedDate(productsImagesOnDb.getCreatedDate());
            if (!isEmptyUploadFile(proImgages)) {
                new File(MVCConf.ROOT_UPLOAD_PATH + productsImagesOnDb.getPath()).delete();
                proImgages.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/picture/" + proImgages.getOriginalFilename()));
                productImages.setPath("product/picture/" + proImgages.getOriginalFilename());
                productImages.setTitle(proImgages.getOriginalFilename());
                productImages.setProducts(products);
            } else {
                productImages.setPath(productsImagesOnDb.getPath());
                productImages.setTitle(productsImagesOnDb.getTitle());
                productImages.setProducts(products);

            }
            return super.save(productImages);
        } catch (Exception e) {
            throw e;
        }
    }
}
