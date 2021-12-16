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

		<!-- main container -->
		<div class="main-container col2-right-layout bounceInUp animated">
			<div class="main container">
				<div class="row">
					<section class=" col-lg-12 col-sm-12 col-xs-12">
						<a href="${pageContext.request.contextPath}/">
							<img class=" col-lg-12 col-sm-12 col-xs-12"  class="img-responsive"  src="/user/images/buySuccess.png"/>
							<h1 style="text-align: center">Đặt hàng thành công!</h1>
						</a>

					</section>
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
