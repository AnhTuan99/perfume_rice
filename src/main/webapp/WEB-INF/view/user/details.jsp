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
<title>Chi Tiết</title>

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
  <div class="breadcrumbs bounceInUp animated">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <ul>
            <li class="home"> <a title="Go to Home Page" href="/index">Trang Chủ</a><span> - </span></li>
            <li class=""> <a title="Go to Home Page" href="/category/${product.categories.id}">${categoriesName.name}</a><span> - </span></li>
            <li class="category13"><strong>${product.title}</strong></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Breadcrumbs End -->
  <!-- main container -->
<div class="main-container col1-layout">
    <div class="main container">
    <div class="col-main">
      <div class="row">
        <div class="product-view">
          <div class="product-essential">
            <form action="#" method="post" id="product_addtocart_form">
              <input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
              <div class="product-img-box col-sm-5 col-xs-12 bounceInRight animated">
                <div class="new-label new-top-left"> New </div>
                <div class="product-image">
                  <div class="large-image"> <a href="/upload/${productsImages.get(0).path }" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20"> <img alt="Thumbnail" src="/upload/${productsImages.get(0).path }"> </a> </div>
                  <div class="flexslider flexslider-thumb">
                    <ul class="previews-list slides">
                      <c:forEach items="${productsImages}" var="p">
                        <li><a href='/upload/${p.path }' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: '/upload/${p.path }' "><img src="/upload/${p.path }" alt = "Thumbnail 1"/></a></li>
                      </c:forEach>
                    </ul>
                  </div>
                </div>
                <!-- end: more-images -->
              </div>
              <div class="product-shop col-sm-7 col-xs-12 bounceInUp animated">
              <%--<div class="product-next-prev"> <a class="product-next" href="#"><span></span></a> <a class="product-prev" href="#"><span></span></a> </div>--%>
                <div class="product-name">
                  <h1>${product.title}</h1>
                  <p>
                    <span class="first_status" style="color: rgb(54, 54, 54); font-weight: 700; font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;">Hãng:&nbsp;
                      <span class="status_name" style="font-weight: 400; padding-right: 10px;">${brandsName.name}&nbsp;</span>
                    </span>
                    <span style="color: rgb(54, 54, 54); font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;"></span>
                    <span class="first_status" style="color: rgb(54, 54, 54); font-weight: 700; font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;">Loại:&nbsp;<span class="status_name" style="font-weight: 400; padding-right: 10px;">${categoriesName.name}</span>
                    </span>
                    <br><gwmw style="display:none;"></gwmw></p>
                </div>
                <div class="short-description">
                  <!--<h2>Quick Overview</h2>-->
                  ${product.short_description}
                </div>

                <div class="ratings">
                  <div class="rating-box">
                    <div style="width:60%" class="rating"></div>
                  </div>
                  <p class="rating-links"> <a href="#">1 Đánh Giá</a> <span class="separator">|</span> <a href="#">Thêm Đánh Giá Của Bạn</a> </p>
                </div>
                <p class="availability in-stock pull-right"><span>Trong Kho</span></p>
                <div class="price-block">
                  <div class="price-box">
                    <c:choose>
                      <c:when test="${product.saleoff>0}">
                        <p class="old-price">
                          <span class="price-label">Regular Price:</span>
                          <span class="price">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price }" type="currency" />
                          </span>
                        </p>
                        <p class="special-price">
                          <span class="price-label">Special Price</span>
                          <span id="product-price-48" class="price">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price_sale }" type="currency" />
                          </span>
                        </p>

                      </c:when>
                      <c:otherwise>
                        <p class="special-price">
                          <span class="price-label">Special Price</span>
                          <span id="product-price" class="price">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${product.price_sale }" type="currency" />
                          </span>
                        </p>
                      </c:otherwise>
                    </c:choose>

                  </div>
                </div>
                <div class="add-to-box">
                  <div class="add-to-cart">
                    <label for="qty">Số Lượng:</label>
                    <div class="pull-left">
                      <div class="custom pull-left">
                        <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="icon-plus">&nbsp;</i></button>
                        <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty" min="1" max="${product.amount }">

                        <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="icon-minus">&nbsp;</i></button>
                      </div>
                    </div>

                      <button onclick="order.chon_san_pham_dua_vao_gio_hang(${product.id}, parseInt($('#qty').val()));" class="button btn-cart" title="Add to Cart" type="button"><span><i class="icon-basket"></i> Thêm vào giỏ</span></button>

                  </div>
                  <div class="email-addto-box">

                    <%--<ul class="add-to-links">
                      <li> <a class="link-wishlist" href="wishlist.html"><span>Add to Wishlist</span></a></li>
                      <li><span class="separator">|</span> <a class="link-compare" href="compare.html"><span>Add to Compare</span></a></li>
                    </ul> <p class="email-friend"><a href="#" class=""><span>Email to a Friend</span></a></p>--%>
                  </div>
                </div>
              </div>

            </form>
          </div>
          <div class="product-collateral col-sm-12 col-xs-12 bounceInUp animated">
            <div class="add_info">
              <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                <li class="active"> <a href="#product_tabs_description" data-toggle="tab"> Mô Tả Sản Phẩm </a> </li>
                <%--<li><a href="#product_tabs_tags" data-toggle="tab">Tags</a></li>--%>
                <li> <a href="#reviews_tabs" data-toggle="tab">Đánh Giá</a> </li>
              </ul>
              <div id="productTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="product_tabs_description">
                  <div class="std">
                    ${product.detail_description}
                  </div>
                </div>
               <%-- <div class="tab-pane fade" id="product_tabs_tags">
                  <div class="box-collateral box-tags">
                    <div class="tags">
                      <form id="addTagForm" action="#" method="get">
                        <div class="form-add-tags">
                          <label for="productTagName">Add Tags:</label>
                          <div class="input-box">
                            <input class="input-text" name="productTagName" id="productTagName" type="text">
                            <button type="button" title="Add Tags" class=" button btn-add" onClick="submitTagForm()"> <span>Add Tags</span> </button>
                          </div>
                          <!--input-box-->
                        </div>
                      </form>
                    </div>
                    <!--tags-->
                    <p class="note">Use spaces to separate tags. Use single quotes (') for phrases.</p>
                  </div>
                </div>--%>
                <div class="tab-pane fade" id="reviews_tabs">
                  <div class="box-collateral box-reviews" id="customer-reviews">
                    <div class="box-reviews1">
                      <div class="form-add">
                        <form id="review-form" method="post" action="http://www.magikcommerce.com/review/product/post/id/176/">
                          <h3>Write Your Own Review</h3>
                          <fieldset>
                            <h4>How do you rate this product? <em class="required">*</em></h4>
                            <span id="input-message-box"></span>
                            <table id="product-review-table" class="data-table">

                              <thead>
                                <tr class="first last">
                                  <th>&nbsp;</th>
                                  <th><span class="nobr">1 *</span></th>
                                  <th><span class="nobr">2 *</span></th>
                                  <th><span class="nobr">3 *</span></th>
                                  <th><span class="nobr">4 *</span></th>
                                  <th><span class="nobr">5 *</span></th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="first odd">
                                  <th>Price</th>
                                  <td class="value"><input type="radio" class="radio" value="11" id="Price_1" name="ratings[3]"></td>
                                  <td class="value"><input type="radio" class="radio" value="12" id="Price_2" name="ratings[3]"></td>
                                  <td class="value"><input type="radio" class="radio" value="13" id="Price_3" name="ratings[3]"></td>
                                  <td class="value"><input type="radio" class="radio" value="14" id="Price_4" name="ratings[3]"></td>
                                  <td class="value last"><input type="radio" class="radio" value="15" id="Price_5" name="ratings[3]"></td>
                                </tr>
                                <tr class="even">
                                  <th>Value</th>
                                  <td class="value"><input type="radio" class="radio" value="6" id="Value_1" name="ratings[2]"></td>
                                  <td class="value"><input type="radio" class="radio" value="7" id="Value_2" name="ratings[2]"></td>
                                  <td class="value"><input type="radio" class="radio" value="8" id="Value_3" name="ratings[2]"></td>
                                  <td class="value"><input type="radio" class="radio" value="9" id="Value_4" name="ratings[2]"></td>
                                  <td class="value last"><input type="radio" class="radio" value="10" id="Value_5" name="ratings[2]"></td>
                                </tr>
                                <tr class="last odd">
                                  <th>Quality</th>
                                  <td class="value"><input type="radio" class="radio" value="1" id="Quality_1" name="ratings[1]"></td>
                                  <td class="value"><input type="radio" class="radio" value="2" id="Quality_2" name="ratings[1]"></td>
                                  <td class="value"><input type="radio" class="radio" value="3" id="Quality_3" name="ratings[1]"></td>
                                  <td class="value"><input type="radio" class="radio" value="4" id="Quality_4" name="ratings[1]"></td>
                                  <td class="value last"><input type="radio" class="radio" value="5" id="Quality_5" name="ratings[1]"></td>
                                </tr>
                              </tbody>
                            </table>
                            <input type="hidden" value="" class="validate-rating" name="validate_rating">
                            <div class="review1">
                              <ul class="form-list">
                                <li>
                                  <label class="required" for="nickname_field">Nickname<em>*</em></label>
                                  <div class="input-box">
                                    <input type="text" class="input-text" id="nickname_field" name="nickname">
                                  </div>
                                </li>
                                <li>
                                  <label class="required" for="summary_field">Summary<em>*</em></label>
                                  <div class="input-box">
                                    <input type="text" class="input-text" id="summary_field" name="title">
                                  </div>
                                </li>
                              </ul>
                            </div>
                            <div class="review2">
                              <ul>
                                <li>
                                  <label class="required label-wide" for="review_field">Review<em>*</em></label>
                                  <div class="input-box">
                                    <textarea rows="3" cols="5" id="review_field" name="detail"></textarea>
                                  </div>
                                </li>
                              </ul>
                              <div class="buttons-set">
                                <button class="button submit" title="Submit Review" type="submit"><span>Submit Review</span></button>
                              </div>
                            </div>
                          </fieldset>
                        </form>
                      </div>
                    </div>
                    <div class="box-reviews2">
                      <h3>Customer Reviews</h3>
                      <div class="box visible">
                        <ul>
                          <li>
                            <table class="ratings-table">

                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#">Excellent</a></h6>
                              <small>Review by <span>Leslie Prichard </span>on 1/3/2014 </small>
                              <div class="review-txt"> I have purchased shirts from Minimalism a few times and am never disappointed. The quality is excellent and the shipping is amazing. It seems like it's at your front door the minute you get off your pc. I have received my purchases within two days - amazing.</div>
                            </div>
                          </li>
                          <li class="even">
                            <table class="ratings-table">

                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:80%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#/catalog/product/view/id/60/">Amazing</a></h6>
                              <small>Review by <span>Sandra Parker</span>on 1/3/2014 </small>
                              <div class="review-txt"> Minimalism is the online ! </div>
                            </div>
                          </li>
                          <li>
                            <table class="ratings-table">

                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:80%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#/catalog/product/view/id/59/">Nicely</a></h6>
                              <small>Review by <span>Anthony  Lewis</span>on 1/3/2014 </small>
                              <div class="review-txt"> Unbeatable service and selection. This store has the best business model I have seen on the net. They are true to their word, and go the extra mile for their customers. I felt like a purchasing partner more than a customer. You have a lifetime client in me. </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="actions"> <a class="button view-all" id="revies-button" href="#"><span><span>View all</span></span></a> </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
         <%-- <div class="related-slider col-lg-12 col-xs-12 bounceInDown animated">
            <div class="slider-items-products">
              <div class="slider-items-products">
              <div class="new_title center">
        <h2>Related Products</h2>
      </div>

                  <div id="related-products-slider" class="product-flexslider hidden-buttons">
                    <div class="slider-items slider-width-col4 products-grid">
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product10.jpg"> </a>
                    <div class="sale-label sale-top-left">sale</div>
                    <div class="item-box-hover">
                      <div class="box-inner">
                                        <div class="actions">
                                        <div class="add_cart">
                                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                        </div>
                                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div> <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
 <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                    <div class="item-content">
                      <div class="rating">
                        <div class="ratings">
                          <div class="rating-box">
                            <div style="width:80%" class="rating"></div>
                          </div>
                          <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                        </div>
                      </div>
                      <div class="item-price">
                        <div class="price-box"> <span  class="regular-price"> <span class="price">$125.00</span> </span> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Item -->
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product11.jpg"></a>
                    <div class="item-box-hover">
                      <div class="box-inner">
                                        <div class="actions">
                                        <div class="add_cart">
                                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                        </div>
                                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div> <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
 <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html">Sample Product</a> </div>
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
                          <p class="old-price"> <span class="price-label">Regular Price:</span> <span id="old-price-2" class="price"> $567.00 </span> </p>
                          <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-2" class="price"> $456.00 </span> </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Item -->

            <!-- Item -->
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product12.jpg"></a>
                    <div class="item-box-hover">
                      <div class="box-inner">
                                        <div class="actions">
                                        <div class="add_cart">
                                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                        </div>
                                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div> <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
 <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html">Sample Product</a> </div>
                    <div class="item-content">
                      <div class="rating">
                        <div class="ratings">
                          <div class="rating-box">
                            <div style="width:100%" class="rating"></div>
                          </div>
                          <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                        </div>
                      </div>
                      <div class="item-price">
                        <div class="price-box">
                          <p class="old-price"> <span class="price-label">Regular Price:</span> <span id="old-price-27" class="price"> $100.00 </span> </p>
                          <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-27" class="price"> $90.00 </span> </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Item -->

            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product13.jpg"> </a>
                    <div class="new-label new-top-left">new</div>
                    <div class="item-box-hover">
                      <div class="box-inner">
                        <div class="actions">
                          <div class="add_cart">
                            <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                          </div>
                          <div class="product-detail-bnt">
                            <a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a>
                          </div>
                          <span class="add-to-links">
                            <a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
                            <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                    <div class="item-content">
                      <div class="rating">
                        <div class="ratings">
                          <div class="rating-box">
                            <div style="width:80%" class="rating"></div>
                          </div>
                          <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                        </div>
                      </div>
                      <div class="item-price">
                        <div class="price-box"> <span  class="regular-price"> <span class="price">$125.00</span> </span> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Item -->
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product14.jpg"></a>
                    <div class="item-box-hover">
                      <div class="box-inner">
                                        <div class="actions">
                                        <div class="add_cart">
                                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                        </div>
                                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div> <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
 <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html">Sample Product</a> </div>
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
                          <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $567.00 </span> </p>
                          <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $456.00 </span> </p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Item -->

            <!-- Item -->
            <div class="item">
              <div class="item-inner">
                <div class="item-img">
                  <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product15.jpg"></a>
                    <div class="item-box-hover">
                      <div class="box-inner">
                                        <div class="actions">
                                        <div class="add_cart">
                                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                                        </div>
                                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div> <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a>
 <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                                      </div>
                    </div>
                  </div>
                </div>
                <div class="item-info">
                  <div class="info-inner">
                    <div class="item-title"> <a title="Sample Product" href="product_detail.html">Sample Product</a> </div>
                    <div class="item-content">
                      <div class="rating">
                        <div class="ratings">
                          <div class="rating-box">
                            <div style="width:100%" class="rating"></div>
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
            </div>
            <!-- End Item -->

          </div>
                  </div>

              </div>
            </div>
          </div>--%>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- end main container -->
  <!-- Featured Slider -->
  <%--<section class="featured-pro container wow bounceInUp animated">
    <div class="slider-items-products">
      <div class="new_title center">
        <h2>Featured Products</h2>
      </div>
      <div id="featured-slider" class="product-flexslider hidden-buttons">
        <div class="slider-items slider-width-col4 products-grid">
          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product10.jpg"> </a>
                  <div class="sale-label sale-top-left">sale</div>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                  <div class="item-content">
                    <div class="rating">
                      <div class="ratings">
                        <div class="rating-box">
                          <div style="width:80%" class="rating"></div>
                        </div>
                        <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                      </div>
                    </div>
                    <div class="item-price">
                      <div class="price-box"> <span class="regular-price"> <span class="price">$125.00</span> </span> </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Item -->
          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product11.jpg"></a>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
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
                        <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $567.00 </span> </p>
                        <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $456.00 </span> </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- End Item -->

          <!-- Item -->
          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product12.jpg"></a>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                  <div class="item-content">
                    <div class="rating">
                      <div class="ratings">
                        <div class="rating-box">
                          <div style="width:100%" class="rating"></div>
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
          </div>
          <!-- End Item -->

          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product13.jpg"> </a>
                  <div class="new-label new-top-left">new</div>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                  <div class="item-content">
                    <div class="rating">
                      <div class="ratings">
                        <div class="rating-box">
                          <div style="width:80%" class="rating"></div>
                        </div>
                        <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                      </div>
                    </div>
                    <div class="item-price">
                      <div class="price-box"> <span class="regular-price"> <span class="price">$125.00</span> </span> </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Item -->
          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product14.jpg"></a>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
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
                        <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"> $567.00 </span> </p>
                        <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> $456.00 </span> </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- End Item -->

          <!-- Item -->
          <div class="item">
            <div class="item-inner">
              <div class="item-img">
                <div class="item-img-info"> <a class="product-image" title="Sample Product" href="product_detail.html"> <img alt="Sample Product" src="/user/products-images/product15.jpg"></a>
                  <div class="item-box-hover">
                    <div class="box-inner">
                      <div class="actions">
                        <div class="add_cart">
                          <button class="button btn-cart" type="button"><span>Add to Cart</span></button>
                        </div>
                        <div class="product-detail-bnt"><a href="quick_view.html" class="button detail-bnt"><span>Quick View</span></a></div>
                        <span class="add-to-links"><a href="wishlist.html" class="link-wishlist" title="Add to Wishlist"><span>Add to Wishlist</span></a> <a href="compare.html" class="link-compare add_to_compare" title="Add to Compare"><span>Add to Compare</span></a></span> </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item-info">
                <div class="info-inner">
                  <div class="item-title"> <a title="Sample Product" href="product_detail.html"> Sample Product </a> </div>
                  <div class="item-content">
                    <div class="rating">
                      <div class="ratings">
                        <div class="rating-box">
                          <div style="width:100%" class="rating"></div>
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
          </div>
          <!-- End Item -->

        </div>
      </div>
    </div>
  </section>--%>
  <!-- End Featured Slider -->
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
              <div class="blog-img">
                <img src="/upload/${n.avatar }" alt="Blog image">
                <div class="mask">
                  <a class="info" href="/newsDetails/${n.id}"">Đọc Tiếp</a>
                </div>
              </div>
              <h3>
                <a href="/newsDetails/${n.id}">${n.title }</a>
              </h3>
              <div class="post-date">
                <i class="icon-calendar"></i> ${n.createdDate }
              </div>
              <p>${n.short_news }</p>
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
<script type="text/javascript" src="/user/js/cloud-zoom.js"></script>
<script type="text/javascript" src="/user/js/slider.js"></script>
<script type="text/javascript" src="/user/js/jquery.flexslider.js"></script>

