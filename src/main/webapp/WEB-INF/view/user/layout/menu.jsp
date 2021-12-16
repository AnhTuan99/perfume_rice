<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<nav>
    <div class="container">
      <div class="row">
        <div class="nav-inner col-lg-12">
          <ul id="nav" class="hidden-xs">
            <li class="level0 parent drop-menu active"><a href="/index"><span>TRANG CHỦ</span></a></li>
            <li class="level0 nav-8 level-top"><a href="/aboutUs" class="level-top"><span>GIỚI THIỆU</span></a></li>
            <li class="level0 parent drop-menu"><a href="/category/${'all'}"><span>SẢN PHẨM</span></a>
              <ul class="level1">
                <c:forEach var = "category" items = "${categories }">
                  <li class="level1 first"><a href="/category/${category.id}"><span>${category.name}</span></a></li>
                </c:forEach>
              </ul>
            </li>
            <li class="level0 nav-8 level-top"><a href="/news" class="level-top"><span>TIN TỨC</span></a></li>
            <li class="level0 nav-8 level-top"><a href="/storeAddress" class="level-top"><span>CỬA HÀNG</span></a></li>
            <li class="level0 nav-8 level-top"><a href="/contact" class="level-top"><span>LIÊN HỆ</span></a></li>
          </ul>
          <div class="menu_top" >
            <div class="top-cart-contain pull-right" >
              <!-- Top Cart -->
              <div class="mini-cart">
                <div   data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle">
                  <a type="button" onclick="setLocationCart();" href="" style="color: white" >Giỏ Hàng <span  class="badge" id="so_luong_sp" >${SL_SP_GIO_HANG>0?SL_SP_GIO_HANG:0}</span></a>
                </div>
                <div id="showProduct">
                  <div class="top-cart-content" style="display: none;">
                    <div class="block-subtitle">
                      <div class="top-subtotal"><span id="soLuongInMenu">${SL_SP_GIO_HANG>0?SL_SP_GIO_HANG:0}</span> mặt hàng
                        <span class="price" id="tongtienT">
                          <c:choose>
                            <c:when test="${empty GIO_HANG.sanPhamTrongGioHangs}">
                              <span style="text-transform: lowercase">0 đ</span>
                            </c:when>
                            <c:otherwise>
                              <fmt:setLocale value="vi_VN" scope="session" />
                              <fmt:formatNumber value="${tong_gia }" type="currency" />
                            </c:otherwise>
                          </c:choose>

                        </span>
                      </div>
                      <!--top-subtotal-->
                      <div class="pull-right">
                        <button title="View Cart" class="view-cart" type="button" ><a href="/cart"><span>Xem Giỏ Hàng</span></a></button>
                      </div>
                      <!--pull-right-->
                    </div>
                    <!--block-subtitle-->
                    <ul style="width: 342px;" class="mini-products-list" id="cart-sidebar">

                      <div class="alert alert-danger text-left" id="noProInCart" style="display: none">
                        <strong>!Không </strong> có sản phẩm trong giỏ hàng
                      </div>
                      <c:choose>
                        <c:when test="${empty GIO_HANG.sanPhamTrongGioHangs}">
                          <div class="alert alert-danger text-left">
                            <strong>!Không </strong> có sản phẩm trong giỏ hàng
                          </div>

                        </c:when>
                        <c:otherwise>
                          <c:forEach items="${GIO_HANG.sanPhamTrongGioHangs }" var="item" varStatus="loop">
                            <li id="spInMenu${item.productId}" class="item first" >
                              <div class="item-inner"><a class="product-image" title="Sample Product" href="/detailProducts/${item.productId}"><img id="anh" alt="Sample Product" src="/upload/${item.avatar }"></a>
                                <div class="product-details">
                                  <div class="access" onclick="order.xoa_sp_trong_gio_hang(${item.productId})"><a class="btn-remove1" title="Remove This Item" href="#">Remove</a> </div>
                                  <strong>
                                      ${item.soLuong }
                                  </strong> x
                                  <span class="price">
                                              <fmt:setLocale value="vi_VN" scope="session" />
                                              <fmt:formatNumber value="${item.giaBan}" type="currency" />
                                  </span>
                                  <p class="product-name" data-masp ="${item.productId }"><a href="/detailProducts/${item.productId}">${item.tenSP }</a></p>
                                </div>
                              </div>
                            </li>

                          </c:forEach>
                        </c:otherwise>
                      </c:choose>
                    </ul>
                    <div class="actions" >
                      <button class="btn-checkout" title="Checkout" onclick="setLocationCart();"  type="button"><span>Đặt Hàng</span></button>
                    </div>
                    <!--actions-->
                  </div>
                </div>

              </div>
              <!-- Top Cart -->
              <div id="ajaxconfig_info" style="display:none"><a href="#/"></a>
                <input value="" type="hidden">
                <input id="enable_module" value="1" type="hidden">
                <input class="effect_to_cart" value="1" type="hidden">
                <input class="title_shopping_cart" value="Go to shopping cart" type="hidden">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </nav>

<script>
  function setLocationCart(){
    window.location.href = "/cart";
  }

</script>
