<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- end banner section -->
<div class="brand-logo">
  <div class="container">
    <div class="slider-items-products">
      <div id="brand-logo-slider"
           class="product-flexslider hidden-buttons">
        <div class="slider-items slider-width-col6">

          <c:forEach var="br" items="${brands }" varStatus="loop">
            <!-- Item -->
            <div class="item">
              <a href="#"><img style="width: 130px; height: 50px;" src="/upload/${br.avatar}" alt="Image"></a>
            </div>
            <!-- End Item -->
          </c:forEach>


        </div>
      </div>
    </div>
  </div>
</div>
<footer>
    <section class="footer-navbar">
      <div class="footer-inner">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 col-xs-12 col-lg-8">
              <div class="footer-column pull-left collapsed-block">
                <h4>Hướng Dẫn Mua Sắm<a class="expander visible-xs" href="#TabBlock-1">+</a></h4>
                <div class="tabBlock" id="TabBlock-1">
                  <ul class="links">
                    <li class="first"><a href="#" title="How to buy">Làm thế nào để mua</a></li>
                    <li><a href="faq.html" title="FAQs">FAQs</a></li>
                    <li><a href="#" title="Payment">Thanh toán</a></li>
                    <li><a href="#" title="Shipment&lt;/a&gt;">Chuyển phát</a></li>
                    <li><a href="#" title="Where is my order?">Đơn hàng của tôi ở đâu?</a></li>
                    <li class="last"><a href="#" title="Return policy">Chính sách hoàn trả</a></li>
                  </ul>
                </div>
              </div>
              <div class="footer-column pull-left collapsed-block">
                <h4>Hướng Dẫn<a class="expander visible-xs" href="#TabBlock-2">+</a></h4>
                <div class="tabBlock" id="TabBlock-2">
                  <ul class="links">
                    <li class="first"><a title="Your Account" href="login.html">Tài khoản của bạn</a></li>
                    <li><a title="Information" href="#">Thông tin</a></li>
                    <li><a title="Addresses" href="#">Địa chỉ</a></li>
                    <li><a title="Addresses" href="#">Giảm giá</a></li>
                    <li><a title="Orders History" href="#">Lịch sử đơn hàng</a></li>
                    <li class="last"><a title=" Additional Information" href="#">Thông tin thêm</a></li>
                  </ul>
                </div>
              </div>
              <div class="footer-column pull-left collapsed-block">
                <h4>Thông tin<a class="expander visible-xs" href="#TabBlock-3">+</a></h4>
                <div class="tabBlock" id="TabBlock-3">
                  <ul class="links">
                    <li class="first"><a href="#" title="privacy policy">Chính sách bảo mật</a></li>
                    <li><a href="#" title="Search Terms">Cụm từ tìm kiếm</a></li>
                    <li><a href="#" title="Advanced Search">Tìm kiếm nâng cao</a></li>
                    <li><a href="contact_us.html" title="Contact Us">Liên hệ</a></li>
                    <li><a href="#" title="Suppliers">Các nhà cung cấp</a></li>
                    <li class=" last"><a href="#" title="Our stores" class="link-rss">Cửa hàng của chúng tôi</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-xs-12 col-lg-4">
              <div class="footer-column-last">
                <div class="newsletter-wrap collapsed-block">
                  <h4>Nhận tin khuyến mãi<a class="expander visible-xs" href="#TabBlock-4">+</a></h4>
                  <div class="tabBlock" id="TabBlock-4">
                    <form id="newsletter-validate-detail" method="post" action="/contactGiveEvent">
                      <div id="container_form_news">
                        <div id="container_form_news2">
                          <input id="emailGiveEvent" type="text" class="input-text required-entry validate-email" value="Đăng ký nhận tin khuyến mãi" onfocus=" this.value='' " title="Sign up for our newsletter" id="newsletter" name="email">
                          <button class="button subscribe" title="Subscribe" type="button" onclick="saveContactGiveEvent();"><span>Đăng Ký</span></button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="social">
                  <h4>Theo Dõi Chúng Tôi</h4>
                  <ul class="link">
                    <li class="fb pull-left"><a href="#"></a></li>
                    <li class="tw pull-left"><a href="#"></a></li>
                    <li class="googleplus pull-left"><a href="#"></a></li>
                    <li class="rss pull-left"><a href="#"></a></li>
                    <li class="pintrest pull-left"><a href="#"></a></li>
                    <li class="linkedin pull-left"><a href="#"></a></li>
                    <li class="youtube pull-left"><a href="#"></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-middle">
        <div class="container">
          <div class="row">
            <div style="text-align:center"><a href="/index"><img src="/user/images/footer-PerfumeRice.png" alt="footer-logo"></a></div>
            <address>
            <i class="icon-location-arrow"></i> Số 298 Đường Cầu Diễn, Minh Khai, Bắc Từ Liêm, Hà Nội <i class="icon-mobile-phone"></i><span> +(034) 613-9711</span> <i class="icon-envelope"></i><a href="daotuan1712@gmail.com">Daotuan1712@gmail.com</a>
            </address>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-sm-5 col-xs-12 coppyright">&copy; 2021 PerfumeRice. All Rights Reserved.</div>

          </div>
        </div>
      </div>
    </section>
  </footer>
</div>
<div id="mobile-menu">
  <div class="mm-search">
    <form name="search" action="/search" method="POST" >
      <div class="input-group">
        <div class="input-group-btn">
          <button class="btn-default" type="submit" onclick="clearSearch();"><i class="icon-search"></i></button>
        </div>
        <input type="text" class="form-control simple" placeholder="Tìm kiếm ..." name="srch-term" id="srch-term">
      </div>
    </form>
  </div>

  <ul>
    <li> </li>
    <li>
      <div class="home"><a href="/index"><i class="icon-home"></i>TRANG CHỦ</a> </div>
    </li>
    <li><a href="/aboutUs">GIỚI THIỆU</a></li>
    <li><a href="/category/${'all'}">SẢN PHẨM</a>
      <ul>
        <c:forEach var = "category" items = "${categories }">
          <li class="level1 first"><a href="/category/${category.id}"><span>${category.name}</span></a></li>
        </c:forEach>
      </ul>
    </li>
    <li><a href="/news">TIN TỨC</a></li>
    <li><a href="/storeAddress">CỬA HÀNG</a></li>
    <li><a href="/contact">LIÊN HỆ</a></li>
  </ul>
</div>
<script type="text/javascript">
		function saveContactGiveEvent() {
			//javaobject
			var data = {};
			data["email"] = $("#emailGiveEvent").val();
			$.ajax({
				url : "/contactGiveEvent",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(data),

				dataType : "json",
				success : function(jsonResult) {
					if (jsonResult.statusCode == 200) {
						alert(jsonResult.data);
					} else {
						alert(jsonResult.data);
					}
				},
				error : function(jqXhr, textStatus, errorMessage) { // error callback 

				}
			});
		}
	</script>
