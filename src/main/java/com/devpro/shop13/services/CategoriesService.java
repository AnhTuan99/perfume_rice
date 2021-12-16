package com.devpro.shop13.services;

import com.devpro.shop13.entities.Categories;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class CategoriesService extends BaseService<Categories> {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<Categories> clazz() {
        return Categories.class;
    }

    public List<Categories> search() {
        String sql = "SELECT * FROM tbl_category c WHERE status=true";

        return this.executeNativeSql(sql);
    }

    public String getTitleSort(String sortby) {
        String titleSortBy = "";
        if (sortby != null && sortby.equals("nameasc")) {
            titleSortBy = "A -> Z";
        } else if (sortby != null && sortby.equals("namedesc")) {
            titleSortBy = "Z -> A";
        } else if (sortby != null && sortby.equals("priceasc")) {
            titleSortBy = "Giá tăng dần";
        } else if (sortby != null && sortby.equals("pricedesc")) {
            titleSortBy = "Giá giảm dần";
        } else if (sortby != null && sortby.equals("createdasc")) {
            titleSortBy = "Hàng mới nhất";
        } else if (sortby != null && sortby.equals("createddesc")) {
            titleSortBy = "Hàng cũ nhất";
        } else
            titleSortBy = "Mặc đinh";
        return titleSortBy;
    }
}
