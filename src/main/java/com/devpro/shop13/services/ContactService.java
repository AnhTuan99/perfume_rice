package com.devpro.shop13.services;

import com.devpro.shop13.entities.Contact;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
public class ContactService extends BaseService<Contact> {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<Contact> clazz() {
        return Contact.class;
    }

    public List<Contact> search() {
        String sql = "SELECT * FROM tbl_contact c WHERE status=true";
        return executeNativeSql(sql);
    }
}
