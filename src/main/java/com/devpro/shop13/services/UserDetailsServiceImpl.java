package com.devpro.shop13.services;

import com.devpro.shop13.dto.MyUser;
import com.devpro.shop13.entities.Users;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @PersistenceContext
    protected EntityManager entityManager;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        try {
            String sql = "SELECT * FROM tbl_users where username = '" + username + "'";
            Query query = entityManager.createNativeQuery(sql, Users.class);
            Users users = (Users) query.getSingleResult();
            if (users == null) {
                throw new UsernameNotFoundException(username);
            }
            return new MyUser(users);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
