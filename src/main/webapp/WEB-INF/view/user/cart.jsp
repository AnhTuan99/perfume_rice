<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<!-- Tieu Long Lanh Kute -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<title>Giỏ Hàng</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<jsp:include page="/WEB-INF/view/user/layout/css.jsp"></jsp:include>

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700,900' rel='stylesheet' type='text/css'>
</head>

<body class="cms-index-index cms-home-page">
<div id="page">
  <!-- Header -->
<jsp:include page="/WEB-INF/view/user/layout/header.jsp"></jsp:include>
  <!-- end header -->
  <div class="mm-toggle-wrap">
    <div class="mm-toggle"><i class="icon-align-justify"></i><span class="mm-label">Menu</span> </div>
  </div>
  <!-- Navbar -->
<jsp:include page="/WEB-INF/view/user/layout/menu.jsp"></jsp:include>
  <!-- end nav -->


  <!-- main container -->
   <section class="main-container col1-layout wow bounceInUp animated">
      <div class="main container">
        <div class="col-main">
          <div class="cart">
            <div class="page-title">
              <h2>Giỏ hàng của bạn</h2>
            </div>
            <tbody>
            <c:choose>
            <c:when test="${empty GIO_HANG.sanPhamTrongGioHangs}">
            <div class="alert alert-danger">
              <strong>!Không </strong> có sản phẩm trong giỏ hàng
            </div>
            <img class=" col-lg-12 col-sm-12 col-xs-12" class="img-responsive" alt="Sample Product" src="/user/images/emptyCart.jpg">

            </c:when>
            <c:otherwise>
            <div style="display: none" id="alertPro">
              <div class="alert alert-danger" >
                <strong>!Không </strong> có sản phẩm trong giỏ hàng
              </div>
              <img class=" col-lg-12 col-sm-12 col-xs-12" class="img-responsive" alt="Sample Product" src="/user/images/emptyCart.jpg">
            </div>
            <table class="table table-hover" style="background: #FFEFDB;"  >
              <tbody>
              <div class="table-responsive">
                <form method="post" action="#">
                  <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
                  <fieldset>
                    <table class="data-table cart-table" id="shopping-cart-table">
                      <thead>
                      <tr class="first last">
                        <th rowspan="1">&nbsp;</th>
                        <th rowspan="1"><span class="nobr">Tên Sản Phẩm</span></th>
                        <th colspan="1" class="a-center"><span class="nobr">Đơn Giá</span></th>
                        <th class="a-center " rowspan="1">Số Lượng</th>
                        <th colspan="1" class="a-center">Tạm Tính</th>
                        <th class="a-center" rowspan="1">&nbsp;</th>
                      </tr>
                      </thead>
                      <tfoot>
                      <tr class="first last">
                        <td class="a-right last" colspan="8">
                          <button  onclick="setLocation();" class="button btn-continue" title="Continue Shopping" type="button">
                            <span>Tiếp Tục Mua Hàng</span>
                          </button>
                          <%-- <button class="button btn-update" title="Update Cart" value="update_qty" name="update_cart_action" type="submit"><span>Cập Nhật Giỏ hàng</span></button>
                          <button id="empty_cart_button" class="button" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit" onclick="order.update_sl_sp_trong_gio_hang(${item.productId})"><span>Xóa Giỏ Hàng</span></button></td> --%>
                      </tr>
                      </tfoot>
                      <tbody>
                      <c:forEach items="${GIO_HANG.sanPhamTrongGioHangs }" var="item" varStatus="loop">

                        <tr id="sp${item.productId}" class="first odd" >
                          <td class="image"><a class="product-image" title="Sample Product" href="/detailProducts/${item.productId}"><img width="75" alt="Sample Product" src="/upload/${item.avatar }"></a></td>
                          <td data-masp ="${item.productId }"><h2 class="product-name"> <a href="/detailProducts/${item.productId}">${item.tenSP }</a> </h2></td>
                          <td class="a-center hidden-table">
                            <span class="cart-price">
                              <span class="price">
                                <fmt:setLocale value="vi_VN" scope="session" />
                                <fmt:formatNumber value="${item.giaBan }" type="currency" />
                              </span>
                            </span>
                          </td>
                          <td class="a-center movewishlist">
                            <input onchange="order.update_sl_sp_trong_gio_hang(${item.productId }, ${item.giaBan },${item.tongSoLuong});" class="so_luong_sp${item.productId }" value="${item.soLuong }" min="1" max="${item.tongSoLuong}" maxlength="12" class="input-text qty" title="Qty" size="4" name="cart[10522][qty] " class="so_luong_sp" type="number"    >
                           <%-- <input class="slBD${item.productId }" type="number" value="${item.soLuong }" >--%>
                          </td>
                          <td class="a-center movewishlist">
                            <span class="cart-price">
                              <span class="price" id="giatien${item.productId }">
                                <fmt:setLocale value="vi_VN" scope="session" />
                                <fmt:formatNumber value="${item.tongGia}" type="currency" />
                              </span>
                            </span>
                          </td>
                          <td class="a-center last" onclick="order.xoa_sp_trong_gio_hang(${item.productId})"><a class="button remove-item" title="Remove item" href="#"><span><span>Remove item</span></span></a></td>
                        </tr>


                      </c:forEach>

                      </tbody>
                    </table>
                  </fieldset>
                </form>
              </div>


              </tbody>
            </table>


            <!-- BEGIN CART COLLATERALS -->
            <form method="POST" action="/datHang" id="formCart">
              <div class="cart-collaterals row">
                <div class="col-sm-4">
                  <div class="shipping">
                    <h3>Thông Tin Nhận Hàng</h3>
                    <div class="shipping-form">
                      <form id="shipping-zip-form" method="POST" action="#">
                        <p>Vui lòng nhập các thông tin giao hàng.</p>
                        <ul class="form-list">

                          <li>
                            <label for="fullname">Họ Và Tên</label>
                            <div class="input-box">
                              <input value="${users.fullName}" required placeholder="Nhập họ và tên" type="text" name="fullname" id="fullname" class="input-text validate-postcode">
                            </div>
                          </li>
                          <li>
                            <label for="email">Email</label>
                            <div class="input-box">
                              <input value="${users.email}" required placeholder="Nhập email" type="email" name="email" id="email" class="input-text validate-postcode">
                            </div>
                          </li>
                          <li>
                            <label for="phone">Số Điện Thoại</label>
                            <div class="input-box">
                              <input value="${users.telephone}" required placeholder="Nhập số điện thoại" type="number" name="phone" id="phone" class="input-text validate-postcode">
                            </div>
                          </li>
                          <li>
                            <label for="address">Địa Chỉ</label>
                            <div class="input-box">
                              <input value="${users.address}" required placeholder="Nhập địa chỉ" type="text" name="address" id="address" class="input-text validate-postcode">
                            </div>
                          </li>

                        </ul>
                        <!--buttons-set11-->
                      </form>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="discount">
                    <h3>Mã Giảm Giá</h3>
                    <form method="post" action="#" id="discount-coupon-form">
                      <label for="coupon_code">Nhập mã phiếu giảm giá của bạn nếu bạn có.</label>
                      <input type="hidden" value="0" id="remove-coupone" name="remove">
                      <input placeholder="Nhập mã giảm giá" type="text" name="coupon_code" id="coupon_code" class="input-text fullwidth">
                      <button value="Apply Coupon" class="button coupon " title="Apply Coupon" type="button"><span>Áp Dụng</span></button>
                    </form>
                  </div>
                </div>
                <div class="totals col-sm-4">
                  <h3>Giá Trị Giỏ Hàng</h3>
                  <div class="inner">
                    <table class="table shopping-cart-table-total" id="shopping-cart-totals-table">

                      <tfoot>
                      <tr>
                        <td colspan="1" class="a-left"><strong>Thành Tiền</strong></td>
                        <td class="a-right"><strong>
                        <span class="price" id="tongtien">
                          <fmt:setLocale value="vi_VN" scope="session" />
                          <fmt:formatNumber value="${tong_gia}" type="currency" />
                        </span>
                        </strong></td>
                      </tr>
                      </tfoot>

                    </table>
                    <ul class="checkout">
                      <li>
                        <button  class="button btn-proceed-checkout" title="Proceed to Checkout" type="submit"><span>Tiến Hành Đặt Hàng</span></button>
                      </li>

                    </ul>
                  </div>
                  <!--inner-->

                </div>
              </div>
            </form>
            </c:otherwise>

            </c:choose>



            <!--cart-collaterals-->

          </div>
         <%-- <div class="crosssel wow bounceInUp animated">
            <div class="">
              <h2>Dựa trên lựa chọn của bạn, bạn có thể quan tâm đến các mục sau:</h2>
            </div>
            <div class="category-products">
              <ul class="products-grid crosssel-pro">
                <li class="item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info"> <a href="product_detail.html" title="Sample Product" class="product-image"> <img src="user/products-images/product11.jpg" alt="Sample Product"> </a>
                        <div class="new-label new-top-left">New</div>
                        <div class="item-box-hover">
                          <div class="box-inner">
                            <div class="actions">
                              <div class="add_cart">
                                <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                              </div>
                              <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                              <span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Sample Product"> Sample Product </a> </div>
                        <div class="item-content">
                          <div class="rating">
                            <div class="ratings">
                              <div class="rating-box">
                                <div class="rating" style="width:80%"></div>
                              </div>
                              <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                            </div>
                          </div>
                          <div class="item-price">
                            <div class="price-box"> <span class="regular-price" id="product-price-1"> <span class="price">$125.00</span> </span> </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info"> <a href="product_detail.html" title="Sample Product" class="product-image"> <img src="user/products-images/product12.jpg" alt="Sample Product"> </a>
                        <div class="sale-label sale-top-left">Sale</div>
                        <div class="item-box-hover">
                          <div class="box-inner">
                            <div class="actions">
                              <div class="add_cart">
                                <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                              </div>
                              <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                              <span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Sample Product"> Sample Product </a> </div>
                        <div class="item-content">
                          <div class="rating">
                            <div class="ratings">
                              <div class="rating-box">
                                <div class="rating" style="width:40%"></div>
                              </div>
                              <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                            </div>
                          </div>
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $100.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $90.00 </span> </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info"> <a href="product_detail.html" title="Sample Product" class="product-image"> <img src="user/products-images/product13.jpg" alt="Sample Product"> </a>
                        <div class="item-box-hover">
                          <div class="box-inner">
                            <div class="actions">
                              <div class="add_cart">
                                <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                              </div>
                              <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                              <span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Sample Product"> Sample Product </a> </div>
                        <div class="item-content">
                          <div class="rating">
                            <div class="ratings">
                              <div class="rating-box">
                                <div class="rating" style="width:0%"></div>
                              </div>
                              <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                            </div>
                          </div>
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $100.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $90.00 </span> </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
                <li class="item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="item-img-info"> <a href="product_detail.html" title="Sample Product" class="product-image"> <img src="user/products-images/product14.jpg" alt="Sample Product"> </a>
                        <div class="item-box-hover">
                          <div class="box-inner">
                            <div class="actions">
                              <div class="add_cart">
                                <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                              </div>
                              <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                              <span class="add-to-links"> <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Sample Product"> Sample Product </a> </div>
                        <div class="item-content">
                          <div class="rating">
                            <div class="ratings">
                              <div class="rating-box">
                                <div class="rating" style="width:100%"></div>
                              </div>
                              <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                            </div>
                          </div>
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $100.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $90.00 </span> </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>--%>
        </div>
      </div>
    </section>
    <div class="top-banner-section wow bounceInUp animated">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-sm-3 col-xs-6">
            <div class="col add-banner1">
              <div class="top-b-text"><strong>Designer Shoes</strong> For Women</div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-3 col-xs-6">
            <div class="col free-shipping"><strong>Free Shipping</strong> on order over $199</div>
          </div>
          <div class="col-lg-3 col-sm-3 col-xs-6">
            <div class="col add-banner2">
              <div class="top-b-text"><strong>Luxury Handbags</strong>2015 New Arrive</div>
            </div>
          </div>
          <div class="col-lg-3 col-sm-3 col-xs-6">
            <div class="col last offer"><strong>New Collection</strong> Lorem ipsum.</div>
          </div>
        </div>
      </div>
    </div>
  <!-- end main container -->


  <!-- Footer -->
