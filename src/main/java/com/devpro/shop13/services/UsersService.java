package com.devpro.shop13.services;

import com.devpro.shop13.Exception.CustomerNotFoundException;
import com.devpro.shop13.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class UsersService extends BaseService<Users> {

    @PersistenceContext
    EntityManager entityManager;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    protected EntityManager em() {
        return entityManager;
    }

    @Override
    protected Class<Users> clazz() {
        return Users.class;
    }

    public List<Users> search() {
        String sql = "SELECT * FROM tbl_users c WHERE status=true";
        return executeNativeSql(sql);
    }

    public Users findByEmail(String email) {
        String sql = "SELECT * FROM tbl_users c WHERE status=true AND email='" + email + "'";
        Query query = entityManager.createNativeQuery(sql, Users.class);
        return (Users) query.getSingleResult();
    }

    public Users findByResetPasswordToken(String token) {
        String sql = "SELECT * FROM tbl_users c WHERE status=true AND reset_password_token='" + token + "'";
        Query query = entityManager.createNativeQuery(sql, Users.class);
        return (Users) query.getSingleResult();
    }

    @Transactional(rollbackOn = Exception.class)
    public void updateResetPasswordToken(String token, String email) throws CustomerNotFoundException {
        try {
            Users users = findByEmail(email);
            users.setResetPasswordToken(token);
            super.save(users);
        } catch (Exception ex) {
            throw new CustomerNotFoundException("Không thể tìm thấy bất kỳ khách hàng nào có email " + email);
        }
    }

    @Transactional(rollbackOn = Exception.class)
    public void updatePassword(Users users, String newPassword) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(newPassword);
        users.setPassword(encodedPassword);

        users.setResetPasswordToken(null);
        super.save(users);
    }

    public boolean checkIfValidOldPassword(Users users, String passOld) {
        boolean match = passwordEncoder.matches(passOld, users.getPassword());
        return match;
    }
}
