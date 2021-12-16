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


  <!-- main container -->
  <div class="main-container col2-right-layout bounceInUp animated">
    <div class="main container">
      <div class="row">
        <div class="col-main col-sm-9">
          <div class="page-title">
            <h2>Tin Tức</h2>
          </div>
          <div class="blog-wrapper" id="main">
            <div class="site-content" id="primary">
              <div role="main" id="content">
                <article class="blog_entry clearfix" >
                  <header class="blog_entry-header clearfix">
                    <div class="blog_entry-header-inner">
                      <h2 class="blog_entry-title"> ${news.title } </h2>
                    </div>
                    <!--blog_entry-header-inner-->
                  </header>
                  <!--blog_entry-header clearfix-->
                  <div class="entry-content">
                    <div class="featured-thumb"><a href="#"><img class="img-responsive" alt="blog-img4" src="/upload/${news.avatar }"/></a></div>
                    <div class="entry-content">
                      ${news.news}
                    </div>
                  </div>
                  <footer style="background-color: white" class="entry-meta"> This entry was posted in <a rel="category tag" title="View all posts in First Category" href="#/first-category">First Category</a> On
                    <time datetime="2014-07-10T06:53:43+00:00" class="entry-date">${news.createdDate }</time>
                    . </footer>
                </article>
               <%-- <div class="comment-content wow bounceInUp animated">
                  <div class="comments-wrapper">
                    <h3> Comments </h3>
                    <ul class="commentlist">
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard">

                            <span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:26:28+00:00" class="entry-date">Thu, Jul 10, 2014 07:26:28 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard">

                            <span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:27:08+00:00" class="entry-date">Thu, Jul 10, 2014 07:27:08 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard">

                            <span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:27:56+00:00" class="entry-date">Thu, Jul 10, 2014 07:27:56 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard">

                            <span class="author">Lisa White</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:28:32+00:00" class="entry-date">Thu, Jul 10, 2014 07:28:32 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. </div>
                        </div>
                      </li>
                      <!--comment-->
                    </ul>
                    <!--commentlist-->
                  </div>
                  <!--comments-wrapper-->

                  <div class="comments-form-wrapper clearfix">
                    <h3>Leave A reply</h3>
                    <form class="comment-form" method="post" id="postComment">
                      <div class="field">
                        <label>Name<em class="required">*</em></label>
                        <input type="text" class="input-text" title="Name" id="user" name="user_name">
                      </div>
                      <div class="field">
                        <label>Email<em class="required">*</em></label>
                        <input type="text" class="input-text" title="Email" id="email" name="user_email">
                      </div>
                      <div class="clear"></div>
                      <div class="field aw-blog-comment-area">
                        <label for="comment">Comment<em class="required">*</em></label>
                        <textarea rows="5" cols="50" class="input-text" title="Comment" id="comment" name="comment"></textarea>
                      </div>
                      <div style="width:96%" class="button-set">
                        <input type="hidden" value="1" name="blog_id">
                        <button type="submit" class="bnt-comment"><span><span>Add Comment</span></span></button>
                      </div>
                    </form>
                  </div>
                  <!--comments-form-wrapper clearfix-->
                </div>--%>
              </div>
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
              <div class="widget-content"><a target="_self" href="#" title=""><img alt="offer banner" src="/user/images/offer-banner1.jpg"></a></div>
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
