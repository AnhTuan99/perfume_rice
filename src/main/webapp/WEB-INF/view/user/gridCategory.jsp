<%@ page import="java.time.LocalDateTime" %>
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

        <c:choose>
          <c:when test="${empty categoriesName}">
            <li class="category13"><strong>Tất Cả Sản Phẩm</strong></li>
          </c:when>
          <c:otherwise>

            <li class="category13"><strong>${categoriesName.name}</strong></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
    </div>
  </div>
</div>
  <!-- Main Container -->
  <section class="main-container col2-left-layout bounceInUp animated">
  <div class="page-header"><div class="container"><div class="row">
  <div class="col-xs-12">
    <c:choose>
      <c:when test="${empty categoriesName}">
        <h2>Tất Cả Sản Phẩm</h2>
      </c:when>
      <c:otherwise>
        <h2>${categoriesName.name}</h2>
      </c:otherwise>
    </c:choose>

  </div>
  </div>
  </div>
  </div>
    <div class="container">
      <div class="row">
        <div class="col-main col-sm-9 col-sm-push-3">
          <article class="col-main">

            <div class="category-description std">
              <div class="slider-items-products">
                <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                  <div class="slider-items slider-width-col1 owl-carousel owl-theme">

                    <!-- Item -->
                    <div class="item"> <a href="#x"><img alt="" src="/user/images/women_banner.png"></a>
                      <div class="cat-img-title cat-bg cat-box">
                        <h2 class="cat-heading"><strong>Summer Sale 2021</strong><br></h2>
                          <p>Sản phẩm giá sốc.</p>
                      </div>
                    </div>
                    <!-- End Item -->

                    <!-- Item -->
                    <div class="item"> <a href="#x"><img alt="" src="/user/images/women_banner1.png"></a>

                    </div>

                    <!-- End Item -->

                  </div>
                </div>
              </div>
            </div>
            <div class="toolbar">
              <div class="sorter">
                <div class="view-mode">
                  <span title="Grid" class="button button-active button-grid">&nbsp;</span>
                  <c:choose>
                    <c:when test="${empty categoriesName}">
                      <a href="/listCategory/${'all'}" title="List" class="button-list">&nbsp;</a>
                    </c:when>
                    <c:otherwise>
                      <a href="/listCategory/${categoriesName.id}" title="List" class="button-list">&nbsp;</a>
                    </c:otherwise>
                  </c:choose>

                </div>
              </div>
              <div id="sort-by">
                <label class="left">Sắp Xếp Theo: </label>
                <ul>
                    <c:choose>
                      <c:when test="${empty titleSort}">
                        <li style="width: 150px"><a href="#">Thứ tự<span class="right-arrow"></span></a>
                      </c:when>
                      <c:otherwise>
                        <li style="width: 150px"><a href="#">${titleSort}<span class="right-arrow"></span></a>
                      </c:otherwise>
                    </c:choose>
                    <ul >
                      <%--<li><a href="/category/${idCategories}?sortby=macdinh">Mặt định</a></li>
                      <li><a href="/category/${idCategories}?sortby=nameasc">A -> Z</a></li>
                      <li><a href="/category/${idCategories}?sortby=namedesc">Z -> A</a></li>
                      <li><a href="/category/${idCategories}?sortby=priceasc">Giá tăng dần</a></li>
                      <li><a href="/category/${idCategories}?sortby=pricedesc">Giá giảm dần</a></li>
                      <li><a href="/category/${idCategories}?sortby=createdasc">Hàng mới nhất</a></li>
                      <li><a href="/category/${idCategories}?sortby=createddesc">Hàng cũ nhất</a></li>--%>
                        <c:choose>
                          <c:when test="${empty categoriesName}">
                            <li style="width: 150px"><a href="/category/${'all'}/${'macdinh'}">Mặt định</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'nameasc'}">A -> Z</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'namedesc'}">Z -> A</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'priceasc'}">Giá tăng dần</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'pricedesc'}">Giá giảm dần</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'createdasc'}">Hàng mới nhất</a></li>
                            <li style="width: 150px"><a href="/category/${'all'}/${'createddesc'}">Hàng cũ nhất</a></li>
                          </c:when>
                          <c:otherwise>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'macdinh'}">Mặt định</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'nameasc'}">A -> Z</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'namedesc'}">Z -> A</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'priceasc'}">Giá tăng dần</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'pricedesc'}">Giá giảm dần</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'createdasc'}">Hàng mới nhất</a></li>
                            <li style="width: 150px"><a href="/category/${idCategories}/${'createddesc'}">Hàng cũ nhất</a></li>
                          </c:otherwise>
                        </c:choose>

                    </ul>
                  </li>
                </ul>
                <a class="button-asc left" href="#" title="Set Descending Direction"><span class="glyphicon glyphicon-arrow-up"></span></a> </div>
              <div class="pager">
                <div id="limiter">
                  <label>Số Sản phẩm: </label>
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
                  <label>Trang:</label>
                  <tag:paginate offset="${productSearch.offset }"
                                count="${productSearch.count }" uri="${pageUrl}" />
                </div>


              </div>
            </div>
            <div class="category-products">
              <ul class="products-grid">

                <c:forEach items="${product}" var="p">
                  <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-6">
                    <div class="item-inner">
                      <div class="item-img">
                        <div class="item-img-info"><a href="/detailProducts/${p.id}" title="${p.title}" class="product-image"><img src="/upload/${p.avatar }" alt="Sample Product"></a>
                          <c:choose>
                            <c:when test="${LocalDateTime.now().getDayOfYear()-p.createdDate.getDayOfYear()<=30 && LocalDateTime.now().getYear()==p.createdDate.getYear() }">
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
                                  <button class="button btn-cart" type="button" onclick="order.chon_san_pham_dua_vao_gio_hang(${p.id}, 1);"><span>Add to Cart</span></button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item-info">
                          <div class="info-inner">
                            <div class="item-title"><a href="/detailProducts/${p.id}" title="${p.title}">${p.title }</a> </div>
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
            <%--<div class="block block-layered-nav">
              <div class="block-title"> Browse By </div>
              <div class="block-content">
                <dl id="narrow-by-list2">
                  <dt class="last odd">Category</dt>
                  <dd class="last odd">
                    <ol>
                      <li> <a href="grid.html">Stylish Bag</a> (30) </li>
                      <li> <a href="grid.html">Material Bag</a> (30) </li>
                      <li> <a href="grid.html">Shoes</a> (32) </li>
                      <li> <a href="grid.html">Jwellery</a> (30) </li>
                      <li> <a href="grid.html">Dresses</a> (30) </li>
                      <li> <a href="grid.html">Swimwear</a> (30) </li>
                    </ol>
                  </dd>
                </dl>
              </div>
            </div>

            <div class="block block-layered-nav">
              <div class="block-title">Shop By</div>
              <div class="block-content">
                <p class="block-subtitle">Shopping Options</p>
                <dl id="narrow-by-list">
                  <dt class="odd">Price</dt>
                  <dd class="odd">
                    <ol>
                      <li> <a href="#"><span class="price">$0.00</span> - <span class="price">$99.99</span></a> (6) </li>
                      <li> <a href="#"><span class="price">$100.00</span> and above</a> (6) </li>
                    </ol>
                  </dd>
                  <dt class="even">Manufacturer</dt>
                  <dd class="even">
                    <ol>
                      <li> <a href="#">TheBrand</a> (9) </li>
                      <li> <a href="#">Company</a> (4) </li>
                      <li> <a href="#">LogoFashion</a> (1) </li>
                    </ol>
                  </dd>
                </dl>
              </div>
            </div>--%>

            <div class="block block-banner"><a href="#"><img alt="block-banner" src="/user/images/RHS-banner-img.jpg"></a></div>
           <%-- <div class="block block-cart">
              <div class="block-title ">My Cart</div>
              <div class="block-content">
                <div class="summary">
                  <p class="amount">There are <a href="#">2 items</a> in your cart.</p>
                  <p class="subtotal"> <span class="label">Cart Subtotal:</span> <span class="price">$27.99</span> </p>
                </div>
                <div class="ajax-checkout">
                  <button class="button button-checkout" title="Submit" type="submit"><span>Checkout</span></button>
                </div>
                <p class="block-subtitle">Recently added item(s) </p>
                <ul>
                  <li class="item"> <a href="product_detail.html" title="Sample Product" class="product-image"><img src="user/products-images/product1.jpg" alt="Sample Product"></a>
                    <div class="product-details">
                      <div class="access"> <a href="#" title="Remove This Item" class="btn-remove1"> <span class="icon"></span> Remove </a> </div>
                      <p class="product-name"> <a href="product_detail.html">Sample Product</a> </p>
                      <strong>1</strong> x <span class="price">$19.99</span> </div>
                  </li>
                  <li class="item last"> <a href="product_detail.html" title="Sample Product" class="product-image"><img src="user/products-images/product2.jpg" alt="Sample Product"></a>
                    <div class="product-details">
                      <div class="access"> <a href="#" title="Remove This Item" class="btn-remove1"> <span class="icon"></span> Remove </a> </div>
                      <p class="product-name"> <a href="product_detail.html">Sample Product</a> </p>
                      <strong>1</strong> x <span class="price">$8.00</span>
                      <!--access clearfix-->
                    </div>
                  </li>
                </ul>
              </div>
            </div>--%>

             <!-- Special Slider -->
              <section class="special-pro">
              <div class="slider-items-products">
                <div class="block-title">
                  <h2>Sản Phẩm Nổi Bật</h2>
                </div>
                <div id="special-slider" class="product-flexslider hidden-buttons">
                  <div class="slider-items slider-width-col4 products-grid">
                      <c:forEach items="${productBestSeller}" var="p">
                        <!-- Item -->
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="item-img-info"> <a class="product-image" title="${p.title}" href="/detailProducts/${p.id}"> <img alt="Sample Product" src="/upload/${p.avatar }"></a>
                                <c:choose>
                                  <c:when test="${LocalDateTime.now().getDayOfYear()-p.createdDate.getDayOfYear()<=30 && LocalDateTime.now().getYear()==p.createdDate.getYear()}">
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
                                        <button class="button btn-cart" type="button"  onclick="order.chon_san_pham_dua_vao_gio_hang(${p.id}, 1);"><span>Add to Cart</span></button>
                                      </div>
                                      <%--<div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                                        <span class="add-to-links">
                                          <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist">
                                            <span>Add to Wishlist</span>
                                          </a>
                                          <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a>
                                        </span> --%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a title="${p.title}" href="/detailProducts/${p.id}">${p.title } </a> </div>
                                <div class="item-content">
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div style="width:30%" class="rating"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                  <div class="item-price">
                                    <div class="price-box">

                                      <c:choose>
                                        <c:when test="${p.saleoff>0}">
                                          <p class="old-price"> <span class="price-label">Regular Price:</span>
                                            <span id="old-price-2" class="price">
                                              <fmt:setLocale value="vi_VN" scope="session" />
                                              <fmt:formatNumber value="${p.price }" type="currency" />
                                            </span>
                                          </p>
                                          <p class="special-price"> <span class="price-label">Special Price</span>
                                            <span id="product-price-2" class="price">
                                              <fmt:setLocale value="vi_VN" scope="session" />
                                              <fmt:formatNumber value="${p.price_sale }" type="currency" />
                                            </span>
                                          </p>
                                        </c:when>
                                        <c:otherwise>
                                          <p class="old-price"> <span class="price-label">Regular Price:</span>
                                            <span id="old-price" class="price">
                                              <fmt:setLocale value="vi_VN" scope="session" />
                                              <fmt:formatNumber value="${p.price }" type="currency" />
                                            </span>
                                          </p>
                                        </c:otherwise>
                                      </c:choose>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!-- End Item -->
                      </c:forEach>
                    <%--<c:forEach items="${productBestSeller}" var="p">
                      <li class="item item-animate wide-first col-xl-3 col-lg-4 col-sm-6 ">
                        <div class="item-inner">
                          <div class="item-img">
                            <div class="item-img-info"><a href="/detailProducts/${p.id}" title="Sample Product" class="product-image"><img  src="/upload/${p.avatar }" alt="Sample Product"></a>
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
                                      <button class="button btn-cart" type="button" onclick="order.chon_san_pham_dua_vao_gio_hang(${p.id}, 1);"><span>Add to Cart</span></button>
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
                    </c:forEach>--%>

                    </div>
                </div>
              </div>
              </section>
  <!-- End Featured Slider -->




           <%-- <div class="block block-tags">
              <div class="block-title"> Popular Tags</div>
              <div class="block-content">
                <ul class="tags-list">
                  <li><a href="#" style="font-size:98.3333333333%;">Camera</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">Hohoho</a></li>
                  <li><a href="#" style="font-size:145%;">SEXY</a></li>
                  <li><a href="#" style="font-size:75%;">Tag</a></li>
                  <li><a href="#" style="font-size:110%;">Test</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">bones</a></li>
                  <li><a href="#" style="font-size:110%;">cool</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">cool t-shirt</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">crap</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">good</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">green</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">hip</a></li>
                  <li><a href="#" style="font-size:75%;">laptop</a></li>
                  <li><a href="#" style="font-size:75%;">mobile</a></li>
                  <li><a href="#" style="font-size:75%;">nice</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">phone</a></li>
                  <li><a href="#" style="font-size:98.3333333333%;">red</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">tight</a></li>
                  <li><a href="#" style="font-size:75%;">trendy</a></li>
                  <li><a href="#" style="font-size:86.6666666667%;">young</a></li>
                </ul>
                <div class="actions"> <a href="#" class="view-all">View All Tags</a> </div>
              </div>
            </div>--%>
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
<script type="text/javascript">
  function SaveContact() {

    //javaobject
    $.ajax({
      url : "/contact",
      type : "post",
      contentType : "application/json",
      data : jQuery.param({ field1: "hello", field2 : "hello2"}) ,

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
