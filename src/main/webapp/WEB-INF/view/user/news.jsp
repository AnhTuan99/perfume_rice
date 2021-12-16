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
<title>Tin Tức</title>

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
            <li class="home"><a title="Về trang chủ"
                                href="/index">Trang Chủ </a><span>&mdash;</span></li>
            <li class="category13"><strong>Tin Tức</strong></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Breadcrumbs End -->
  <!-- main container -->
  <section class="main-container col2-right-layout bounceInUp animated">
      <div class="main container">
        <div class="row">
          <div class="col-main col-sm-9">
            <div class="page-title">
              <h2>Tin Tức</h2>
            </div>
            <div class="blog-wrapper" id="main">
              <div class="site-content" id="primary">
                <div role="main" id="content">

                  <c:forEach items="${news}" var="n">
                    <article class="blog_entry clearfix">
                      <header class="blog_entry-header clearfix">
                        <div class="blog_entry-header-inner">
                          <h2 class="blog_entry-title"> <a rel="bookmark" href="/newsDetails/${n.id}">${n.title }</a> </h2>
                        </div>
                        <!--blog_entry-header-inner-->
                      </header>
                      <div class="entry-content">
                        <div class="featured-thumb"><a href="/newsDetails/${n.id}"><img class="img-responsive" src="/upload/${n.avatar }" alt="blog image"></a></div>
                        <div class="entry-content">
                            ${n.short_news }
                        </div>
                        <p> <a class="btn"  href="/newsDetails/${n.id}">Đọc Tiếp</a> </p>
                      </div>
                      <footer style="background-color: white" class="entry-meta"> Bài đăng này đã được đăng vào lúc <a rel="category tag" title="View all posts in First Category" href="#"></a>
                        <time class="entry-date">${n.createdDate }</time>
                        . </footer>
                    </article>
                  </c:forEach>
                </div>
              </div>

              <div class="pager">
                <div class="pages">
                  <tag:paginate offset="${productSearch.offset }"
                                count="${productSearch.count }" uri="${pageUrl}" />
                </div>
                <%--<div class="limiter">

                  <select onchange="setLocation(this.value)">
                    <option selected="selected" value="#"> 5 </option>
                    <option value="#"> 10 </option>
                    <option value="#"> 15 </option>
                    <option value="#"> 20 </option>
                    <option value="#"> All </option>
                  </select>
                  per page </div>--%>
              </div>
            </div>
          </div>
          <aside class="col-right sidebar col-sm-3">
            <div role="complementary" class="widget_wrapper13" id="secondary">
              <div class="popular-posts widget widget__sidebar" id="recent-posts-4">
                <h3 class="widget-title">Bài Đăng Phổ Biến</h3>
                <div class="widget-content">
                  <ul class="posts-list unstyled clearfix">
                    <c:forEach items="${searchByPopularPosts}" var="n">
                      <li>
                      <figure class="featured-thumb"> <a href="/newsDetails/${n.id}"> <img width="80" height="53" alt="blog image" src="/upload/${n.avatar }"> </a> </figure>
                      <!--featured-thumb-->
                      <h4><a title="Pellentesque posuere" href="/newsDetails/${n.id}">${n.title }</a></h4>
                      <p class="post-meta"><i class="icon-calendar"></i>
                        <time datetime="2014-07-10T07:09:31+00:00" class="entry-date">${n.createdDate }</time>
                        .</p>
                    </li>
                    </c:forEach>
                  </ul>
                </div>
                <!--widget-content-->
              </div>
              <%--<div class="popular-posts widget widget_categories" id="categories-2">
                <h3 class="widget-title">Categories</h3>
                <ul>
                  <li class="cat-item cat-item-19599"><a href="#">First Category</a></li>
                  <li class="cat-item cat-item-19599"><a href="#">Second Category</a></li>
                </ul>
              </div>--%>
              <!-- Banner Ad Block -->
              <div class="ad-spots widget widget__sidebar">
               <%-- <h3 class="widget-title">Ad Spots</h3>--%>
                <div class="widget-content"><a target="_self" href="#" title=""><img alt="offer banner" src="user/images/offer-banner1.jpg"></a></div>
              </div>
              <!-- Banner Text Block -->
             <%-- <div class="text-widget widget widget__sidebar">
                <h3 class="widget-title">Text Widget</h3>
                <div class="widget-content">Mauris at blandit erat. Nam vel tortor non quam scelerisque cursus. Praesent nunc vitae magna pellentesque auctor. Quisque id lectus.<br>
                  <br>
                  Massa, eget eleifend tellus. Proin nec ante leo ssim nunc sit amet velit malesuada pharetra. Nulla neque sapien, sollicitudin non ornare quis, malesuada.</div>
              </div>--%>
            </div>
          </aside>
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
