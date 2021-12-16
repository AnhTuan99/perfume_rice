package com.devpro.shop13.services;

import com.devpro.shop13.conf.MVCConf;
import com.devpro.shop13.entities.Brands;
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
public class BrandsService extends BaseService<Brands> {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<Brands> clazz() {
        return Brands.class;
    }

    public List<Brands> search() {
        String sql = "SELECT * FROM tbl_brands c WHERE status=true";

        return this.executeNativeSql(sql);
    }

    public Brands searchAdmin(int id) {
        String sql = "select * from tbl_brands  where id=" + id;
        Query query = entityManager.createNativeQuery(sql, Brands.class);
        return (Brands) query.getSingleResult();
    }

    private boolean isEmptyUploadFile(MultipartFile image) {
        return image == null || image.getOriginalFilename().isEmpty();
    }

    @Transactional(rollbackOn = Exception.class)
    public Brands save(Brands brands, MultipartFile avatar) throws IOException {
        try {
            if (!isEmptyUploadFile(avatar)) {
                avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "brands/avatar/" + avatar.getOriginalFilename()));
                brands.setAvatar("brands/avatar/" + avatar.getOriginalFilename());
            }
            return super.save(brands);
        } catch (Exception e) {
            throw e;
        }
    }

    @Transactional(rollbackOn = Exception.class)
    public Brands Update(Brands brands, MultipartFile avatar) throws IOException {
        try {
            Brands brandsOnDb = super.getById(brands.getId());
            brands.setCreatedDate(brandsOnDb.getCreatedDate());
            if (!isEmptyUploadFile(avatar)) {
                new File(MVCConf.ROOT_UPLOAD_PATH + brandsOnDb.getAvatar()).delete();
                avatar.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "brands/avatar/" + avatar.getOriginalFilename()));
                brands.setAvatar("brands/avatar/" + avatar.getOriginalFilename());
            } else {
                brands.setAvatar(brandsOnDb.getAvatar());
            }
            return super.save(brands);
        } catch (Exception e) {
            throw e;
        }
    }
}
