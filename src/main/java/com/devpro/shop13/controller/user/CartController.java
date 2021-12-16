package com.devpro.shop13.controller.user;

import com.devpro.shop13.dto.*;
import com.devpro.shop13.entities.Products;
import com.devpro.shop13.entities.Saleorder;
import com.devpro.shop13.entities.Saleorder_products;
import com.devpro.shop13.entities.Users;
import com.devpro.shop13.services.ProductService;
import com.devpro.shop13.services.SaleOrderService;
import com.devpro.shop13.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

@Controller
public class CartController extends BaseController {
    @Autowired
    private ProductService productService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private SaleOrderService saleOrderService;

    @RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
    public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            Users users = usersService.getById(((MyUser) principal).getId());
            model.addAttribute("users", users);
        }

        return "user/cart";
    }

    @RequestMapping(value = {"/chon-san-pham-dua-vao-gio-hang"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> muaHang(@RequestBody ProductInCart sanPhamTrongGioHang,
                                                final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {

        HttpSession httpSession = request.getSession();

        Cart gioHang = null;

        if (httpSession.getAttribute("GIO_HANG") != null) {
            gioHang = (Cart) httpSession.getAttribute("GIO_HANG");
        } else {
            gioHang = new Cart();
            httpSession.setAttribute("GIO_HANG", gioHang);
        }

        List<ProductInCart> _sanPhamTrongGioHangs = gioHang.getSanPhamTrongGioHangs();

        boolean sanPhamDaCoTrongGioHangPhaiKhong = false;

        for (ProductInCart item : _sanPhamTrongGioHangs) {
            if (item.getProductId() == sanPhamTrongGioHang.getProductId()) {
                sanPhamDaCoTrongGioHangPhaiKhong = true;
                item.setSoLuong(item.getSoLuong() + sanPhamTrongGioHang.getSoLuong());

            }

            item.setTongGia(item.getGiaBan().multiply(new BigDecimal(item.getSoLuong())));
        }

        if (!sanPhamDaCoTrongGioHangPhaiKhong) {

            Products product = productService.getById(sanPhamTrongGioHang.getProductId());
            sanPhamTrongGioHang.setTenSP(product.getTitle());
            sanPhamTrongGioHang.setAvatar(product.getAvatar());
            BigDecimal giaBan = product.getPrice();
            if (product.getSaleoff() != 0) {
                giaBan = product.getPrice().subtract(product.getPrice().multiply(new BigDecimal(product.getSaleoff()).divide(new BigDecimal(100))));
            }
            sanPhamTrongGioHang.setGiaBan(giaBan);
            sanPhamTrongGioHang.setTongGia(giaBan.multiply(new BigDecimal(sanPhamTrongGioHang.getSoLuong())));
            sanPhamTrongGioHang.setTongSoLuong(product.getAmount());
            gioHang.getSanPhamTrongGioHangs().add(sanPhamTrongGioHang);
        }
        BigDecimal sum = BigDecimal.ZERO;

        for (ProductInCart item : _sanPhamTrongGioHangs) {
            sum = sum.add(item.getTongGia());


        }
        httpSession.setAttribute("tong_gia", sum);
        httpSession.setAttribute("SL_SP_GIO_HANG", getTotalItems(request));

        return ResponseEntity.ok(new AjaxResponse(200, String.valueOf(gioHang.getSanPhamTrongGioHangs().size()), Collections.singletonList(_sanPhamTrongGioHangs)));
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

    @RequestMapping(value = {"/xoa-sp-gio-hang"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> xoaSP_in_Cart(@RequestBody ProductInCart sanPhamTrongGioHang,
                                                      final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        HttpSession httpSession = request.getSession();

        Cart gioHang = (Cart) httpSession.getAttribute("GIO_HANG");
        ProductInCart itemRemove = new ProductInCart();
        for (ProductInCart item : gioHang.getSanPhamTrongGioHangs()) {
            if (item.getProductId() == sanPhamTrongGioHang.getProductId()) {
                itemRemove = item;
            }
        }
        gioHang.getSanPhamTrongGioHangs().remove(itemRemove);

        BigDecimal sum = BigDecimal.ZERO;

        for (ProductInCart item : gioHang.getSanPhamTrongGioHangs()) {
            sum = sum.add(item.getTongGia());


        }
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String total = currencyVN.format(sum);
        httpSession.setAttribute("tong_gia", sum);
        httpSession.setAttribute("SL_SP_GIO_HANG", getTotalItems(request));
        ParseNumToString parseNumToString = new ParseNumToString();
        parseNumToString.setSoLuong(String.valueOf(getTotalItems(request)));
        parseNumToString.setTongGia(total);
        return ResponseEntity.ok(new AjaxResponse(200, parseNumToString));
    }

    @RequestMapping(value = {"/update-sp-gio-hang"}, method = RequestMethod.POST)
    public ResponseEntity<AjaxResponse> update_SP_in_Cart(@RequestBody ProductInCart productInCart,
                                                          final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws IOException {
        HttpSession httpSession = request.getSession();
        Cart gioHang = (Cart) httpSession.getAttribute("GIO_HANG");
        for (ProductInCart item : gioHang.getSanPhamTrongGioHangs()) {
            if (item.getProductId() == productInCart.getProductId()) {
                item.setSoLuong(productInCart.getSoLuong());
                item.setTongGia(item.getGiaBan().multiply(new BigDecimal(item.getSoLuong())));
                productInCart.setTongGia(item.getTongGia());
            }
        }
        BigDecimal sum = BigDecimal.ZERO;
        for (ProductInCart item : gioHang.getSanPhamTrongGioHangs()) {
            sum = sum.add(item.getTongGia());
        }
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        String tongGia = currencyVN.format(sum);
        String soLuong = currencyVN.format(productInCart.getTongGia());
        ParseNumToString parseNumToString = new ParseNumToString();
        parseNumToString.setTongGia(tongGia);
        parseNumToString.setSoLuong(soLuong);
        httpSession.setAttribute("tong_gia", sum);
        return ResponseEntity.ok(new AjaxResponse(200, parseNumToString));
    }

    public String checkSL(Cart gioHang) {
        String err = "";
        for (ProductInCart spInCart : gioHang.getSanPhamTrongGioHangs()) {
            Products productsInDB = productService.getById(spInCart.getProductId());
            if (productsInDB.getAmount() < spInCart.getSoLuong()) {
                err += spInCart.getTenSP() + " ";
            }
        }
        return err;
    }

    @RequestMapping(value = {"/datHang"}, method = RequestMethod.POST)
    public String datHang(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        HttpSession httpSession = request.getSession();
        Cart gioHang = (Cart) httpSession.getAttribute("GIO_HANG");

        if (checkSL(gioHang) != "") {
            model.addAttribute("messsage", "<div class=\"alert alert-danger\">"
                    + "  <strong>Failed!</strong> Số lượng sản phẩm " + checkSL(gioHang) + " không đủ" + "</div>");
            return "front-end/cart";
        } else {
            String name = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            Saleorder saleOrder = new Saleorder();
            saleOrder.setCreatedDate(LocalDateTime.now());
            saleOrder.setCustomer_name(name);
            saleOrder.setCustomer_phone(phone);
            saleOrder.setCutomer_email(email);
            saleOrder.setCustomer_address(address);
            saleOrder.setTotal(gioHang.getTotal(productService));
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal instanceof UserDetails) {
                saleOrder.setCreatedBy(((MyUser) principal).getId());
                Users users = usersService.getById(((MyUser) principal).getId());
                saleOrder.setUsers(users);
            }
            for (ProductInCart sanPhamTrongGioHang : gioHang.getSanPhamTrongGioHangs()) {
                Products productsInDB = productService.getById(sanPhamTrongGioHang.getProductId());
                Saleorder_products saleOrderProducts = new Saleorder_products();
                Products products = productService.getById(sanPhamTrongGioHang.getProductId());
                saleOrderProducts.setProducts(products);
                saleOrderProducts.setQuality(sanPhamTrongGioHang.getSoLuong());
                saleOrderProducts.setCreatedDate(LocalDateTime.now());
                productsInDB.setAmount(productsInDB.getAmount() - sanPhamTrongGioHang.getSoLuong());
                productService.save(productsInDB);
                saleOrder.addSaleorder_products(saleOrderProducts);
            }
            saleOrderService.save(saleOrder);
            httpSession.removeAttribute("GIO_HANG");
            httpSession.removeAttribute("tong_gia");
            httpSession.removeAttribute("SL_SP_GIO_HANG");
            return "redirect:/buy-success/?add=success";
        }
    }

    @RequestMapping(value = {"/buy-success"}, method = RequestMethod.GET)
    public String buy_success(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
            throws Exception {
        return "user/buySuccess";
    }
}