<jsp:include page="/WEB-INF/view/user/layout/footer.jsp"></jsp:include>
<!-- End Footer -->
<!-- JavaScript -->
<jsp:include page="/WEB-INF/view/user/layout/js.jsp"></jsp:include>
<script type='text/javascript'>
jQuery(document).ready(function(){
jQuery('#rev_slider_4').show().revolution({
dottedOverlay: 'none',
delay: 5000,
startwidth: 1920,
startheight: 650,

hideThumbs: 200,
thumbWidth: 200,
thumbHeight: 50,
thumbAmount: 2,

navigationType: 'thumb',
navigationArrows: 'solo',
navigationStyle: 'round',

touchenabled: 'on',
onHoverStop: 'on',

swipe_velocity: 0.7,
swipe_min_touches: 1,
swipe_max_touches: 1,
drag_block_vertical: false,

spinner: 'spinner0',
keyboardNavigation: 'off',

navigationHAlign: 'center',
navigationVAlign: 'bottom',
navigationHOffset: 0,
navigationVOffset: 20,

soloArrowLeftHalign: 'left',
soloArrowLeftValign: 'center',
soloArrowLeftHOffset: 20,
soloArrowLeftVOffset: 0,

soloArrowRightHalign: 'right',
soloArrowRightValign: 'center',
soloArrowRightHOffset: 20,
soloArrowRightVOffset: 0,

shadow: 0,
fullWidth: 'on',
fullScreen: 'off',

stopLoop: 'off',
stopAfterLoops: -1,
stopAtSlide: -1,

shuffle: 'off',

autoHeight: 'off',
forceFullWidth: 'on',
fullScreenAlignForce: 'off',
minFullScreenHeight: 0,
hideNavDelayOnMobile: 1500,

hideThumbsOnMobile: 'off',
hideBulletsOnMobile: 'off',
hideArrowsOnMobile: 'off',
hideThumbsUnderResolution: 0,

hideSliderAtLimit: 0,
hideCaptionAtLimit: 0,
hideAllCaptionAtLilmit: 0,
startWithSlide: 0,
fullScreenOffsetContainer: ''
});
});

</script>
</body>

<!-- Tieu Long Lanh Kute -->
</html>
<script>
  function setLocation(){
    window.location.href = "/category/${"all"}";
  }

</script>

