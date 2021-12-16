package com.devpro.shop13.services;

import com.devpro.shop13.dto.Cart;
import com.devpro.shop13.dto.ProductInCart;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Saleorder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class CartService {
    @PersistenceContext
    EntityManager entityManager;

    public List<Saleorder> search() {
        String sql = "SELECT * FROM tbl_saleorder c WHERE status=true";
        Query query = entityManager.createNativeQuery(sql, Products.class);
        return query.getResultList();
    }

    private int getTotalItems(final HttpServletRequest request) {
        HttpSession httpSession = request.getSession();

        if (httpSession.getAttribute("GIO_HANG") == null) {
            return 0;
        }

        Cart cart = (Cart) httpSession.getAttribute("GIO_HANG");
        List<ProductInCart> cartItems = cart.getSanPhamTrongGioHangs();

        int total = 0;
        for (ProductInCart item : cartItems) {
            total += 1;
        }

        return total;
    }
}
