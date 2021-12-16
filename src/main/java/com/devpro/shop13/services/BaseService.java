package com.devpro.shop13.services;

import com.devpro.shop13.dto.ProductSearch;
import com.devpro.shop13.entities.BaseEntity;
import com.devpro.shop13.taglibs.PaginationTaglib;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public abstract class BaseService<E extends BaseEntity> {

    protected abstract EntityManager em();

    protected abstract Class<E> clazz();

    public E getById(int id) {
        return em().find(clazz(), id);
    }

    public List<E> findAll() {
        Table tbl = clazz().getAnnotation(Table.class);
        return (List<E>) em().createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
    }

    public List<E> findAll(ProductSearch productSearch, int max) {
        Table tbl = clazz().getAnnotation(Table.class);
        Query query = em().createNativeQuery("SELECT * FROM " + tbl.name(), clazz());
        if (productSearch.getOffset() != null) {
            productSearch.setCount(query.getResultList().size());
            query.setFirstResult(productSearch.getOffset());
            query.setMaxResults(PaginationTaglib.MAX = max);
        }
        return (List<E>) query.getResultList();
    }

    @Transactional
    public E save(E entity) {
        if (entity.getId() == null || entity.getId() <= 0) {
            em().persist(entity);
            return entity;
        } else {
            return em().merge(entity);
        }
    }

    public void delete(E entity) {
        em().remove(entity);
    }

    public void deleteById(int id) {
        E entity = this.getById(id);
        delete(entity);
    }

    public List<E> executeNativeSql(String sql) {
        try {
            Query query = em().createNativeQuery(sql, clazz());
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<E>();
        }
    }

}
