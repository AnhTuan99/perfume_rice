<%@ page import="java.time.LocalDateTime" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<!-- Tieu Long Lanh Kute -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->
<link rel="icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<title>Trang Chủ</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<jsp:include page="/WEB-INF/view/user/layout/css.jsp"></jsp:include>

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,500,300,700,900'
	rel='stylesheet' type='text/css'>
</head>

<body class="cms-index-index cms-home-page">
	<div id="page">
		<!-- Header -->
		<jsp:include page="/WEB-INF/view/user/layout/header.jsp"></jsp:include>
		<!-- end header -->
		<div class="mm-toggle-wrap">
			<div class="mm-toggle">
				<i class="icon-align-justify"></i><span class="mm-label">Menu</span>
			</div>
		</div>
		<!-- Navbar -->
		<jsp:include page="/WEB-INF/view/user/layout/menu.jsp"></jsp:include>
		<!-- end nav -->
		<!-- Slider -->
		<div id="magik-slideshow" class="magik-slideshow">
			<div id='rev_slider_4_wrapper'
				class='rev_slider_wrapper fullwidthbanner-container'>
				<div id='rev_slider_4' class='rev_slider fullwidthabanner'>
					<ul>
						<li data-transition='random' data-slotamount='7'
							data-masterspeed='1000' data-thumb='/user/images/slide-img1.jpg'><img
							src='/user/images/slide-img1.jpg' alt="slide-img"
							data-bgposition='left top' data-bgfit='cover'
							data-bgrepeat='no-repeat' />
							<div class="info">
								<div class='tp-caption ExtraLargeTitle sft  tp-resizeme '
									data-x='860' data-y='60' data-endspeed='500' data-speed='500'
									data-start='1100' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;'>New
									Season</div>
								<div class='tp-caption line' data-x='860' data-y='120'
									data-endspeed='500' data-speed='500' data-start='1300'
									data-easing='Linear.easeNone' data-splitin='none'
									data-splitout='none' data-elementdelay='0.1'
									data-endelementdelay='0.1'
									style='z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;'>&nbsp;</div>
								<div class='tp-caption LargeTitle sfl  tp-resizeme '
									data-x='860' data-y='140' data-endspeed='500' data-speed='500'
									data-start='1300' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;'>Summer
									Sale</div>
								<div class='tp-caption sfb  tp-resizeme ' data-x='860'
									data-y='330' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;'>
									<a href='#' class="view-more">Xem Thêm</a> <a href='#'
										class="buy-btn">Mua Ngay</a>
								</div>
								<div class='tp-caption Title sft  tp-resizeme ' data-x='860'
									data-y='220' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Power2.easeInOut'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;'>
									Mùa hè - mùa đong đầy cho chúng ta những kỷ niệm về những cuộc vui chơi thỏa thích.<br>Để chào đón một mùa hè tràn đầy năng lượng.
								</div>
								<div class='tp-caption Title sft  tp-resizeme small-size '
									data-x='860' data-y='370' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Power2.easeInOut'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;'></div>
							</div></li>
						<li data-transition='random' data-slotamount='7'
							data-masterspeed='1000' data-thumb='/user/images/slide-img2.jpg'><img
							src='/user/images/slide-img2.jpg' alt="slide"
							data-bgposition='left top' data-bgfit='cover'
							data-bgrepeat='no-repeat' />
							<div class="info">
								<div class='tp-caption ExtraLargeTitle sft tp-resizeme '
									data-x='395' data-y='60' data-endspeed='500' data-speed='500'
									data-start='1100' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;'>NEW
									ARRIVALS</div>
								<div class='tp-caption line' data-x='395' data-y='120'
									data-endspeed='500' data-speed='500' data-start='1300'
									data-easing='Linear.easeNone' data-splitin='none'
									data-splitout='none' data-elementdelay='0.1'
									data-endelementdelay='0.1'
									style='z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;'>&nbsp;</div>
								<div class='tp-caption LargeTitle sfl  tp-resizeme '
									data-x='395' data-y='140' data-endspeed='500' data-speed='500'
									data-start='1300' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;'>Pebble Lisa</div>
								<div class='tp-caption Title1 sft tp-resizeme' data-x='395'
									data-y='220' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Power2.easeInOut'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;'>
									Mỹ phẩm chính hãng – chất lượng tốt – giá tốt nhất thị trường.<br> Đa dạng các loại mỹ phẩm đến từ các hãng nổi tiếng trên toàn thế giới.
								</div>
								<div class='tp-caption sfb  tp-resizeme ' data-x='395'
									data-y='330' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Linear.easeNone'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;'>
									<a href='#' class="view-more">Xem Thêm</a> <a href='#'
										class="buy-btn">Mua Ngay</a>
								</div>
								<div class='tp-caption Title sft  tp-resizeme ' data-x='395'
									data-y='370' data-endspeed='500' data-speed='500'
									data-start='1500' data-easing='Power2.easeInOut'
									data-splitin='none' data-splitout='none'
									data-elementdelay='0.1' data-endelementdelay='0.1'
									style='z-index: 4; max-width: auto; max-height: auto; white-space: nowrap; font-size: 11px'></div>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- end banner -->
		<div class="top-banner-section wow bounceInUp animated">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col add-banner1" style="background-image: url(user/images/offerBanner1.png) no-repeat top left !important;">
							<div class="top-b-text">
								<strong>Designer Shoes</strong> For Women
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col free-shipping">
							<strong>Miễn Phí Vận Chuyển</strong> Đơn đặt hàng trên 500.000 đ
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col add-banner2" style=" background-image: url(user/images/offerBanner3.png) no-repeat top left !important;">
							<div class="top-b-text">
								<strong>Luxury Handbags</strong>2015 New Arrive
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col last offer">
							<strong>New Arrivals</strong> Perfume Rice.
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- main container -->
		<div class="main-col">
			<div class="container">
				<div class="row">
					<div class="product-grid-view">
						<div class="col-md-12">
							<div class="std">
								<div class="home-tabs wow bounceInUp animated">
									<div class="producttabs">
										<div id="magik_producttabs1" class="magik-producttabs">
											<!--<h3></h3>-->
											<div class="magik-pdt-container">
												<!--Begin Tab Nav -->
												<div class="magik-pdt-nav">
													<ul class="pdt-nav">
														<li class="item-nav tab-loaded tab-nav-actived"
															data-type="order" data-catid="" data-orderby="best_sales"
															data-href="pdt_best_sales"><span class="title-navi">Sản Phẩm Bán Chạy</span></li>
														<li class="item-nav" data-type="order" data-catid=""
															data-orderby="new_arrivals" data-href="pdt_new_arrivals"><span
															class="title-navi">Sản Phẩm Mới</span></li>
													</ul>
												</div>
												<!-- End Tab Nav -->
												<!--Begin Tab Content -->
												<div class="container">
													<div class="row  ">
														<div class="magik-pdt-content wide-5">
															<div class="pdt-content is-loaded pdt_best_sales tab-content-actived">
																<ul class="pdt-list products-grid-home zoomOut play">

																	<c:forEach items="${productBestSeller}" var="p">
																		<li class="item item-animate wide-first col-xl-3 col-lg-4 col-sm-6"  >
																			<div class="item-inner">
																				<div class="item-img">
																					<div class="item-img-info"><a  href="/detailProducts/${p.id}" title="${p.title}" class="product-image"><img src="/upload/${p.avatar }" alt="Sample Product"></a>
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

															<div class="pdt-content pdt_new_arrivals is-loaded">
																<ul class="pdt-list products-grid-home zoomOut play">

																	<c:forEach items="${productNewArrival}" var="p">
																		<li class="item item-animate wide-first col-xl-3 col-lg-4 col-sm-6">
																			<div class="item-inner">
																				<div class="item-img">
																					<div class="item-img-info"><a href="/detailProducts/${p.id}" title="${p.title}" class="product-image"><img src="/upload/${p.avatar }" alt="Sample Product"></a>
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
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end main container -->
		<!-- Categories Slider -->
		<section class="featured-pro container wow bounceInUp animated">
			<div class="slider-items-products">
				<div class="new_title center">
					<h2>Sản Phẩm Khuyến Mãi</h2>
				</div>
				<div  id="featured-slider" class="product-flexslider hidden-buttons">
					<div class="slider-items slider-width-col4 products-grid">

						<c:forEach var = "p" items = "${productWithDiscount}">
						<!-- Item -->

							<div class="item">
								<div class="item-inner">
									<div class="item-img">
										<div class="item-img-info"><a href="" title="${p.title}" class="product-image"><img src="/upload/${p.avatar }" alt="Sample Product"></a>
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
								</div>
							</div>
						</c:forEach>
					<!-- End Item -->


				</div>
			</div>
		</div>
		</section>

		<!-- End Categories Slider -->
		<!--Offer Start-->
		<div class="offer-slider wow animated parallax parallax-2">
			<div class="container">
				<ul class="bxslider">
					<li>
						<h2>NEW ARRIVALS</h2>
						<h1>Sale up to ${highestDiscount.saleoff}% off</h1>
						<p>ĐẸP CHUẨN HÀN - SALE NGẬP TRÀN.</p> <a class="shop-now" href="#">Mua ngay</a>
					</li>
					<li>
						<h2>Hello hotness!</h2>
						<h1>Summer cosmetics</h1>
						<p>Mỹ phẩm cho nhày hè nóng bức.</p> <a class="shop-now" href="#">
						Xem thêm</a>
					</li>
					<li>
						<h2>New launch</h2>
						<h1>New cosmetics</h1>
						<p>Làm đẹp vẫn luôn là nhu cầu thiết yếu của phái đẹp.</p> <a class="shop-now" href="#">Xem thêm</a>
					</li>
				</ul>
			</div>
		</div>
		<!--Offer silder End-->

	<!-- Latest Blog -->
	<section class="latest-blog wow bounceInUp animated">
		<div class="container">
			<div class="row">
				<div class="new_title center">
					<h2>Tin Tức Mới Nhất</h2>
				</div>
				<c:forEach items="${news}" var="n">
					<div class="col-xs-12 col-sm-6 col-lg-3">
						<div class="blog_inner">
							<div class="blog-img"> <img class="img-responsive" src="/upload/${n.avatar }" alt="Blog image">
								<div class="mask" > <a style="margin: auto" class="info" href="/newsDetails/${n.id}">Đọc Tiếp</a> </div>
							</div>
							<h3><a href="/newsDetails/${n.id}">${n.title }</a> </h3>
							<div class="post-date"><i class="icon-calendar"></i> ${n.createdDate }</div>
							<p style=" width: 270px; overflow: hidden;text-overflow: ellipsis;line-height: 20px;-webkit-line-clamp: 5;display: -webkit-box;-webkit-box-orient: vertical;">${n.short_news }</p>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>
	<!-- End Latest Blog -->

	<!-- offer banner section -->

		<div class="offer-banner-section wow bounceInUp animated">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col">
							<img src="/user/images/banner-img1.jpg" alt="offer banner1">
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col">
							<img src="/user/images/banner-img2.jpg" alt="offer banner2">
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col">
							<img src="/user/images/banner-img3.jpg" alt="offer banner3">
						</div>
					</div>
					<div class="col-lg-3 col-sm-3 col-xs-6">
						<div class="col last">
							<img src="/user/images/banner-img4.jpg" alt="offer banner4">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<jsp:include page="/WEB-INF/view/user/layout/footer.jsp"></jsp:include>
		<!-- End Footer -->
		<!-- JavaScript -->
		<jsp:include page="/WEB-INF/view/user/layout/js.jsp"></jsp:include>
		<script type='text/javascript'>
			jQuery(document).ready(function() {
				jQuery('#rev_slider_4').show().revolution({
					dottedOverlay : 'none',
					delay : 5000,
					startwidth : 1920,
					startheight : 650,

					hideThumbs : 200,
					thumbWidth : 200,
					thumbHeight : 50,
					thumbAmount : 2,

					navigationType : 'thumb',
					navigationArrows : 'solo',
					navigationStyle : 'round',

					touchenabled : 'on',
					onHoverStop : 'on',

					swipe_velocity : 0.7,
					swipe_min_touches : 1,
					swipe_max_touches : 1,
					drag_block_vertical : false,

					spinner : 'spinner0',
					keyboardNavigation : 'off',

					navigationHAlign : 'center',
					navigationVAlign : 'bottom',
					navigationHOffset : 0,
					navigationVOffset : 20,

					soloArrowLeftHalign : 'left',
					soloArrowLeftValign : 'center',
					soloArrowLeftHOffset : 20,
					soloArrowLeftVOffset : 0,

					soloArrowRightHalign : 'right',
					soloArrowRightValign : 'center',
					soloArrowRightHOffset : 20,
					soloArrowRightVOffset : 0,

					shadow : 0,
					fullWidth : 'on',
					fullScreen : 'off',

					stopLoop : 'off',
					stopAfterLoops : -1,
					stopAtSlide : -1,

					shuffle : 'off',

					autoHeight : 'off',
					forceFullWidth : 'on',
					fullScreenAlignForce : 'off',
					minFullScreenHeight : 0,
					hideNavDelayOnMobile : 1500,

					hideThumbsOnMobile : 'off',
					hideBulletsOnMobile : 'off',
					hideArrowsOnMobile : 'off',
					hideThumbsUnderResolution : 0,

					hideSliderAtLimit : 0,
					hideCaptionAtLimit : 0,
					hideAllCaptionAtLilmit : 0,
					startWithSlide : 0,
					fullScreenOffsetContainer : ''
				});
			});
		</script>
</body>

<!-- Tieu Long Lanh Kute -->
</html>
<script>
	function daysdifference(firstDate, secondDate) {
		var startDay = new Date(firstDate);
		var endDay = new Date(secondDate);

		var millisBetween = startDay.getTime() - endDay.getTime();
		var days = millisBetween / (1000 * 3600 * 24);
		alert(days);
		console.log("days");
	}
</script>