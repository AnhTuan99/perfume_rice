<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>


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
<title>Giới Thiệu</title>

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

		<!-- Breadcrumbs -->
		<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<ul>
							<li class="home"><a title="Về trang chủ"
								href="/index">Trang Chủ </a><span>&mdash;</span></li>
							<li class="category13"><strong>Cửa Hàng</strong></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Breadcrumbs End -->
		<!-- main container -->
		<div class="main-container col2-right-layout bounceInUp animated">
			<div class="main container">
				<div class="row">
					<section class="col-main col-sm-9">
						<div class="page-title">
							<h2>Cửa Hàng</h2>
						</div>
						<div class="static-contain">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12">

									<div class="content-page rte">
										<p><iframe allowfullscreen="" frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.9718331239947!2d105.80377401744383!3d21.033813000000016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab6aa40f84ab%3A0xb0af802df5ddf9f!2zQ8O0bmcgdHkgQ-G7lSBQaOG6p24gQ8O0bmcgbmdo4buHIERLVA!5e0!3m2!1svi!2s!4v1466045688721" style="border:0" width="100%"></iframe></p>
									</div>
								</div>
							</div>
						</div>
					</section>
					<aside class="col-right sidebar col-sm-3">
						<div class="block block-company">
							<div class="block-title">Thông Tin </div>
							<div class="block-content">
								<ol id="recently-viewed-items">
									<li class="item odd"><a href="/aboutUs">Giới Thiệu</a></li>
									<li class="item even"><strong><a>Cửa Hàng</a></strong></li>
									<li class="item last"><a href="/contact">Liên Hệ</a></li>
								</ol>
							</div>
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
	<script type="text/javascript">
		function SaveContact() {
			//javaobject
			var data = {};
			data["first_name"] = $("#firstName").val();
			data["email"] = $("#email").val();	
			data["last_name"] = $("#lastName").val();
			data["telephone"] = $("#telephone").val();	
			data["address"] = $("#address").val();
			data["message"] = $("#comment").val();
			$.ajax({
				url : "/contact",
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
</body>

<!-- Tieu Long Lanh Kute -->
</html>
