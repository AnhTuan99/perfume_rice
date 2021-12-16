<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Paging -->
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/pagingTagLibs.tld"%>

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
<title>Danh Mục</title>

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

<!-- Breadcrumbs -->
<div class="breadcrumbs">
  <div class="container">
    <div class="row">
     <div class="col-xs-12">
      <ul>
        <li class="home"> <a title="Go to Home Page" href="/index">Trang Chủ</a><span> - </span></li>
        <li class="category13"><strong>Tìm kiếm</strong></li>
      </ul>
    </div>
    </div>
  </div>
</div>
  <!-- Main Container -->
  <section class="main-container col2-left-layout bounceInUp animated">
  <div class="page-header"><div class="container"><div class="row">
  <div class="col-xs-12">
    <h2>Có ${products.size()} kết quả tìm kiếm với từ khoá "${key}"</h2>

  </div>
  </div>
  </div>
  </div>
    <div class="container">
      <div class="row">
        <div class="col-main col-sm-9 col-sm-push-3">
          <article class="col-main">


            <div class="toolbar">
              <div class="sorter">
                <div class="view-mode">
                  <span title="Grid" class="button button-active button-grid">&nbsp;</span>
                  <c:choose>
                    <c:when test="${empty categoriesName}">
                      <a href="/listCategory/${'tatcasanpham'}" title="List" class="button-list">&nbsp;</a>
                    </c:when>
                    <c:otherwise>
                      <a href="/listCategory/${categoriesName.id}" title="List" class="button-list">&nbsp;</a>
                    </c:otherwise>
                  </c:choose>

                </div>
              </div>

              <div id="sort-by">
                <label class="left">Sort By: </label>
                <ul>
                  <li><a href="#">Position<span class="right-arrow"></span></a>
                    <ul>
                      <li><a href="#">Name</a></li>
                      <li><a href="#">Price</a></li>
                      <li><a href="#">Position</a></li>
                    </ul>
                  </li>
                </ul>
                <a class="button-asc left" href="#" title="Set Descending Direction"><span class="glyphicon glyphicon-arrow-up"></span></a> </div>
              <div class="pager">
                <div id="limiter">
                  <label>View: </label>
                  <ul>
                    <li><a href="#">15<span class="right-arrow"></span></a>
                      <ul>
                        <li><a href="#">20</a></li>
                        <li><a href="#">30</a></li>
                        <li><a href="#">35</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>

                <div class="pages">
                  <label>Page:</label>
                  <tag:paginate offset="${productSearch.offset }"
                                count="${productSearch.count }" uri="${pageUrl}" />
                </div>


              </div>
            </div>
            <div class="category-products">
              <ul class="products-grid">

                <c:forEach items="${products}" var="p">
                  <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-6">
                    <div class="item-inner">
                      <div class="item-img">
                        <div class="item-img-info"><a href="/detailProducts/${p.id}" title="Sample Product" class="product-image"><img src="/upload/${p.avatar }" alt="Sample Product"></a>
                          <c:choose>
                            <c:when test="${LocalDateTime.now().getMonthValue()-p.createdDate.getMonthValue() <= 2}">
                              <div class="new-label new-top-left">New</div>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                          </c:choose>
                          <c:choose>
                            <c:when test="${p.saleoff>0}">
                              <div class="sale-label sale-top-left">sale</div>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                          </c:choose>

                          <div class="item-box-hover">
                            <div class="box-inner">
                              <div class="actions">
                                <div class="add_cart">
                                  <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item-info">
                          <div class="info-inner">
                            <div class="item-title"><a href="/detailProducts/${p.id}" title="Sample Product">${p.title }</a> </div>
                            <div class="item-content">
                              <div class="rating">
                                <div class="ratings">
                                  <div class="rating-box">
                                    <div class="rating" style="width:80%"></div>
                                  </div>
                                  <p class="rating-links"><a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                </div>
                              </div>
                              <div class="item-price">
                                <c:choose>
                                  <c:when test="${p.saleoff>0}">
                                    <p class="old-price">
                                      <span class="price-label">Regular Price:</span>
                                      <span class="price">
                                        <fmt:setLocale value="vi_VN" scope="session" />
                                        <fmt:formatNumber value="${p.price }" type="currency" />
                                      </span>
                                    </p>
                                    <p class="special-price">
                                      <span class="price-label">Special Price</span>
                                      <span class="price">
                                        <fmt:setLocale value="vi_VN" scope="session" />
                                        <fmt:formatNumber value="${p.price_sale }" type="currency" />
                                      </span>
                                    </p>
                                  </c:when>
                                  <c:otherwise>
                                    <div class="price-box">
                                      <span class="regular-price">
                                        <span class="price">
                                          <fmt:setLocale value="vi_VN" scope="session" />
                                          <fmt:formatNumber value="${p.price }" type="currency" />
                                        </span>
                                      </span>
                                    </div>
                                  </c:otherwise>
                                </c:choose>

                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                  </li>
                </c:forEach>

              </ul>
            </div>
          </article>
          <!--	///*///======    End article  ========= //*/// -->
        </div>

        <div class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9">
          <aside class="col-left sidebar">
          <div class="side-nav-categories">
              <div class="block-title"> Danh Mục Sản Phẩm </div>
              <!--block-title-->
              <!-- BEGIN BOX-CATEGORY -->
              <div class="box-content box-category">
                <ul>
                  <c:choose>
                    <c:when test="${empty categoriesName}">
                      <c:forEach var = "category" items = "${categories }">
                        <li> <a href="/category/${category.id}">${category.name}</a> </li>

                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <c:forEach var = "category" items = "${categories }">
                        <c:choose>
                          <c:when test="${category.id == categoriesName.id }">
                            <li> <a class="active" href="/category/${category.id}">${category.name}</a> </li>
                          </c:when>
                          <c:otherwise>
                            <li> <a href="/category/${category.id}">${category.name}</a> </li>
                          </c:otherwise>
                        </c:choose>

                      </c:forEach>
                    </c:otherwise>
                  </c:choose>

                  <!--level 0-->

                </ul>
              </div>
              <!--box-content box-category-->
            </div>

          </aside>
        </div>
      </div>
    </div>
  </section>
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
